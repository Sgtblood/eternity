local meta = FindMetaTable("Player")
hook.Add("Initialize", "sql.Initialize", function()
	local config = GAMEMODE:GetConfig("SQL")
	dbal.Connect("connor4_Blob", config.Host, config.User, config.Password, config.DB, config.Port)
end)

hook.Add("OnDBALConnected", "sql.OnDBALConnected", function(key)
	if key ~= "connor4_Blob" then return end
	local chardata = {
		id = {
			Type = "INT",
			PK = true,
			AI = true
		},
		SteamID = {
			Type = "VARCHAR(30)"
		},
		Deleted = {
			Type = "BIT(1)",
			Default = ""
		}
	}

	for k, v in pairs(GAMEMODE.CharacterAccessors) do
		chardata[k] = {
			Type = v.Storetype,
			Default = v.Default
		}

		if v.Storetype == "TEXT" then
			chardata[k].Default = nil
			chardata[k].AllowNull = true
		end
	end

	dbal.RegisterTable("connor4_Blob", "characters", "chars", chardata)
	local playerdata = {
		SteamID = {
			Type = "VARCHAR(30)",
			PK = true
		}
	}

	for k, v in pairs(GAMEMODE.PlayerAccessors) do
		playerdata[k] = {
			Type = v.Storetype,
			Default = v.Default
		}

		if v.Storetype == "TEXT" then
			playerdata[k].Default = nil
			playerdata[k].AllowNull = true
		end
	end

	dbal.RegisterTable("connor4_Blob", "players", "players", playerdata)
	dbal.RegisterTable("connor4_Blob", "items", "items", {
		id = {
			Type = "INT",
			PK = true,
			AI = true
		},
		Class = {
			Type = "VARCHAR(256)"
		},
		StoreType = {
			Type = "INT",
			Default = 0
		},
		StoreID = {
			Type = "INT",
			Default = 0
		},
		StoreName = {
			Type = "VARCHAR(256)",
			Default = ""
		},
		StorePos = {
			Type = "TEXT",
			AllowNull = true
		},
		CustomData = {
			Type = "TEXT",
			AllowNull = true
		},
		ParentID = {
			Type = "INT",
			AllowNull = true
		}
	})

	dbal.SetErrorSuppression("connor4_Blob", true)
	dbal.Query("connor4_Blob", "ALTER TABLE $items ADD CONSTRAINT FK_ParentID FOREIGN KEY (ParentID) REFERENCES $items(id) ON DELETE CASCADE")
	dbal.SetErrorSuppression("connor4_Blob", false)
	dbal.RegisterTable("connor4_Blob", "worldentitites", "worldents", {
		id = {
			Type = "INT",
			PK = true,
			AI = true
		},
		Class = {
			Type = "VARCHAR(256)"
		},
		MapName = {
			Type = "VARCHAR(256)"
		},
		MapPos = {
			Type = "TEXT",
			AllowNull = true
		},
		CustomData = {
			Type = "TEXT",
			AllowNull = true
		}
	})

	dbal.RegisterTable("connor4_Blob", "mapdata", "mapdata", {
		Map = {
			Type = "VARCHAR(256)",
			PK = true
		},
		DataType = {
			Type = "VARCHAR(256)",
			PK = true
		},
		Data = {
			Type = "TEXT",
			AllowNull = true
		}
	})

	dbal.RegisterTable("connor4_Blob", "logs", "logs", {
		id = {
			Type = "INT",
			PK = true,
			AI = true
		},
		Category = {
			Type = "INT"
		},
		Identifier = {
			Type = "VARCHAR(64)"
		},
		Data = {
			Type = "TEXT",
			AllowNull = true
		},
		Timestamp = {
			Type = "INT"
		}
	})

	dbal.RegisterTable("connor4_Blob", "logs_characters", "logchars", {
		logid = {
			Type = "INT",
			PK = true
		},
		charid = {
			Type = "INT",
			PK = true
		}
	})

	dbal.RegisterTable("connor4_Blob", "logs_items", "logitems", {
		logid = {
			Type = "INT",
			PK = true
		},
		itemid = {
			Type = "INT",
			PK = true
		}
	})

	dbal.RegisterTable("connor4_Blob", "logs_players", "logplayers", {
		logid = {
			Type = "INT",
			PK = true
		},
		steamid = {
			Type = "VARCHAR(30)",
			PK = true
		}
	})

	dbal.SetErrorSuppression("connor4_Blob", true)
	dbal.Query("connor4_Blob", "ALTER TABLE $logchars ADD CONSTRAINT FK_charid FOREIGN KEY (logid) REFERENCES $logs(id) ON DELETE CASCADE")
	dbal.Query("connor4_Blob", "ALTER TABLE $logitems ADD CONSTRAINT FK_charid FOREIGN KEY (logid) REFERENCES $logs(id) ON DELETE CASCADE")
	dbal.Query("connor4_Blob", "ALTER TABLE $logplayers ADD CONSTRAINT FK_charid FOREIGN KEY (logid) REFERENCES $logs(id) ON DELETE CASCADE")
	dbal.SetErrorSuppression("connor4_Blob", false)
end)

netstream.Hook("RequestCharacters", function(ply, data)
	local data = dbal.Query("connor4_Blob", "SELECT id, RPName, Species, WorldArea from $chars WHERE SteamID = ? AND Deleted = 0", ply:SteamID())
	local characters = {}
	for _, v in ipairs(data) do
		characters[v.id] = {
			RPName = v.RPName,
			Species = v.Species,
			WorldArea = v.WorldArea
		}
	end

	if not IsValid(ply) then return end
	ply:SetCharacters(characters)
	ply:LoadPlayer()
	playerreg.Update(ply)
	playerreg.StartTimer(ply)
	ply:OpenGUI("CharSelect")
end, {})

function meta:SaveCharacterAccessor(key, value)
	if self.SuppressCharacterChanges then return end
	if value == nil then value = GAMEMODE.CharacterAccessors[key].Default end
	dbal.Update("connor4_Blob", "$chars", {
		[key] = value
	}, "id = ?", self:CharID(), stub)
end

function meta:SavePlayerAccessor(key, value)
	if self.SuppressPlayerChanges then return end
	if value == nil then value = GAMEMODE.PlayerAccessors[key].Default end
	dbal.Update("connor4_Blob", "$players", {
		[key] = value
	}, "SteamID = ?", self:SteamID(), stub)
end

function meta:LoadPlayer()
	local data = dbal.Query("connor4_Blob", "SELECT * FROM $players WHERE SteamID = ?", self:SteamID())[1]
	self.SuppressPlayerChanges = true
	for k, v in pairs(data) do
		local accessor = GAMEMODE.PlayerAccessors[k]
		if accessor then
			if accessor.Storetype == "BOOLEAN" then v = tobool(v) end
			self["Set" .. k](self, v)
		end
	end

	self.SuppressPlayerChanges = false
	self:SetPlayerLoaded(true)
	hook.Run("PostPlayerLoad", self)
end

function GM:SetPlayerWorldArea(admin, charid, area)
	dbal.Update("connor4_Blob", "$chars", {
		["WorldArea"] = area
	}, "id = ?", charid, stub)
end

function GM:CharacterExists(target, charid)
	local steamid = nil
	if isstring(target) then
		steamid = target
	else
		steamid = target:SteamID()
	end
	return dbal.Query("connor4_Blob", "SELECT id from $chars WHERE id = ? AND SteamID = ? AND Deleted = 0", charid, steamid)[1] ~= nil
end

function GM:GetAccountCharacters(admin, ply)
	local steamid = nil
	if isstring(ply) then
		steamid = ply
	else
		steamid = ply:SteamID()
	end

	local data = dbal.Query("connor4_Blob", "SELECT id, RPName, WorldArea from $chars WHERE SteamID = ? AND Deleted = 0", steamid)
	admin:PrintMessage(HUD_PRINTCONSOLE, "Characters for " .. steamid)
	for _, v in ipairs(data) do
		admin:PrintMessage(HUD_PRINTCONSOLE, v.id .. ": " .. v.RPName .. " (" .. v.WorldArea .. ")")
	end
end

function GM:GetMapData(index)
	local tab = dbal.Query("connor4_Blob", "SELECT Data FROM $mapdata WHERE Map = ? AND DataType = ?", string.lower(game.GetMap()), index)[1]
	if tab then
		return pon.decode(tab.Data)
	else
		return {}
	end
end

function GM:SaveMapData(index, data)
	coroutine.WrapFunc(function()
		local map = string.lower(game.GetMap())
		data = pon.encode(data)
		-- Attempt to insert first, in-case the row doesn't exist yet
		dbal.Insert("connor4_Blob", "$mapdata", {
			Map = map,
			DataType = index
		}, true)

		dbal.Update("connor4_Blob", "$mapdata", {
			Data = data
		}, "Map = ? AND DataType = ?", string.lower(game.GetMap()), index)
	end)
end