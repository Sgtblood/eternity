ITEM = class.Create("base_clothing")

ITEM.Name 				= "Facewrap"
ITEM.Description 		= "It's just a piece of cloth really."

ITEM.Model 				= Model("models/tnb/items/trp/headgear/mask1.mdl")

ITEM.EquipmentSlots 	= {EQUIPMENT_MASK}

ITEM.ItemGroup 			= "Clothing"

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 50
ITEM.SellPrice 			= 15

ITEM.Filtered 			= false

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			_base = {
				Bodygroups = {
					mask = 1
				}
			}
		}
	end
end

return ITEM
