ITEM = class.Create("base_clothing")

ITEM.Name 				= "Strapped Black Pants"
ITEM.Description 		= "A pair of jeans with a strap on them, used to store any tools and other stuff at the hip."

ITEM.Model 				= Model("models/tnb/halflife2/citizens/items/item_legs_strappedpants.mdl")
ITEM.Skin 				= 1

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_LEGS}

ITEM.License 			= LICENSE_GREYMARKET
ITEM.UnitPrice 			= 200
ITEM.SellPrice 			= 75

ITEM.ItemGroup 			= "Clothing"

ITEM.ArmorLevel			= ARMOR_NONE

ITEM.Inventories        = {
    ["Left Pocket"] = {2, 2},
    ["Right Pocket"] = {2, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			legs = {
				Model = Model(string.format("models/tnb/halflife2/%s_legs_strappedpants.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
				Skin = 1
            }
		}
	end
end

return ITEM
