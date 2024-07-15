ITEM = class.Create("base_clothing")

ITEM.Name 				= "Bloodied Grey Jeans"
ITEM.Description 		= "Covered in blood. Probably the outfit of some unlucky soul or someones former choice of leggings."

ITEM.Model 				= Model("models/tnb/halflife2/citizens/items/item_legs_killer.mdl")
ITEM.Skin 				= 0

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_LEGS}

-- ITEM.License 			= LICENSE_CLOTHING
-- ITEM.UnitPrice 			= 100
-- ITEM.SellPrice 			= 50

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
				Model = Model(string.format("models/tnb/halflife2/%s_legs_killer.mdl", GAMEMODE:GetGenderString(ply:CharModel())))
            }
		}
	end
end

return ITEM
