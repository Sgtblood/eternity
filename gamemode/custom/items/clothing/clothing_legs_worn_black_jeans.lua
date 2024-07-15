ITEM = class.Create("base_clothing")

ITEM.Name 				= "Worn Black Jeans"
ITEM.Description 		= "Slightly ripped, incredibly worn down."

ITEM.Model 				= Model("models/tnb/halflife2/citizens/items/world_coverall_legs.mdl")
ITEM.Skin 				= 0

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_LEGS}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 75
ITEM.SellPrice 			= 20

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories        = {
    ["Left Pocket"] = {1, 2},
    ["Right Pocket"] = {1, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			legs = {
				Model = Model(string.format("models/tnb/halflife2/%s_legs_dirtyjeans.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
				Skin = 1    
	       }
		}
	end
end

return ITEM
