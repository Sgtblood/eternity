ITEM = class.Create("base_clothing")

ITEM.Name 				= "Heads Up Display"
ITEM.Description 		= "High tech heads up display with advanced targeting and communication modules."

ITEM.Model 				= Model("models/tnb/items/trp/headgear/eyewear6.mdl")

ITEM.EquipmentSlots 	= {EQUIPMENT_EYES}

--ITEM.License 			= LICENSE_CLOTHING
--ITEM.UnitPrice 			= 200
--ITEM.SellPrice 			= 85

ITEM.ItemGroup 			= "Clothing"

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			_base = {
				Bodygroups = {
					eyewear = 6
				}
			}
		}
	end
end

return ITEM