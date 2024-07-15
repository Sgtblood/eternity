ITEM = class.Create("base_clothing")

ITEM.Name 				= "Black Jeans"
ITEM.Description 		= "A pair of aged black jeans, free of any cuts or holes."

ITEM.Model 				= Model("models/tnb/halflife2/citizens/items/item_legs_jeans2.mdl")
ITEM.Skin 				= 0

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_LEGS}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 75
ITEM.SellPrice 			= 25

ITEM.ItemGroup 			= "Clothing"

ITEM.ArmorLevel			= ARMOR_NONE

ITEM.Inventories        = {
    ["Left Pocket"] = {1, 2},
    ["Right Pocket"] = {1, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			legs = {
				Model = Model(string.format("models/tnb/halflife2/%s_legs_jeans2.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
				Skin = 0
            }
		}
	end
end

return ITEM
