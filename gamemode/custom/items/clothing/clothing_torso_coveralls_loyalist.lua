ITEM = class.Create("base_clothing")

ITEM.Name 				= "Loyalist Coveralls Top"
ITEM.Description 		= "Glory to the Union!"

ITEM.Model 				= Model("models/tnb/halflife2/citizens/items/world_coverall_loyal.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

-- ITEM.License 			= LICENSE_CLOTHING
-- ITEM.UnitPrice 			= 250
-- ITEM.SellPrice 			= 70

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {1, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			torso = {
				Model = Model(string.format("models/tnb/halflife2/%s_torso_coveralls_loyal.mdl", GAMEMODE:GetGenderString(ply:CharModel())))
			}
		}
	end
end

return ITEM
