ITEM = class.Create("base_consumable")

ITEM.Name 				= "Combine Civil Authority Booster"
ITEM.Description 		= "A beverage that tastes very similar to Apple Juice. Appears to relax muscles.."

ITEM.Model 				= Model("models/hls/alyxports/popcan01a_hls.mdl")
ITEM.Skin 				= 1

ITEM.Height 			= 1


ITEM.UseSelf 			= true
ITEM.SelfString 		= "Drink"

if SERVER then
	function ITEM:OnSelfUse(ply)
		ply:SetHungerBar(math.Clamp(ply:HungerBar() - 70, 0, GAMEMODE:GetConfig("HungerMax")))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM