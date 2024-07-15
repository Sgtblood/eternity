ITEM = class.Create("base_clothing")

ITEM.Name 				= "Disheveled Pants"
ITEM.Description 		= "A pair of loose thick pants. Looks like total trash."

ITEM.Model 				= Model("models/tnb/halflife2/citizens/items/item_legs_tramp.mdl")
ITEM.Skin 				= 0

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_LEGS}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 10
ITEM.SellPrice 			= 2

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
				Model = Model(string.format("models/tnb/halflife2/%s_legs_tramp.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
				Skin = 0
            }
		}
	end
end

return ITEM
