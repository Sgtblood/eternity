ITEM = class.Create("base_clothing")

ITEM.Name 				= "Homemade Cigarette"
ITEM.Description 		= "Homemade cigarette. Feels much more authentic."

ITEM.Model 				= Model("models/tnb/items/trp/headgear/mask8.mdl")

ITEM.EquipmentSlots 	= {EQUIPMENT_MASK}

-- ITEM.License 			= LICENSE_MISCGOODS
-- ITEM.UnitPrice 			= 25
-- ITEM.SellPrice 			= 10

ITEM.ItemGroup 			= "Clothing"

ITEM.Filtered 			= false

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			_base = {
				Bodygroups = {
					mask = 8
				}
			}
		}
	end
end

return ITEM