ITEM = class.Create("base_clothing")

ITEM.Name 				= "Loyalist Coveralls Pants"
ITEM.Description 		= "Glory to the Union!"

ITEM.Model 				= Model("models/tnb/halflife2/citizens/items/world_coverall_loyal_legs.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_LEGS}

-- ITEM.License 			= LICENSE_CLOTHING
-- ITEM.UnitPrice 			= 60
-- ITEM.SellPrice 			= 25

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories        = {
    ["Left Pocket"] = {1, 2},
    ["Right Pocket"] = {1, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			legs = {
				Model = Model(string.format("models/tnb/halflife2/%s_legs_coveralls_loyal.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
            }
		}
	end
end

return ITEM
