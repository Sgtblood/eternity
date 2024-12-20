ITEM = class.Create("base_clothing")

ITEM.Name 				= "Gasmask"
ITEM.Description 		= "How does this thing still hold a seal after all these years?"

ITEM.Model 				= Model("models/tnb/items/trp/headgear/mask5.mdl")

ITEM.EquipmentSlots 	= {EQUIPMENT_MASK}

ITEM.License 			= LICENSE_GREYMARKET
ITEM.UnitPrice 			= 400
ITEM.SellPrice 			= 125

ITEM.ItemGroup 			= "Clothing"

ITEM.Filtered 			= true

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			_base = {
				Bodygroups = {
					mask = 5
				}
			}
		}
	end
end

return ITEM