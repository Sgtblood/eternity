ban.SetRealm(GM:GetConfig("BanRealm"))

function GM:GetOfflineUsergroup(steamid)
	local usergroup = dbal.Query("connor4_Blob", "SELECT AdminLevel FROM $players WHERE SteamID = ?", steamid)

	return usergroup[1] and usergroup[1].AdminLevel or USERGROUP_PLAYER
end
