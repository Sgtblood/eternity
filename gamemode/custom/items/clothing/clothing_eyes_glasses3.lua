ITEM = class.Create("base_clothing")

ITEM.Name 				= "Glasses"
ITEM.Description 		= "Used to help your eyesight."

ITEM.Model 				= Model("models/tnb/items/trp/headgear/eyewear8.mdl")

ITEM.EquipmentSlots 	= {EQUIPMENT_EYES}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 75
ITEM.SellPrice 			= 25

ITEM.ItemGroup 			= "Clothing"

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			_base = {
				Bodygroups = {
					eyewear = 8
				}
			}
		}
	end
end

return ITEM