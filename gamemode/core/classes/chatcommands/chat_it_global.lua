local CLASS = class.Create("base_chatcommand")

CLASS.Name = "It (Global)"
CLASS.Description = "Describe something from a 3rd person perspective. (Global range)"

CLASS.Category = "Emotes"

CLASS.Commands = {"git"}
CLASS.Indicator = CHATINDICATOR_TYPING

CLASS.Logged = "EMOTE"
CLASS.Tabs = TAB_GIC

if CLIENT then
	function CLASS:OnReceive(data, colors)
		local color = util.ColorToChat(self:ApplyChatFocus(data.Ply, colors.GlobalIC))

		return string.format("<col=%s>[G] ** %s **", color, data.Text), string.format("<col=%s>[G](%s) ** %s **", color, data.Name, data.Text)
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