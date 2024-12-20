local meta = FindMetaTable("Player")

GM.PlayerSettings = {}
GM.SettingCategories = {}

function GM:AddPlayerSetting(name, category, key, default, type, data, filter)
	self.PlayerSettings[key] = {
		Name = name,
		Category = category,
		Default = default,
		Type = type,
		Data = data or {},
		Filter = filter
	}

	for _, v in pairs(self.SettingCategories) do
		if v.Category == category then
			table.insert(v, key)

			return
		end
	end

	table.insert(self.SettingCategories, {
		Category = category,
		[1] = key
	})
end

local function isBasicDonator(ply)
	if ply:IsDeveloper() then
		return true
	end

	local package = ply:TopDonatorPackage()

	if package and package >= DONATORPACKAGE_BRONZE then
		return true
	end

	return false
end

local function isAdvancedDonator(ply)
	if ply:IsDeveloper() then
		return true
	end

	local package = ply:TopDonatorPackage()

	if package and package >= DONATORPACKAGE_SILVER then
		return true
	end

	return false
end

GM:AddPlayerSetting("Show Donator Status", "Donator Settings", "donator_status_show", true, TYPE_BOOL, nil, isBasicDonator)
GM:AddPlayerSetting("Custom Physgun Color", "Donator Settings", "donator_physgun_custom_color", Color(38, 207, 233), TYPE_COLOR, nil, isAdvancedDonator)
GM:AddPlayerSetting("Custom Scoreboard Title Text", "Donator Settings", "donator_scoreboard_text", "", TYPE_STRING, {
	Max = 48,
	Title = "Set Scoreboard Title"
}, isAdvancedDonator)
GM:AddPlayerSetting("Custom Scoreboard Title Color", "Donator Settings", "donator_scoreboard_color", Color(255, 255, 255), TYPE_COLOR, nil, isAdvancedDonator)

GM:AddPlayerSetting("Draw Chat Box Unfocused", "Chat", "chat_enabled", true, TYPE_BOOL)
GM:AddPlayerSetting("Draw Chat Box Transparency", "Chat", "chat_transparent", true, TYPE_BOOL)
GM:AddPlayerSetting("Draw Elevated Radio Feed", "Chat", "chatradio_enabled", true, TYPE_BOOL)
GM:AddPlayerSetting("Enable Focus Chat Target", "Chat", "chat_targetfocus", true, TYPE_BOOL)
GM:AddPlayerSetting("Enable Focus Chat Recipient", "Chat", "chat_receivefocus", true, TYPE_BOOL)
GM:AddPlayerSetting("Message Color Scheme", "Chat", "chat_customcolors", CCOLORS_DEFAULT, TYPE_TABLE, {
	[CCOLORS_DEFAULT] = "Default Color Scheme",
	[CCOLORS_CUSTOM] = "Custom Color Scheme"
})

for k,v in SortedPairs(GM:GetConfig("ChatColors")) do
	GM:AddPlayerSetting(string.format("%s Text Color", k), "Chat Colors", string.format("chatcolors_%s", string.lower(k)), v, TYPE_COLOR)
end

GM:AddPlayerSetting("Draw crosshairs", "Weapons", "weapon_crosshairs", true, TYPE_BOOL)
GM:AddPlayerSetting("Toggle aiming down sights", "Weapons", "weapon_toggleads", false, TYPE_BOOL)

GM:AddPlayerSetting("Show nearby spawnpoints", "UI", "ui_showspawns", false, TYPE_BOOL)
GM:AddPlayerSetting("Use transparent backgrounds", "UI", "ui_transparent", true, TYPE_BOOL)
GM:AddPlayerSetting("Use backgrounds for world labels", "UI", "ui_worldlabels", false, TYPE_BOOL)

GM:AddPlayerSetting("Serverside Music Enabled", "Sound", "sounds_music", true, TYPE_BOOL)
GM:AddPlayerSetting("Serverside Music Volume", "Sound", "sounds_music_volume", 1, TYPE_NUMBER, {
	Min = 0,
	Max = 2
})
GM:AddPlayerSetting("Serverside Effects Enabled", "Sound", "sounds_effect", true, TYPE_BOOL)
GM:AddPlayerSetting("Serverside Effects Volume", "Sound", "sounds_effect_volume", 1, TYPE_NUMBER, {
	Min = 0,
	Max = 2
})
GM:AddPlayerSetting("Enable Ballistic Impact Effects", "Sound", "sounds_bullets", true, TYPE_BOOL)
GM:AddPlayerSetting("Enable Biosignal Death Effects", "Sound", "sounds_biosignal", true, TYPE_BOOL)

GM:AddPlayerSetting("Enable Thirdperson", "HUD", "hud_thirdperson", false, TYPE_BOOL)
GM:AddPlayerSetting("Enable HUD", "HUD", "hud_enabled", true, TYPE_BOOL)
GM:AddPlayerSetting("Use Legacy HUD (Not recommended for low FPS)", "HUD", "hud_legacy", false, TYPE_BOOL)
GM:AddPlayerSetting("Draw door info", "HUD", "hud_doors", true, TYPE_BOOL)
GM:AddPlayerSetting("Draw button info", "HUD", "hud_buttons", true, TYPE_BOOL)
GM:AddPlayerSetting("Draw sandbox limits", "HUD", "hud_sandbox", true, TYPE_BOOL)
GM:AddPlayerSetting("Draw character info", "HUD", "hud_infobox", true, TYPE_BOOL)
GM:AddPlayerSetting("Draw health", "HUD", "hud_healthbar", true, TYPE_BOOL)
-- GM:AddPlayerSetting("Draw armor", "HUD", "hud_armorbar", true, TYPE_BOOL)
GM:AddPlayerSetting("Health style", "HUD", "hud_healthstyle", HPTYPE_BAR, TYPE_TABLE, {
	[HPTYPE_BAR] = "Health bar",
	[HPTYPE_HEARTBEAT] = "Heartbeat monitor"
})
GM:AddPlayerSetting("Draw hunger bar", "HUD", "hud_hungerbar", true, TYPE_BOOL)
GM:AddPlayerSetting("Draw items", "HUD", "hud_items", true, TYPE_BOOL)
GM:AddPlayerSetting("Item style", "HUD", "hud_itemstyle", ITEMTYPE_LABEL, TYPE_TABLE, {
	[ITEMTYPE_LABEL] = "Label only",
	[ITEMTYPE_GLOW] = "Glow only",
	[ITEMTYPE_BOTH] = "Both"
})
GM:AddPlayerSetting("Draw ammo", "HUD", "hud_ammo", true, TYPE_BOOL)
GM:AddPlayerSetting("Ammo style", "HUD", "hud_ammostyle", AMMOTYPE_SINGLE, TYPE_TABLE, {
	[AMMOTYPE_SINGLE] = "Clip only",
	[AMMOTYPE_DOUBLE] = "Clip/Capacity"
})
GM:AddPlayerSetting("Draw firemodes", "HUD", "hud_firemode", true, TYPE_BOOL)
GM:AddPlayerSetting("Firemode style", "HUD", "hud_firestyle", FIRETYPE_BOTH, TYPE_TABLE, {
	[FIRETYPE_MODE] = "Firemode only",
	[FIRETYPE_AMMO] = "Ammo type only",
	[FIRETYPE_BOTH] = "Both"
})
GM:AddPlayerSetting("Draw Weapon Firemode Selection", "HUD", "hud_firemode", true, TYPE_BOOL)
GM:AddPlayerSetting("Draw player names", "HUD", "hud_playernames", true, TYPE_BOOL)
GM:AddPlayerSetting("Draw descriptions", "HUD", "hud_descriptions", true, TYPE_BOOL)
GM:AddPlayerSetting("Draw typing indicators", "HUD", "hud_typing", true, TYPE_BOOL)
GM:AddPlayerSetting("Draw restrained indicators", "HUD", "hud_restrained", true, TYPE_BOOL)
GM:AddPlayerSetting("Draw prop ownership", "HUD", "hud_propowner", true, TYPE_BOOL)
GM:AddPlayerSetting("Prop ownership style", "HUD", "hud_propmode", PROPOWNER_BOTH, TYPE_TABLE, {
	[PROPOWNER_NAME] = "Name only",
	[PROPOWNER_STEAMID] = "SteamID only",
	[PROPOWNER_BOTH] = "Both"
})
GM:AddPlayerSetting("Draw prop descriptions", "HUD", "hud_propdescs", true, TYPE_BOOL)
GM:AddPlayerSetting("Draw vehicle HUD", "HUD", "hud_vehicle", true, TYPE_BOOL)
GM:AddPlayerSetting("Draw patrol team HUD", "HUD", "hud_squad", true, TYPE_BOOL)
GM:AddPlayerSetting("Draw patrol team overlay", "HUD", "hud_squadoverlay", true, TYPE_BOOL)
GM:AddPlayerSetting("Draw HUD overlays", "HUD", "hud_overlay", true, TYPE_BOOL)
GM:AddPlayerSetting("Draw weapon select", "HUD", "hud_weaponselect", true, TYPE_BOOL)

GM:AddPlayerSetting("Activate Seeall", "Seeall", "seeall_enabled", false, TYPE_BOOL, nil, USERGROUP_ADMIN)
GM:AddPlayerSetting("Draw players", "Seeall", "seeall_players", true, TYPE_BOOL, nil, USERGROUP_ADMIN)
GM:AddPlayerSetting("Show player health", "Seeall", "seeall_players_hp", true, TYPE_BOOL, nil, USERGROUP_ADMIN)
GM:AddPlayerSetting("Show restrained indicators", "Seeall", "seeall_players_restrained", true, TYPE_BOOL, nil, USERGROUP_ADMIN)
GM:AddPlayerSetting("Show player nicknames", "Seeall", "seeall_players_nick", true, TYPE_BOOL, nil, USERGROUP_ADMIN)
GM:AddPlayerSetting("Show true identities", "Seeall", "seeall_players_identity", true, TYPE_BOOL, nil, USERGROUP_ADMIN)
GM:AddPlayerSetting("Draw permaprops", "Seeall", "seeall_props", SEEALL_PROPS_PHYS, TYPE_TABLE, {
	[SEEALL_PROPS_NEVER] = "Never",
	[SEEALL_PROPS_PHYS] = "When holding a phys/toolgun",
	[SEEALL_PROPS_ALWAYS] = "Always"
}, USERGROUP_ADMIN)
GM:AddPlayerSetting("Draw items", "Seeall", "seeall_items", true, TYPE_BOOL, nil, USERGROUP_ADMIN)
GM:AddPlayerSetting("Draw NPC's", "Seeall", "seeall_npcs", true, TYPE_BOOL, nil, USERGROUP_ADMIN)

GM:AddPlayerSetting("Hide admin badge from players", "Admin", "admin_hidden", false, TYPE_BOOL, nil, USERGROUP_ADMIN)
GM:AddPlayerSetting("See all radio messages", "Admin", "admin_radio", false, TYPE_BOOL, nil, USERGROUP_ADMIN)
GM:AddPlayerSetting("Understand every language", "Admin", "admin_speech", false, TYPE_BOOL, nil, USERGROUP_ADMIN)

GM:AddPlayerSetting("Physgun mode", "Developer", "dev_physgun_mode", PHYSGUNMODE_DEFAULT, TYPE_TABLE, {
	[PHYSGUNMODE_DEFAULT] = "Default",
	[PHYSGUNMODE_RAINBOW_CLASSIC] = "Hopcolor-style rainbow",
	[PHYSGUNMODE_RAINBOW_NEW] = "HSV-style rainbow"
}, USERGROUP_DEV)

function meta:CanSeeSetting(filter)
	if isfunction(filter) then
		return filter(self)
	end

	if isnumber(filter) then
		return self:AdminLevel() >= filter
	end

	return false
end

if CLIENT then
	function GM:GetSetting(key)
		local setting = self.PlayerSettings[key]

		if not LocalPlayer().Settings then
			return setting.Default
		end

		if setting.Filter and not LocalPlayer():CanSeeSetting(setting.Filter) then
			return setting.Default
		end

		return LocalPlayer().Settings[key]
	end

	hook.Add("PlayerSettingsStoreChanged", "settings.PlayerSettingsStoreChanged", function(ply, old, new)
		ply.Settings = pon.decode(new)

		if not ply == LocalPlayer() then
			return
		end

		-- Update local player's music data.
		if IsValid(GAMEMODE.PlayMusic) then
			if GAMEMODE:GetSetting("sounds_music") then
				GAMEMODE.PlayMusic:SetVolume(GAMEMODE.PlayMusicVolume * GAMEMODE:GetSetting("sounds_music_volume"))
			else
				GAMEMODE.PlayMusic:SetVolume(0)
			end
		end

		-- Update local player's effect data.
		if IsValid(GAMEMODE.PlayEffect) then
			if GAMEMODE:GetSetting("sounds_effect") then
				GAMEMODE.PlayEffect:SetVolume(GAMEMODE.PlayEffectVolume * GAMEMODE:GetSetting("sounds_effect_volume"))
			else
				GAMEMODE.PlayEffect:SetVolume(0)
			end
		end
	end)
end

if SERVER then
	function meta:GetSetting(key)
		local setting = GAMEMODE.PlayerSettings[key]

		if not self.Settings then
			return setting.Default
		end

		if setting.Filter and not self:CanSeeSetting(setting.Filter) then
			return setting.Default
		end

		return self.Settings[key]
	end

	function meta:SaveSettings()
		self:SetSettingsStore(pon.encode(self.Settings))
	end

	function meta:SetSetting(key, value)
		local setting = GAMEMODE.PlayerSettings[key]
		local old = self:GetSetting(key)

		if setting.Filter and not self:CanSeeSetting(setting.Filter) then
			return
		end

		self.Settings[key] = value
		self:SaveSettings()

		hook.Run("OnSettingChanged", self, key, old, value)
	end

	function meta:LoadSettings()
		self.Settings = pon.decode(self:SettingsStore())

		local save = false

		for k, v in pairs(GAMEMODE.PlayerSettings) do
			if self.Settings[k] == nil then
				self.Settings[k] = v.Default

				save = true
			end
		end

		for k in pairs(self.Settings) do
			if not GAMEMODE.PlayerSettings[k] then
				self.Settings[k] = nil

				save = true
			end
		end

		for k, v in pairs(self.Settings) do
			hook.Run("OnSettingChanged", self, k, nil, v)
		end

		if save then
			self:SaveSettings()
		end
	end

	hook.Add("PostPlayerLoad", "settings.PostPlayerLoad", function(ply)
		ply:LoadSettings()
	end)

	hook.Add("OnReloaded", "settings.OnReloaded", function()
		for _, v in pairs(player.GetAll()) do
			if v:PlayerLoaded() then
				v:LoadSettings()
			end
		end
	end)

	netstream.Hook("SetSetting", function(ply, data)
		local setting = GAMEMODE.PlayerSettings[data.Key]

		if setting.Type == TYPE_COLOR and data.Value.r and data.Value.g and data.Value.b then
			ply:SetSetting(data.Key, Color(data.Value.r, data.Value.g, data.Value.b))
		elseif setting.Type == TYPE_TABLE and isnumber(data.Value) and setting.Data[data.Value] then
			ply:SetSetting(data.Key, data.Value)
		elseif setting.Type == TYPE_BOOL and isbool(data.Value) then
			ply:SetSetting(data.Key, data.Value)
		elseif setting.Type == TYPE_NUMBER and isnumber(data.Value) then
			ply:SetSetting(data.Key, data.Value)
		elseif setting.Type == TYPE_STRING and isstring(data.Value) then
			if not GAMEMODE:CheckNameValidity(data.Value, GAMEMODE:GetConfig("AllowedTitleCharacters")) then
				ply:SendChat("ERROR", "Your scoreboard title contains invalid characters")

				return
			end

			ply:SetSetting(data.Key, data.Value)
		
		end
	end)
end

hook.Add("OnSettingChanged", "setting.OnSettingChanged", function(ply, key, old, new)
	if key == "admin_hidden" then
		ply:SetAdminHidden(new)
	end
end)

