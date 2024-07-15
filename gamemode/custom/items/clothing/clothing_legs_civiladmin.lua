ITEM = class.Create("base_clothing")

ITEM.Name 				= "Combine Administration Pants"
ITEM.Description 		= "Pants commonly worn by Eastern City Administrative Staff."

ITEM.Model 				= Model("models/tnb/halflife2/citizens/items/world_cabottom.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_LEGS}

-- ITEM.License 			= LICENSE_CLOTHING
-- ITEM.UnitPrice 			= 250
-- ITEM.SellPrice 			= 70

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories        = {
    ["Left Pocket"] = {1, 2},
    ["Right Pocket"] = {1, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			legs = {
				Model = Model(string.format("models/tnb/halflife2/ca/%s_legs_ca.mdl", GAMEMODE:GetGenderString(ply:CharModel())))
			}
		}
	end
end

return ITEM
