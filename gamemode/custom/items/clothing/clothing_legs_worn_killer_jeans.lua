ITEM = class.Create("base_clothing")

ITEM.Name 				= "Bloody Jeans"
ITEM.Description 		= "Someones having a bad day."

ITEM.Model 				= Model("models/tnb/items/pants_citizen.mdl")
ITEM.Skin 				= 0

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_LEGS}

-- ITEM.License 			= LICENSE_CLOTHING
-- ITEM.UnitPrice 			= 25
-- ITEM.SellPrice 			= 10

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
				Skin = 3  
	       }
		}
	end
end

return ITEM
