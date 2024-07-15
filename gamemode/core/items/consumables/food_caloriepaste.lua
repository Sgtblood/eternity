ITEM = class.Create("base_consumable")

ITEM.Name 				= "Gelatinated Calorie Paste"
ITEM.Description 		= "A gross recreation of a breakfast classic: scrambled eggs."

ITEM.Model 				= Model("models/hls/alyxports/ration_box.mdl")
ITEM.Skin               = 1

ITEM.Height 			= 1

ITEM.UseSelf 			= true
ITEM.SelfString 		= "Eat"

if SERVER then
	function ITEM:OnSelfUse(ply)
		ply:SetHungerBar(math.Clamp(ply:HungerBar() - 150, 0, GAMEMODE:GetConfig("HungerMax")))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM