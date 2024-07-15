ITEM = class.Create("base_consumable")

ITEM.Name 				= "Biotic Booster"
ITEM.Description 		= "A beverage that provides supplementary diet, and appears to causes difficulty thinking. Human's that drink this start forgetting things.."

ITEM.Model 				= Model("models/hls/alyxports/popcan01a_hls.mdl")
ITEM.Skin 				= 2

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