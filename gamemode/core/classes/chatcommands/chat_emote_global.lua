local CLASS = class.Create("base_chatcommand")

CLASS.Name = "Emote (Global)"
CLASS.Description = "Perform an action. (Global range)"

CLASS.Category = "Emotes"

CLASS.Commands = {"gme"}
CLASS.Indicator = CHATINDICATOR_TYPING

CLASS.Logged = "EMOTE"
CLASS.Tabs = TAB_GIC

if CLIENT then
	function CLASS:OnReceive(data, colors)
		local color = util.ColorToChat(self:ApplyChatFocus(data.Ply, colors.GlobalIC))
		local text = data.Text

		if not string.match(text, "^[,.']") then
			text = " " .. text
		end

		return string.format("<col=%s>[G] ** %s%s", color, data.Name, text), string.format("<col=%s>[G] ** %s%s", color, data.Name, text)
	end
end

if SERVER then
	function CLASS:Parse(ply, cmd, text, lang)
		if not GAMEMODE:EnableGlobalEmotes() then
			ply:SendChat("ERROR", "Global emoting is currently disabled by the administrators.")

			return true
		end

		if ply:GlobalICMuted() then
			ply:SendChat("ERROR", "You are muted from global emotes chat.")

			return true
		end

		return {
			UserID = ply:UserID(),
			Name = ply:VisibleRPName(),
			Text = text
		}
	end
end

return CLASS