ITEM = class.Create("base_consumable")

ITEM.Name 				= "Dr. Breen's Private Reserve Red"
ITEM.Description 		= "Just a normal can of seltzer water. Tastes sweet."

ITEM.Model 				= Model("models/hls/alyxports/popcan01a_hls.mdl")
ITEM.Skin 				= 1

ITEM.Height 			= 1

ITEM.License 			= LICENSE_FOOD
ITEM.UnitPrice			= 12
ITEM.SellPrace			= 5

ITEM.UseSelf 			= true
ITEM.SelfString 		= "Drink"

if SERVER then
	function ITEM:OnSelfUse(ply)
		ply:SetHungerBar(math.Clamp(ply:HungerBar() - 60, 0, GAMEMODE:GetConfig("HungerMax")))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM