local CLASS = class.Create("base_chatcommand")

CLASS.Name = "PEV"
CLASS.Description = "Sends a private event message to a specific player."

CLASS.Category = "PM"

CLASS.Commands = {"pev"}
CLASS.Tabs = TAB_NOTICES

if CLIENT then
    function CLASS:OnReceive(data, colors)
        return string.format("<col=%s>%s", util.ColorToChat(colors.PEV), data.Text)
    end
end

function CLASS:OnCreated()
	GAMEMODE:RegisterLogType("chat_pm", LOG_CHAT, ParseChatLog)
end

if SERVER then
	function CLASS:Split(str)
		local quote = str[1] != '"'
		local args = {}

		for k in string.gmatch(str, "[^\"]+") do
			quote = not quote

			if quote then
				table.insert(args, k)
			else
				for v in string.gmatch(k, "%S+") do
					table.insert(args, v)
				end
			end
		end

		return args
	end

	function CLASS:Parse(ply, cmd, text, lang)
		local split = self:Split(text)

		if not split[1] then
			ply:SendChat("ERROR", "No targets found.")

			return true
		end

		if not ply:IsAdmin() and not ply:HasPermission(PERMISSION_EVENTS) then
			ply:SendChat("ERROR", "You need to be an Administator to utilize this command.")

			return true
		end

		local ok, target = GAMEMODE:FindPlayer(ply, split[1], table.MakeAssociative({CFLAG_FORCESINGLETARGET}))

		table.remove(split, 1)

		text = table.concat(split, " ")

		if not ok then
			ply:SendChat("ERROR", target)

			return true
		end

		ply:SendChat("PEV", {Sent = true, Text = text, Name = target:VisibleRPName()})
		target:SendChat("PEV", {Text = text, Name = ply:VisibleRPName()})


		return true
	end
end

return CLASS