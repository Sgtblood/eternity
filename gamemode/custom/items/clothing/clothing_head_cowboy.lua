ITEM = class.Create("base_clothing")

ITEM.Name 				= "Cowboy Hat"
ITEM.Description 		= "Universally loved hat."

ITEM.Model 				= Model("models/tnb/items/trp/headgear/hat10.mdl")

ITEM.EquipmentSlots 	= {EQUIPMENT_HEAD}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 250
ITEM.SellPrice 			= 100

ITEM.ItemGroup 			= "Clothing"

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			_base = {
				Bodygroups = {
					hat = 10
				}
			}
		}
	end
end

return ITEM