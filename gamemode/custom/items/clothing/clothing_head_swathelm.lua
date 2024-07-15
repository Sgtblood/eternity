ITEM = class.Create("base_clothing")

ITEM.Name 				= "SWAT Helmet"
ITEM.Description 		= "Old World SWAT helmet."

ITEM.Model 				= Model("models/tnb/items/trp/headgear/hat16.mdl")

ITEM.EquipmentSlots 	= {EQUIPMENT_HEAD}

ITEM.License 			= LICENSE_GREYMARKET
ITEM.UnitPrice 			= 500
ITEM.SellPrice 			= 200

ITEM.ItemGroup 			= "Clothing"


if SERVER then
	function ITEM:GetModelData(ply)
		return {
			_base = {
				Bodygroups = {
					hat = 15
				}
			}
		}
	end
end

return ITEM