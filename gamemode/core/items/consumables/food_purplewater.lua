ITEM = class.Create("base_consumable")

ITEM.Name 				= "Purple Cheese Drink"
ITEM.Description 		= "A unique beverage combining the vibrant color of purple with the rich, creamy taste of cheese."

ITEM.Model 				= Model("models/hls/alyxports/popcan01a_hls.mdl")
ITEM.Skin 				= 0
ITEM.Height 			= 1

ITEM.License 			= LICENSE_FOOD
ITEM.UnitPrice			= 25
ITEM.SellPrace			= 5

ITEM.UseSelf 			= true
ITEM.SelfString 		= "Drink"

if SERVER then
	function ITEM:OnSelfUse(ply)
		ply:SetHungerBar(math.Clamp(ply:HungerBar() - 70, 0, GAMEMODE:GetConfig("HungerMax")))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM