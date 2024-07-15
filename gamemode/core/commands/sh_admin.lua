if CLIENT then
	netstream.Hook("ItemList", function(data)
		if #data.Class > 0 then
			log.Default(string.format("Available items: (Filter: %s)", data.Class))
		else
			log.Default("Available items:")
		end

		local itemlist = GAMEMODE.ItemClasses

		for class,_ in pairs(GAMEMODE:GetConfig("SpecialItemFunctions")) do
			if string.find(class, data.Class, 1, true) then
				itemlist[class] = true
			end
		end

		for class in SortedPairs(itemlist) do
			if string.find(class, data.Class, 1, true) then
				log.Default(string.format("  %s", class))
			end
		end
	end)

	netstream.Hook("MapList", function(data)
		if #data.Map > 0 then
			log.Default(string.format("Available maps: (Filter: %s)", data.Map))
		else
			log.Default("Available maps:")
		end

		for _, v in pairs(data.Maps) do
			if string.find(v, data.Map, 1, true) then
				log.Default(string.format("  %s", v))
			end
		end
	end)

	local function StopMusic()
		if IsValid(GAMEMODE.PlayMusic) then
			GAMEMODE.PlayMusic:Stop()
			GAMEMODE.PlayMusic = nil
			GAMEMODE.PlayMusicVolume = nil
		end
	end

	local function PlayMusicCallback(nick, sound, channel, volume)
		-- Mute the track instead of killing it in the case a user enables effects mid-event.
		if GAMEMODE:GetSetting("sounds_music") then
			channel:SetVolume(volume * GAMEMODE:GetSetting("sounds_music_volume"))
		else
			channel:SetVolume(0)
		end
	
		channel:Play()
	
		GAMEMODE.PlayMusic = channel
		GAMEMODE.PlayMusicVolume = volume
	
		log.Default(string.format("%s has played music (%s), you can stop this with rp_stopmusic", nick, sound))
	end

	netstream.Hook("PlayMusic", function(data)
		StopMusic()

		if not file.Exists(data.Sound, "GAME") then
			sound.PlayURL(data.Sound, "mono", function(channel, errID, errName)
				if not IsValid(channel) then
					log.Default(string.format("Failed to play a music URL (%s)!", errName))
					return
				end

				PlayMusicCallback(data.Nick, data.Sound, channel, data.Volume)
			end)
		else
			sound.PlayFile(data.Sound, "mono", function(channel, errID, errName)
				if not IsValid(channel) then
					log.Default(string.format("Failed to play a music file (%s)!", errName))
					return
				end

				PlayMusicCallback(data.Nick, data.Sound, channel, data.Volume)
			end)
		end
	end)

	local function StopEffect()
		if IsValid(GAMEMODE.PlayEffect) then
			GAMEMODE.PlayEffect:Stop()
			GAMEMODE.PlayEffect = nil
			GAMEMODE.PlayEffectVolume = nil
		end
	end

	local function PlayEffectCallback(nick, sound, channel, volume)
		-- Mute the track instead of killing it in the case a user enables effects mid-event.
		if GAMEMODE:GetSetting("sounds_effect") then
			channel:SetVolume(volume * GAMEMODE:GetSetting("sounds_effect_volume"))
		else
			channel:SetVolume(0)
		end
	
		channel:Play()
	
		GAMEMODE.PlayEffect = channel
		GAMEMODE.PlayEffectVolume = volume
	
		log.Default(string.format("%s has played an effect (%s), you can stop this with rp_stopeffect", nick, sound))
	end

	netstream.Hook("PlayEffect", function(data)
		StopEffect()

		if not file.Exists(data.Sound, "GAME") then
			sound.PlayURL(data.Sound, "mono", function(channel, errID, errName)
				if not IsValid(channel) then
					log.Default(string.format("Failed to play an effect URL (%s)!", errName))
					return
				end

				PlayEffectCallback(data.Nick, data.Sound, channel, data.Volume)
			end)
		else
			sound.PlayFile(data.Sound, "mono", function(channel, errID, errName)
				if not IsValid(channel) then
					log.Default(string.format("Failed to play an effect file (%s)!", errName))
					return
				end

				PlayEffectCallback(data.Nick, data.Sound, channel, data.Volume)
			end)
		end
	end)

	netstream.Hook("StopMusic", function()
		StopMusic()
	end)

	netstream.Hook("StopEffect", function()
		StopEffect()
	end)

	netstream.Hook("StopSound", function()
		RunConsoleCommand("stopsound")
	end)
end

console.AddCommand("rpa_changelevel", function(ply, map)
	local maps = game.GetMaps()

	if not table.HasValue(maps, map) then
		netstream.Send("MapList", {
			Map = map,
			Maps = maps
		}, ply)

		return
	end

	GAMEMODE:WriteLog("admin_changelevel", {
		Admin = GAMEMODE:LogPlayer(ply),
		Map = map
	})

	file.Write(string.format("eternity/maps/%s.txt", game.GetPort()), map)

	RunConsoleCommand("changelevel", map)
end, COMMAND_ADMIN, {CTYPE_STRING}, {},
"Server", "Changes the current map or displays a filtered list.")

console.AddCommand("rpa_restart", function(ply)
	GAMEMODE:WriteLog("admin_restart", {Admin = GAMEMODE:LogPlayer(ply)})

	RunConsoleCommand("changelevel", game.GetMap())
end, COMMAND_ADMIN, {}, {},
"Server", "Restarts the server.")

console.AddCommand("rpa_playmusic", function(ply, snd, volume)
	if volume == 0 then
		volume = 1
	end

	volume = math.Clamp(volume, 0, 1)

	netstream.Send("PlayMusic", {
		Nick = ply:Nick(),
		Volume = volume,
		Sound = snd
	})

	GAMEMODE:WriteLog("admin_playmusic", {
		Admin = GAMEMODE:LogPlayer(ply),
		Sound = snd,
		Volume = volume
	})
end, COMMAND_MUSIC, {CTYPE_STRING, CTYPE_NUMBER}, {},
"Sound", "Plays any sound file mounted on the server or URL audio file to the server's music stream.")

console.AddCommand("rpa_stopmusic", function(ply)
	netstream.Send("StopMusic")
end, COMMAND_MUSIC, {}, {},
"Sound", "Stops any currently playing music files.")

console.AddCommand("rpa_playeffect", function(ply, snd, volume)
	if volume == 0 then
		volume = 1
	end

	volume = math.Clamp(volume, 0, 1)

	netstream.Send("PlayEffect", {
		Nick = ply:Nick(),
		Volume = volume,
		Sound = snd
	})

	GAMEMODE:WriteLog("admin_playeffect", {
		Admin = GAMEMODE:LogPlayer(ply),
		Sound = snd,
		Volume = volume
	})
end, COMMAND_MUSIC, {CTYPE_STRING, CTYPE_NUMBER}, {},
"Sound", "Plays any sound file mounted on the server or URL audio file to the server's effect stream.")

console.AddCommand("rpa_stopeffect", function(ply)
	netstream.Send("StopEffect")
end, COMMAND_MUSIC, {}, {},
"Sound", "Stops any currently playing effect files.")

console.AddCommand("rpa_playpreview", function(ply, snd, volume)
	if volume == 0 then
		volume = 1
	end

	volume = math.Clamp(volume, 0, 1)

	netstream.Send("PlayMusic", {
		Nick = ply:Nick(),
		Volume = volume,
		Sound = snd
	}, ply)
end, COMMAND_MUSIC, {CTYPE_STRING, CTYPE_NUMBER}, {},
"Sound", "Plays any sound file mounted on the server or URL audio file to you alone.")

console.AddCommand("rpa_stopsound", function(ply)
	netstream.Send("StopSound")
end, COMMAND_ADMIN, {}, {},
"Sound", "Forces clients to run the stopsound command.")

console.AddCommand("rpa_heal", function(ply, targets)
	for _, v in pairs(targets) do
		v:SetHealth(v:GetMaxHealth())
		v:SendChat("NOTICE", string.format("%s has healed you", PlayerName(ply)))

		GAMEMODE:WriteLog("admin_heal", {
			Admin = GAMEMODE:LogPlayer(ply),
			Char = GAMEMODE:LogCharacter(v),
			Ply = GAMEMODE:LogPlayer(v)
		})
	end

	Feedback(ply, string.format("You've healed %s", TargetName(targets, "RPName")))
end, COMMAND_ADMIN, {CTYPE_PLAYER}, {},
"Player", "Heals a player to full.")

-- console.AddCommand("rpa_setplayerscale", function(ply, target, value)
		-- val = math.Clamp(val, 0.1, 10)
		-- targ:SetPlayerScale(val, true)

		-- GAMEMODE:WriteLog("admin_scale", {
			-- Admin = GAMEMODE:LogPlayer(ply),
			-- Char = GAMEMODE:LogCharacter(v),
			-- Ply = GAMEMODE:LogPlayer(v)
	--	})
--	end

	-- Feedback(ply, string.format("You've set the height for %s", TargetName(target, "RPName")))
-- COMMAND_ADMIN, {CTYPE_PLAYER}, {},
-- "Player", "Sets a players height.")

console.AddCommand("rpa_slap", function(ply, targets)
	local vec = VectorRand()

	vec.z = math.abs(vec.z)
	vec = vec * 600

	for _, v in pairs(targets) do
		v:SetVelocity(vec)
		v:SendChat("NOTICE", string.format("%s has slapped you", PlayerName(ply)))

		GAMEMODE:WriteLog("admin_slap", {
			Admin = GAMEMODE:LogPlayer(ply),
			Char = GAMEMODE:LogCharacter(v),
			Ply = GAMEMODE:LogPlayer(v)
		})
	end
end, COMMAND_ADMIN, {CTYPE_PLAYER}, {CFLAG_CHECKIMMUNITY},
"Player", "Slaps a player, sending them flying in a random direction.")

local classLib = class

console.AddCommand("rpa_createitem", function(ply, class, args)
	local itemclass = GAMEMODE.ItemClasses[class] and classLib.Get(class)
	local special = GAMEMODE:GetConfig("SpecialItemFunctions")[class]
	if not itemclass and not special then
		netstream.Send("ItemList", {
			Class = class
		}, ply)

		return
	end

	if itemclass and itemclass.Secure and not ply:IsSuperAdmin() then
		ply:SendChat("ERROR", "You are not allowed to spawn this entity.")

		return
	end

	local item = nil

	if special then
		item = GAMEMODE:CreateItem(special.Class)

		special.Function(item)
	else
		item = GAMEMODE:CreateItem(class)
	end

	item:ProcessArguments(args)
	item:SetWorldItem(ply:GetItemDropLocation(), Angle())

	GAMEMODE:WriteLog("item_spawned", {
		Ply = GAMEMODE:LogPlayer(ply),
		Item = GAMEMODE:LogItem(item)
	})
end, COMMAND_ADMIN, {CTYPE_STRING, CTYPE_STRING}, {CFLAG_NOCONSOLE},
"Items", "Creates a new item or displays a filtered list.")

console.AddClientCommand("rpa_getitemtags", function(ply, target)
	log.Default("Active item tags:")
	local itemlist = GAMEMODE.ItemClasses

	local tags = {}

	for classname in SortedPairs(itemlist) do
		for _,tag in SortedPairs(class.Get(classname):GetTags()) do
			if tags[tag] then
				continue
			end

			tags[tag] = true
		end
	end

	for tag in SortedPairs(tags) do
		log.Default(string.format("  %s", string.lower(tag)))
	end
end, COMMAND_ADMIN, {}, {},
"Items", "Displays a list of all applicable item tags in the gamemode.")

console.AddCommand("rpa_createcustomitem", function(ply)

	local item = GAMEMODE:CreateItem("generic_custom")

	item:SetWorldItem(ply:GetItemDropLocation(), Angle())

	GAMEMODE:WriteLog("item_spawned", {
		Ply = GAMEMODE:LogPlayer(ply),
		Item = GAMEMODE:LogItem(item)
	})
end, COMMAND_CUSTOMITEMS, {}, {CFLAG_NOCONSOLE},
"Items", "Creates a new custom item template.")

console.AddCommand("rpa_togglesaved", function(ply)
	local ent = ply:GetEyeTrace().Entity

	if not IsValid(ent) or not PERMAPROP_CLASSES[ent:GetClass()] or not ent:SteamID() then
		return
	end

	if permaprops_in_session < GAMEMODE:GetConfig("PermaPropLimit") then
		ent:SetPermaProp(not ent:PermaProp())
		if ent:PermaProp() then
			permaprops_in_session = permaprops_in_session + 1 -- Keep track of the changed number of permaprops
		else
			permaprops_in_session = permaprops_in_session - 1 -- Keep track of the changed number of permaprops
		end
	else -- Disable saving if the limit has been exceeded, only remove.

	if ent:PermaProp() == true then
		ent:SetPermaProp(false)
		permaprops_in_session = permaprops_in_session - 1 -- Keep track of the changed number of permaprops
	else
		Feedback(ply, "Perma prop limit reached. Remove another perma prop to save this one.")
	end	


		Feedback(ply, string.format("Permaprop limit has been reached! Removing permaprop %s.", ent:GetModel()))
	end

	undo.ReplaceEntity(ent, NULL)
	cleanup.ReplaceEntity(ent, NULL)

	constraint.RemoveAll(ent)

	local phys = ent:GetPhysicsObject()

	if IsValid(phys) then
		phys:EnableMotion(false)
		phys:Sleep()
	end

	if string.StartWith(ent:GetClass(), "prop") then
		GAMEMODE:WriteLog("admin_togglesaved", {
			Admin = GAMEMODE:LogPlayer(ply),
			Saved = ent:PermaProp(),
			Model = ent:GetModel(),
			SteamID = ent:SteamID()
		})
	else
		GAMEMODE:WriteLog("admin_toggleeditor", {
			Admin = GAMEMODE:LogPlayer(ply),
			Saved = ent:PermaProp(),
			Class = ent:GetClass(),
			SteamID = ent:SteamID()
		})
	end
end, COMMAND_ADMIN, {}, {CFLAG_NOCONSOLE},
"Sandbox", "Saves the prop or effect you're looking at, making it unable to be edited and persist through restarts/map changes.")

console.AddCommand("rpa_seeall", function(ply)
	local noclipseeall = GAMEMODE:NoclipSeeall()

	if ply:IsInNoClip() and noclipseeall == true or noclipseeall == false then
		ply:SetSetting("seeall_enabled", not ply:GetSetting("seeall_enabled"))
		GAMEMODE:WriteLog("admin_seeall", {
			Admin = GAMEMODE:LogPlayer(ply)
		})
	end

end, COMMAND_ADMIN, {}, {CFLAG_NOCONSOLE},
"Clientside", "Toggles seeall on or off.")

console.AddCommand("rpa_mute", function(ply, targets)
	for _, v in pairs(targets) do
		v:SetOOCMuted(true)
		v:SendChat("NOTICE", string.format("%s has muted you from OOC", PlayerName(ply)))

		GAMEMODE:WriteLog("admin_oocmute", {
			Muted = true,
			Admin = GAMEMODE:LogPlayer(ply),
			Char = GAMEMODE:LogCharacter(v),
			Ply = GAMEMODE:LogPlayer(v)
		})
	end

	Feedback(ply, string.format("You've muted %s from OOC", TargetName(targets, "Nick")))
end, COMMAND_ADMIN, {CTYPE_PLAYER}, {CFLAG_CHECKIMMUNITY},
"Player", "Mutes a player from OOC.")

console.AddCommand("rpa_muteglobalemotes", function(ply, targets)
	for _, v in pairs(targets) do
		v:SetGlobalICMuted(true)
		v:SendChat("NOTICE", string.format("%s has muted you from global emotes chat", PlayerName(ply)))

		GAMEMODE:WriteLog("admin_globalemotesmute", {
			Muted = true,
			Admin = GAMEMODE:LogPlayer(ply),
			Char = GAMEMODE:LogCharacter(v),
			Ply = GAMEMODE:LogPlayer(v)
		})
	end

	Feedback(ply, string.format("You've muted %s from global emotes chat", TargetName(targets, "Nick")))
end, COMMAND_ADMIN, {CTYPE_PLAYER}, {CFLAG_CHECKIMMUNITY},
"Player", "Mutes a player from global emotes chat.")

console.AddCommand("rpa_unmute", function(ply, targets)
	for _, v in pairs(targets) do
		v:SetOOCMuted(false)
		v:SendChat("NOTICE", string.format("%s has unmuted you from OOC", PlayerName(ply)))

		GAMEMODE:WriteLog("admin_oocmute", {
			Admin = GAMEMODE:LogPlayer(ply),
			Char = GAMEMODE:LogCharacter(v),
			Ply = GAMEMODE:LogPlayer(v)
		})
	end

	Feedback(ply, string.format("You've unmuted %s from OOC", TargetName(targets, "Nick")))
end, COMMAND_ADMIN, {CTYPE_PLAYER}, {CFLAG_CHECKIMMUNITY},
"Player", "Unmutes a player from OOC.")

console.AddCommand("rpa_unmuteglobalemotes", function(ply, targets)
	for _, v in pairs(targets) do
		v:SetGlobalICMuted(false)
		v:SendChat("NOTICE", string.format("%s has unmuted you from global emotes chat", PlayerName(ply)))

		GAMEMODE:WriteLog("admin_globalemotesmute", {
			Admin = GAMEMODE:LogPlayer(ply),
			Char = GAMEMODE:LogCharacter(v),
			Ply = GAMEMODE:LogPlayer(v)
		})
	end

	Feedback(ply, string.format("You've unmuted %s from global emotes chat", TargetName(targets, "Nick")))
end, COMMAND_ADMIN, {CTYPE_PLAYER}, {CFLAG_CHECKIMMUNITY},
"Player", "Unmutes a player from global emotes chat.")

console.AddCommand("rpa_kill", function(ply, targets)
	for _, v in pairs(targets) do
		v:Kill()
		v:SendChat("NOTICE", string.format("%s has killed you", PlayerName(ply)))

		GAMEMODE:WriteLog("admin_kill", {
			Admin = GAMEMODE:LogPlayer(ply),
			Char = GAMEMODE:LogCharacter(v),
			Ply = GAMEMODE:LogPlayer(v)
		})
	end

	Feedback(ply, string.format("You've killed %s", TargetName(targets, "RPName")))
end, COMMAND_ADMIN, {CTYPE_PLAYER}, {CFLAG_CHECKIMMUNITY},
"Player", "Kills a player.")

console.AddCommand("rpa_charid", function(ply, target)
	ply:SendChat("NOTICE", target:VisibleRPName() .. "\'s character creation index is: " .. target:CharID())
end, COMMAND_ADMIN, {CTYPE_PLAYER}, {CFLAG_FORCESINGLETARGET}, "Character", "Prints the character's creation index.")

console.AddCommand("rpa_setspeciesstate", function(ply, target, state)
	local species = target:GetActiveSpecies()

	if species.SpeciesStates[state] then
		target:SetSpeciesState(state)

		target:SendChat("NOTICE", string.format("%s has set your species state to %s", PlayerName(ply), state))
		ply:SendChat("NOTICE", string.format("You have set %s's species state to %s", PlayerName(target), state))
	
		GAMEMODE:WriteLog("admin_speciesstate", {
			Admin = GAMEMODE:LogPlayer(ply),
			Char = GAMEMODE:LogCharacter(target),
			Ply = GAMEMODE:LogPlayer(target),
			State = state
		})
	else
		Feedback(ply, string.format("%s's species doesn't have that state!", TargetName(target, "RPName")), "ERROR")
	end
end, COMMAND_ADMIN, {CTYPE_PLAYER, CTYPE_STRING}, {CFLAG_FORCESINGLETARGET}, "Character", "Set the state of a character's species.")

console.AddCommand("rpa_setcharname", function(ply, target, name)
	target:SetRPName(name)

	target:SendChat("NOTICE", string.format("%s has set your character name to %s", PlayerName(ply), name))
	ply:SendChat("NOTICE", string.format("You have set %s's character name to %s", PlayerName(target), name))
end, COMMAND_ADMIN, {CTYPE_PLAYER, CTYPE_STRING}, {CFLAG_FORCESINGLETARGET}, "Character", "Set the name of a character.")

console.AddCommand("rpa_resethunger", function(ply, target)
	target:SetHungerBar(0)

	target:SendChat("NOTICE", string.format("%s has reset your hunger", PlayerName(ply)))

	GAMEMODE:WriteLog("admin_hunger", {
		Admin = GAMEMODE:LogPlayer(ply),
		Char = GAMEMODE:LogCharacter(target),
		Ply = GAMEMODE:LogPlayer(target),
		Hunger = 0
	})
end, COMMAND_ADMIN, {CTYPE_PLAYER}, {CFLAG_CHECKIMMUNITY, CFLAG_FORCESINGLETARGET}, "Character", "Resets a character's hunger to zero.")

console.AddCommand("rpa_sethunger", function(ply, target, value)
	value = math.Clamp(value, 0, GAMEMODE:GetConfig("HungerMax"))
	
	target:SetHungerBar(value)

	target:SendChat("NOTICE", string.format("%s has set your hunger to %i", PlayerName(ply), value))

	GAMEMODE:WriteLog("admin_hunger", {
		Admin = GAMEMODE:LogPlayer(ply),
		Char = GAMEMODE:LogCharacter(target),
		Ply = GAMEMODE:LogPlayer(target),
		Hunger = value
	})
end, COMMAND_ADMIN, {CTYPE_PLAYER, CTYPE_NUMBER}, {CFLAG_CHECKIMMUNITY, CFLAG_FORCESINGLETARGET}, "Character", "Manually sets a character's hunger.")



console.AddCommand("rpa_setcharmodel", function(ply, target, model)
	if not util.IsValidModel(model) then
		Feedback(ply, string.format("%s is not a valid model!", model), "ERROR")

		return
	end

	target:SetCharModel(model)
	target:HandlePlayerModel()

	target:SendChat("NOTICE", string.format("%s set your model to %s", PlayerName(ply), model))

	GAMEMODE:WriteLog("admin_charmodel", {
		Admin = GAMEMODE:LogPlayer(ply),
		Char = GAMEMODE:LogCharacter(target),
		Ply = GAMEMODE:LogPlayer(target),
		Model = model
	})

	Feedback(ply, string.format("You've set %s's model to %s", TargetName(target, "RPName"), model))
end, COMMAND_ADMIN, {CTYPE_PLAYER, CTYPE_STRING}, {CFLAG_CHECKIMMUNITY, CFLAG_FORCESINGLETARGET},
"Character", "Sets a character's model.")

console.AddCommand("rpa_setcharskin", function(ply, target, nr)
	target:SetCharSkin(nr)
	target:HandlePlayerModel()

	target:SendChat("NOTICE", string.format("%s set your skin to %s", PlayerName(ply), nr))

	GAMEMODE:WriteLog("admin_charskin", {
		Admin = GAMEMODE:LogPlayer(ply),
		Char = GAMEMODE:LogCharacter(target),
		Ply = GAMEMODE:LogPlayer(target),
		Skin = nr
	})

	Feedback(ply, string.format("You've set %s's skin to %s", TargetName(target, "RPName"), nr))
end, COMMAND_ADMIN, {CTYPE_PLAYER, CTYPE_NUMBER}, {CFLAG_CHECKIMMUNITY, CFLAG_FORCESINGLETARGET},
"Character", "Sets a character's skin.")

console.AddCommand("rpa_oocdelay", function(ply, delay)
	delay = math.Clamp(delay, -1, 86400)

	GAMEMODE:SetOOCDelay(delay)

	if delay > -1 then
		GAMEMODE:SendChat("NOTICE", string.format("%s has set the OOC delay to %s.", ply:Nick(), string.NiceTime(delay)))
	else
		GAMEMODE:SendChat("NOTICE", string.format("%s has disabled OOC chat.", ply:Nick()))
	end
end, COMMAND_ADMIN, {CTYPE_NUMBER}, {},
"Server", "Sets the OOC delay, or disables it.")

console.AddCommand("rpa_enableglobalemotes", function(ply, bool)
	GAMEMODE:SetEnableGlobalEmotes(bool)

	if bool then
		GAMEMODE:SendChat("NOTICE", string.format("%s has enabled global emotes chat.", ply:Nick()))
	else
		GAMEMODE:SendChat("NOTICE", string.format("%s has disabled global emotes chat.", ply:Nick()))
	end
end, COMMAND_ADMIN, {CTYPE_BOOL}, {},
"Server", "Enables or disables the use of the global emotes chat commands.")

console.AddCommand("rpa_yell", function(ply, msg)
	local tab = {
		Name = ply:VisibleRPName(),
		Text = msg
	} -- Don't have to set __Type because GM:SendChat modifies the original table

	GAMEMODE:SendChat("ADMINYELL", tab)
	GAMEMODE:WriteLog("chat_ayell", tab)
end, COMMAND_ADMIN, {CTYPE_STRING}, {},
"Misc", "Prints a massive message in everyone's chat box")

console.AddCommand("rpa_ko", function(ply, targets)
	for _, v in pairs(targets) do
		v:SetConsciousness(0)
		v:SendChat("NOTICE", string.format("%s has knocked you out", PlayerName(ply)))

		GAMEMODE:WriteLog("admin_ko", {
			Admin = GAMEMODE:LogPlayer(ply),
			Char = GAMEMODE:LogCharacter(v),
			Ply = GAMEMODE:LogPlayer(v),
			Ko = true
		})
	end

	Feedback(ply, string.format("You've knocked out %s", TargetName(targets, "RPName")))
end, COMMAND_ADMIN, {CTYPE_PLAYER}, {CFLAG_CHECKIMMUNITY},
"Player", "Knocks someone out")

console.AddCommand("rpa_wake", function(ply, targets)
	for _, v in pairs(targets) do
		v:SetConsciousness(100)
		v:SendChat("NOTICE", string.format("%s woke you up", PlayerName(ply)))

		GAMEMODE:WriteLog("admin_ko", {
			Admin = GAMEMODE:LogPlayer(ply),
			Char = GAMEMODE:LogCharacter(v),
			Ply = GAMEMODE:LogPlayer(v)
		})
	end

	Feedback(ply, string.format("You've woken up %s", TargetName(targets, "RPName")))
end, COMMAND_ADMIN, {CTYPE_PLAYER}, {CFLAG_CHECKIMMUNITY},
"Player", "Wake someone up")

console.AddCommand("rpa_restrain", function(ply, targets)
	for _, v in pairs(targets) do
		v:SetRestrained(true)
		v:SendChat("NOTICE", string.format("%s has restrained you", PlayerName(ply)))

		GAMEMODE:WriteLog("admin_restrain", {
			Admin = GAMEMODE:LogPlayer(ply),
			Char = GAMEMODE:LogCharacter(v),
			Ply = GAMEMODE:LogPlayer(v),
			Restrained = true
		})
	end

	Feedback(ply, string.format("You've restrained %s", TargetName(targets, "RPName")))
end, COMMAND_ADMIN, {CTYPE_PLAYER}, {CFLAG_CHECKIMMUNITY},
"Player", "Restrain a character")

console.AddCommand("rpa_release", function(ply, targets)
	for _, v in pairs(targets) do
		v:SetRestrained(false)
		v:SendChat("NOTICE", string.format("%s has removed your restraints", PlayerName(ply)))

		GAMEMODE:WriteLog("admin_restrain", {
			Admin = GAMEMODE:LogPlayer(ply),
			Char = GAMEMODE:LogCharacter(v),
			Ply = GAMEMODE:LogPlayer(v)
		})
	end

	Feedback(ply, string.format("You've removed %s's restraints", TargetName(targets, "RPName")))
end, COMMAND_ADMIN, {CTYPE_PLAYER}, {},
"Player", "Remove a character's restraints")

console.AddCommand("rpa_adminradio", function(ply, bool)
	ply:SetSetting("admin_radio", bool)
end, COMMAND_ADMIN, {CTYPE_BOOL}, {},
"Misc", "Set your admin radio setting")

console.AddCommand("rpa_editinventory", function(ply, target)
	ply:OpenGUI("InventoryPopup", target:VisibleRPName(), {target:GetInventory("Main").NetworkID})

	local species = target:GetActiveSpecies()

	if #species.EquipmentSlots > 0 then
		local slots = {}

		for _, v in pairs(species.EquipmentSlots) do
			local inventory = target:GetInventory(v)

			if not inventory then
				continue
			end

			table.insert(slots, inventory.NetworkID)
		end

		if #slots > 0 then
			ply:OpenGUI("InventoryPopup", target:VisibleRPName(), slots)
		end
	end

	if #species.WeaponSlots > 0 then
		local slots = {}

		for _, v in pairs(species.WeaponSlots) do
			local inventory = target:GetInventory(v)

			if not inventory then
				continue
			end

			table.insert(slots, inventory.NetworkID)
		end

		if #slots > 0 then
			ply:OpenGUI("InventoryPopup", target:VisibleRPName(), slots)
		end
	end

	netstream.Send("HideGameUI", {}, ply)
end, COMMAND_ADMIN, {CTYPE_PLAYER}, {CFLAG_FORCESINGLETARGET, CFLAG_NOCONSOLE}, "Player", "Open a player's inventory")

console.AddCommand("rpa_editstash", function(ply, target)
	local species = target:GetActiveSpecies()

	if not species.AllowStash then
		Feedback(ply, string.format("%s can't have a stash!", TargetName(target, "RPName")), "ERROR")

		return
	end

	ply:OpenGUI("InventoryPopup", target:VisibleRPName(), {target:GetInventory("Stash").NetworkID})
	netstream.Send("HideGameUI", {}, ply)
end, COMMAND_ADMIN, {CTYPE_PLAYER}, {CFLAG_FORCESINGLETARGET, CFLAG_NOCONSOLE}, "Player", "Open a player's stash if they have one")

console.AddCommand("rpa_infiniteammo", function(ply, targets)
	for _, v in pairs(targets) do
		v:SetInfiniteAmmo(true)
		v:SendChat("NOTICE", string.format("%s has given you infinite ammo", PlayerName(ply)))
	end

	Feedback(ply, string.format("You've given %s infinite ammo", TargetName(targets, "RPName")))
end, COMMAND_ADMIN, {CTYPE_PLAYER}, {},
"Player", "Give a player infinite ammo")

console.AddCommand("rpa_finiteammo", function(ply, targets)
	for _, v in pairs(targets) do
		v:SetInfiniteAmmo(false)
		v:SendChat("NOTICE", string.format("%s has taken your infinite ammo", PlayerName(ply)))
	end

	Feedback(ply, string.format("You've taken %s's infinite ammo", TargetName(targets, "RPName")))
end, COMMAND_ADMIN, {CTYPE_PLAYER}, {},
"Player", "Remove a player's infinite ammo")

console.AddCommand("rpa_findentity", function(ply, entclass)
	local tab = ents.FindByClass(entclass)

	if #tab < 1 then
		ply:SendChat("ERROR", "No entities found.")

		return
	end

	local offset = ply:EyePos() - ply:GetPos()

	ply:SetPos(table.Random(tab):GetPos() - offset)
end, COMMAND_ADMIN, {CTYPE_STRING}, {CFLAG_NOCONSOLE},
"Misc", "Teleport yourself to a random instance of an entity class")

console.AddCommand("rpa_jamfrequency", function(ply, freq, bool)
	GAMEMODE.JammedFrequencies[freq] = bool
end, COMMAND_ADMIN, {CTYPE_NUMBER, CTYPE_BOOL}, {},
"Admin", "Jams a certain radio frequency")

console.AddCommand("rpa_jamcommon", function(ply, bool)
	GAMEMODE.JammedCommon = bool
end, COMMAND_ADMIN, {CTYPE_BOOL}, {},
"Admin", "Jams all frequencies under 1000")

console.AddCommand("rpa_togglehiddenteam", function(ply, tid)
	if tid == nil or not team.Valid(tid) or tid == 0 then
		ply:SendChat("ERROR", "That team's index is invalid, check your console")

		ply:PrintMessage(HUD_PRINTCONSOLE, "Eternity Team Index:")
		for k,v in pairs(TEAMS) do
			ply:PrintMessage(HUD_PRINTCONSOLE, k .. ": " .. v.Name .. (v.Hidden and " (HIDDEN)" or ""))
		end

		return
	end
	
	TEAMS[tid].Hidden = not TEAMS[tid].Hidden
	Feedback(ply, string.format("You've set %s to be %s on the scoreboard", TEAMS[tid].Name, TEAMS[tid].Hidden and "hidden" or "visible"))

	GAMEMODE:SendTeamHiddenState(tid, TEAMS[tid].Hidden)
end, COMMAND_ADMIN, {CTYPE_NUMBER}, {},
"Misc", "Toggles a team's visiblity")

console.AddCommand("rpa_setchararea", function(ply, steamid, charid, worldarea)
	local target = player.GetBySteamID(steamid)
	local notice = player.GetUsergroup(USERGROUP_ADMIN)
	local name = steamid

	if not IsValid(target) then
		target = steamid
	end

	if charid == nil then
		GAMEMODE:GetAccountCharacters(ply, target)
		
		return
	end

	if not GAMEMODE:CharacterExists(target, charid) then
		GAMEMODE:GetAccountCharacters(ply, target)

		return
	end

	if worldarea == nil or (worldarea < WORLDAREA_NONE or worldarea > WORLDAREA_OUTLANDS) then
		ply:PrintMessage(HUD_PRINTCONSOLE, "Eternity World Areas")
		ply:PrintMessage(HUD_PRINTCONSOLE, "1 = No Restrictions")
		ply:PrintMessage(HUD_PRINTCONSOLE, "2 = City")
		ply:PrintMessage(HUD_PRINTCONSOLE, "3 = Canals")
		ply:PrintMessage(HUD_PRINTCONSOLE, "4 = Outlands")

		return
	end

	GAMEMODE:SetPlayerWorldArea(ply, charid, worldarea)

	GAMEMODE:WriteLog("security_worldareaset", {
		Admin = GAMEMODE:LogPlayer(ply),
		Target = GAMEMODE:LogPlayerRaw(steamid),
		CharID = charid,
		WorldArea = worldarea
	})

end, COMMAND_ADMIN, {CTYPE_STEAMID, CTYPE_NUMBER, CTYPE_NUMBER}, {},
"Character", "Sets a character's world area, which determines the server they can log into")

console.AddCommand("rpa_anticheat", function(ply)
	LSAC.menu.OpenMenu(ply)
end, COMMAND_ADMIN, {}, {CFLAG_NOCONSOLE},
"Admin", "Opens the anticheat menu.")

console.AddCommand("rpa_getpermaprops", function(ply)
	Feedback(ply, string.format("Permaprop count: %s\nLimit: %s", permaprops_in_session, GAMEMODE:GetConfig("PermaPropLimit")))
end, COMMAND_ADMIN)

console.AddClientCommand("rpa_getinfo", function(ply, target)
	SetClipboardText(target:SteamID())

	GAMEMODE:SendChat("NOTICE", string.format("Sent %s's information to your console and copied their SteamID to your clipboard.", target:Name()))
	ply:PrintMessage(HUD_PRINTCONSOLE, string.format("\t%s (%s)\n\tSteam: %s\n\tSteamID: %s", target:RPName(), target:VisibleRPName(), target:Name(), target:SteamID()))
end, COMMAND_ADMIN, {CTYPE_PLAYER}, {CFLAG_FORCESINGLETARGET})

console.AddCommand("rpa_offduty", function(ply, targets)
    for _, v in pairs(targets) do
        local flagged = not v:IsFlagged()
        local species = v:GetActiveSpecies()
        if not species then
            return
        end
        local state = species.SpeciesStates[v:SpeciesState()]
        if not state then
            Feedback(ply, string.format("%s does not have the ability to flag off duty.", TargetName(v, "RPName")))
            return
        end
        if not state.Flagged then
            Feedback(ply, string.format("%s does not have the ability to flag off duty.", TargetName(v, "RPName")))
            return
        end
        if v:IsFlagged() then
            v:Spawn(true, true)
            v:SetIsFlagged(false)
            v:HandleFlagChange(false)
            v:SendChat("NOTICE", string.format("You've been forced off duty by %s.", PlayerName(ply)))
        else
            Feedback(ply, string.format("%s cannot be forced off duty.", TargetName(v, "RPName")))
            return
        end

        GAMEMODE:WriteLog("admin_changeduty", {
            Admin = GAMEMODE:LogPlayer(ply),
            Char = GAMEMODE:LogCharacter(v),
            Ply = GAMEMODE:LogPlayer(v),
            Flagged = flagged
        })

    end

    Feedback(ply, string.format("You've forced %s off duty.", TargetName(targets, "RPName")))
end, COMMAND_ADMIN, {CTYPE_PLAYER}, {CFLAG_CHECKIMMUNITY},
"Player", "Forces off duty.")

console.AddCommand("rpa_onduty", function(ply, targets)
    for _, v in pairs(targets) do
        local flagged = not v:IsFlagged()
        local species = v:GetActiveSpecies()
        if not species then
            return
        end
        local state = species.SpeciesStates[v:SpeciesState()]
        if not state then
            Feedback(ply, string.format("%s does not have the ability to flag on duty.", TargetName(v, "RPName")))
            return
        end
        if not state.Flagged then
            Feedback(ply, string.format("%s does not have the ability to flag on duty.", TargetName(v, "RPName")))
            return
        end
        if not v:IsFlagged() then
            v:SetIsFlagged(true)
            v:HandleFlagChange(true)
            v:SendChat("NOTICE", string.format("You've been forced on duty by %s.", PlayerName(ply)))
        else
            Feedback(ply, string.format("%s cannot be forced on duty.", TargetName(v, "RPName")))
            return
        end

        GAMEMODE:WriteLog("admin_changeduty", {
            Admin = GAMEMODE:LogPlayer(ply),
            Char = GAMEMODE:LogCharacter(v),
            Ply = GAMEMODE:LogPlayer(v),
            Flagged = flagged
        })

    end

    Feedback(ply, string.format("You've forced %s on duty.", TargetName(targets, "RPName")))
end, COMMAND_ADMIN, {CTYPE_PLAYER}, {CFLAG_CHECKIMMUNITY},
"Player", "Forces on duty.")
