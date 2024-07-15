ITEM = class.Create("base_clothing")

ITEM.Name 				= "Green Suit Pants"
ITEM.Description 		= "Comfortable and refined Green colored suit pants. Affordable."

ITEM.Model 				= Model("models/hls/alyxports/cardboard_box_3.mdl")
ITEM.Skin 				= 0

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_LEGS}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 250
ITEM.SellPrice 			= 35

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories        = {
    ["Left Pocket"] = {1, 2},
    ["Right Pocket"] = {1, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			legs = {
				Model = Model(string.format("models/tnb/halflife2/ca/%s_legs_bra.mdl", GAMEMODE:GetGenderString(ply:CharModel())))            }
		}
	end
end

return ITEM
