ITEM = class.Create("base_clothing")

ITEM.Name 				= "Mechanics Vest"
ITEM.Description 		= "Grey on black. Surprisingly comfortable."

ITEM.Model 				= Model("models/tnb/halflife2/citizens/items/item_torso_mechanic.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

-- ITEM.License 			= LICENSE_CLOTHING
-- ITEM.UnitPrice 			= 200
-- ITEM.SellPrice 			= 95

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {2, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			torso = {
				Model = Model(string.format("models/tnb/halflife2/%s_torso_mechanic.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
				Skin = 0
			}
		}
	end
end

return ITEM
