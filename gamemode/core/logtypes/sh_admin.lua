GM:RegisterLogType("admin_restart", LOG_ADMIN, function(data)
	return string.format("%s has restarted the server", GAMEMODE:FormatPlayer(data.Admin))
end)

GM:RegisterLogType("admin_language", LOG_ADMIN, function(data)
	local name = string.lower(LANGUAGES[data.Lang].Name)

	if data.Give then
		return string.format("%s gave %s the %s language", GAMEMODE:FormatPlayer(data.Admin), GAMEMODE:FormatCharacter(data.Char), name)
	else
		return string.format("%s took the %s language from %s", GAMEMODE:FormatPlayer(data.Admin), name, GAMEMODE:FormatCharacter(data.Char))
	end
end)

GM:RegisterLogType("admin_whitelist", LOG_ADMIN, function(data)
	local name = string.lower(GAMEMODE:GetSpecies(data.Species).Name)

	if data.Give then
		return string.format("%s has added %s to the %s whitelist", GAMEMODE:FormatPlayer(data.Admin), GAMEMODE:FormatPlayer(data.Ply), name)
	else
		return string.format("%s has removed %s from the %s whitelist", GAMEMODE:FormatPlayer(data.Admin), GAMEMODE:FormatPlayer(data.Ply), name)
	end
end)

GM:RegisterLogType("admin_badge", LOG_ADMIN, function(data)
	local name = string.lower(BADGES[data.Badge].Name)

	if data.Give then
		return string.format("%s gave %s the %s badge", GAMEMODE:FormatPlayer(data.Admin), GAMEMODE:FormatPlayer(data.Ply), name)
	else
		return string.format("%s took the %s badge from %s", GAMEMODE:FormatPlayer(data.Admin), name, GAMEMODE:FormatPlayer(data.Ply))
	end
end)

GM:RegisterLogType("admin_license", LOG_ADMIN, function(data)
	local name = string.lower(LICENSES[data.License].Name)

	if data.Give then
		return string.format("%s gave %s the %s license", GAMEMODE:FormatPlayer(data.Admin), GAMEMODE:FormatCharacter(data.Char), name)
	else
		return string.format("%s took the %s license from %s", GAMEMODE:FormatPlayer(data.Admin), name, GAMEMODE:FormatCharacter(data.Char))
	end
end)

GM:RegisterLogType("admin_seeall", LOG_ADMIN, function(data)
	return string.format("%s has toggled seeall", GAMEMODE:FormatPlayer(data.Admin))
end)

GM:RegisterLogType("admin_permission", LOG_ADMIN, function(data)
	local name = string.lower(PERMISSIONS[data.Perm].Name)

	if data.Give then
		return string.format("%s gave %s %s permissions", GAMEMODE:FormatPlayer(data.Admin), GAMEMODE:FormatPlayer(data.Ply), name)
	else
		return string.format("%s took %s permissions from %s", GAMEMODE:FormatPlayer(data.Admin), name, GAMEMODE:FormatPlayer(data.Ply))
	end
end)

GM:RegisterLogType("admin_permission_temp", LOG_ADMIN, function(data)
	local name = string.lower(PERMISSIONS[data.Perm].Name)

	if data.Give then
		return string.format("%s gave %s %s temporary permissions", GAMEMODE:FormatPlayer(data.Admin), GAMEMODE:FormatPlayer(data.Ply), name)
	else
		return string.format("%s took %s temporary permissions from %s", GAMEMODE:FormatPlayer(data.Admin), name, GAMEMODE:FormatPlayer(data.Ply))
	end
end)

GM:RegisterLogType("admin_privatemode", LOG_ADMIN, function(data)
	local name = string.lower(USERGROUPS[data.Usergroup].Title)

	return string.format("%s set private mode to %ss or higher", GAMEMODE:FormatPlayer(data.Admin), name)
end)

GM:RegisterLogType("admin_heal", LOG_ADMIN, function(data)
	return string.format("%s has healed %s", GAMEMODE:FormatPlayer(data.Admin), GAMEMODE:FormatCharacter(data.Char))
end)

GM:RegisterLogType("admin_changelevel", LOG_ADMIN, function(data)
	return string.format("%s has changed the map to %s", GAMEMODE:FormatPlayer(data.Admin), data.Map)
end)

GM:RegisterLogType("admin_tooltrust", LOG_ADMIN, function(data)
	if data.Trust == TOOLTRUST_BANNED then
		return string.format("%s took %s's tooltrust", GAMEMODE:FormatPlayer(data.Admin), GAMEMODE:FormatPlayer(data.Ply))
	else
		local name = (data.Trust == TOOLTRUST_ADVANCED) and "advanced" or "basic"

		return string.format("%s gave %s %s tooltrust", GAMEMODE:FormatPlayer(data.Admin), GAMEMODE:FormatPlayer(data.Ply), name)
	end
end)

GM:RegisterLogType("admin_proptrust", LOG_ADMIN, function(data)
	if data.Trust == TPROPTRUST_BANNED then
		return string.format("%s took %s's proptrust", GAMEMODE:FormatPlayer(data.Admin), GAMEMODE:FormatPlayer(data.Ply))
	else
		local name = (data.Trust == PROPTRUST_ADVANCED) and "advanced" or "basic"

		return string.format("%s gave %s %s proptrust", GAMEMODE:FormatPlayer(data.Admin), GAMEMODE:FormatPlayer(data.Ply), name)
	end
end)

GM:RegisterLogType("admin_slap", LOG_ADMIN, function(data)
	return string.format("%s has slapped %s", GAMEMODE:FormatPlayer(data.Admin), GAMEMODE:FormatCharacter(data.Char))
end)

GM:RegisterLogType("admin_usergroup", LOG_ADMIN, function(data)
	local name = string.lower(USERGROUPS[data.Usergroup].Title)

	return string.format("%s has set %s's usergroup to %s", GAMEMODE:FormatPlayer(data.Admin), GAMEMODE:FormatPlayer(data.Ply), name)
end)

GM:RegisterLogType("admin_usergroup_offline", LOG_ADMIN, function(data)
	local name = string.lower(USERGROUPS[data.Usergroup].Title)

	return string.format("%s has set %s's usergroup to %s", GAMEMODE:FormatPlayer(data.Admin), data.SteamID, name)
end)

GM:RegisterLogType("admin_togglesaved", LOG_ADMIN, function(data)
	return string.format("%s has %s %s belonging to %s", GAMEMODE:FormatPlayer(data.Admin), data.Saved and "saved" or "removed", data.Model, data.SteamID)
end)

GM:RegisterLogType("admin_toggleeditor", LOG_ADMIN, function(data)
	return string.format("%s has %s an %s belonging to %s", GAMEMODE:FormatPlayer(data.Admin), data.Saved and "saved" or "removed", data.Class, data.SteamID)
end)

GM:RegisterLogType("admin_oocmute", LOG_ADMIN, function(data)
	local name = data.Muted and "muted" or "unmuted"

	return string.format("%s has %s %s from OOC", GAMEMODE:FormatPlayer(data.Admin), name, GAMEMODE:FormatPlayer(data.Ply))
end)

GM:RegisterLogType("admin_globalemotesmute", LOG_ADMIN, function(data)
	local name = data.Muted and "muted" or "unmuted"

	return string.format("%s has %s %s from global emotes chat", GAMEMODE:FormatPlayer(data.Admin), name, GAMEMODE:FormatPlayer(data.Ply))
end)

GM:RegisterLogType("admin_kill", LOG_ADMIN, function(data)
	return string.format("%s has killed %s", GAMEMODE:FormatPlayer(data.Admin), GAMEMODE:FormatCharacter(data.Char))
end)

GM:RegisterLogType("admin_charmodel", LOG_ADMIN, function(data)
	return string.format("%s has set %s's model to %s", GAMEMODE:FormatPlayer(data.Admin), GAMEMODE:FormatCharacter(data.Char), data.Model)
end)

GM:RegisterLogType("admin_hunger", LOG_ADMIN, function(data)
	return string.format("%s set %s's hunger to %i", GAMEMODE:FormatPlayer(data.Admin), GAMEMODE:FormatCharacter(data.Char), data.Hunger)
end)

GM:RegisterLogType("admin_speciesstate", LOG_ADMIN, function(data)
	return string.format("%s has set %s's species state to %s", GAMEMODE:FormatPlayer(data.Admin), GAMEMODE:FormatCharacter(data.Char), data.State)
end)

GM:RegisterLogType("admin_charskin", LOG_ADMIN, function(data)
	return string.format("%s has set %s's skin to %s", GAMEMODE:FormatPlayer(data.Admin), GAMEMODE:FormatCharacter(data.Char), data.Skin)
end)

GM:RegisterLogType("admin_charguide", LOG_ADMIN, function(data)
	return string.format("%s has set %s's character to be a guide", GAMEMODE:FormatPlayer(data.Admin), GAMEMODE:FormatCharacter(data.Char))
end)

GM:RegisterLogType("admin_nodamage", LOG_ADMIN, function(data)
	local format = data.Bool and "%s gave godmode to %s" or "%s took godmode from %s"

	return string.format(format, GAMEMODE:FormatPlayer(data.Admin), GAMEMODE:FormatPlayer(data.Ply))
end)

GM:RegisterLogType("admin_givemoney", LOG_ADMIN, function(data)
	return string.format("%s gave %s %s credits", GAMEMODE:FormatPlayer(data.Admin), GAMEMODE:FormatPlayer(data.Ply), data.Amount)
end)

GM:RegisterLogType("admin_takemoney", LOG_ADMIN, function(data)
	return string.format("%s took %s credits from %s", GAMEMODE:FormatPlayer(data.Admin), data.Amount, GAMEMODE:FormatPlayer(data.Ply), data.Amount)
end)

GM:RegisterLogType("admin_playmusic", LOG_ADMIN, function(data)
	return string.format("%s played %s", GAMEMODE:FormatPlayer(data.Admin), data.Sound)
end)

GM:RegisterLogType("admin_playeffect", LOG_ADMIN, function(data)
	return string.format("%s played %s", GAMEMODE:FormatPlayer(data.Admin), data.Sound)
end)

GM:RegisterLogType("admin_ko", LOG_ADMIN, function(data)
	if data.Ko then
		return string.format("%s has knocked %s out", GAMEMODE:FormatPlayer(data.Admin), GAMEMODE:FormatCharacter(data.Char))
	else
		return string.format("%s has woken %s up", GAMEMODE:FormatPlayer(data.Admin), GAMEMODE:FormatCharacter(data.Char))
	end
end)

GM:RegisterLogType("admin_hide", LOG_ADMIN, function(data)
	if data.Hide then
		return string.format("%s has hidden %s from the scoreboard", GAMEMODE:FormatPlayer(data.Admin), GAMEMODE:FormatCharacter(data.Char))
	else
		return string.format("%s has unhidden %s from the scoreboard", GAMEMODE:FormatPlayer(data.Admin), GAMEMODE:FormatCharacter(data.Char))
	end
end)

GM:RegisterLogType("admin_restrain", LOG_ADMIN, function(data)
	if data.Restrained then
		return string.format("%s has restrained %s", GAMEMODE:FormatPlayer(data.Admin), GAMEMODE:FormatCharacter(data.Char))
	else
		return string.format("%s has removed %s's restraints", GAMEMODE:FormatPlayer(data.Admin), GAMEMODE:FormatCharacter(data.Char))
	end
end)

GM:RegisterLogType("admin_mapbutton", LOG_ADMIN, function(data)
		return string.format("%s has triggered %s", GAMEMODE:FormatPlayer(data.Admin), string.lower(data.Button))
end)

GM:RegisterLogType("admin_noclipseeall", LOG_ADMIN, function(data)
		return string.format("%s has toggled NoClip seeall. NoClip seeall status is now %s", GAMEMODE:FormatPlayer(data.Admin), GAMEMODE:NoclipSeeall())
end)

GM:RegisterLogType("admin_disabledseeall", LOG_ADMIN, function(data)
		return string.format("Seeall disabled for %s", GAMEMODE:FormatPlayer(data.Admin))
end)

GM:RegisterLogType("admin_changeduty", LOG_ADMIN, function(data)
    if data.Flagged then
        return string.format("%s has forced %s on duty", GAMEMODE:FormatPlayer(data.Admin), GAMEMODE:FormatCharacter(data.Char))
    else
        return string.format("%s has forced %s off duty", GAMEMODE:FormatPlayer(data.Admin), GAMEMODE:FormatCharacter(data.Char))
    end
end)
