ITEM = class.Create("base_clothing")

ITEM.Name 				= "Grey Dirty Pants"
ITEM.Description 		= "A pair of low cut grey pants, has some aged stains."

ITEM.Model 				= Model("models/tnb/halflife2/citizens/items/item_legs_dirtypants2.mdl")
ITEM.Skin 				= 0

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_LEGS}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 45
ITEM.SellPrice 			= 10

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
				Model = Model(string.format("models/tnb/halflife2/%s_legs_dirtypants2.mdl", GAMEMODE:GetGenderString(ply:CharModel())))
            }
		}
	end
end

return ITEM
