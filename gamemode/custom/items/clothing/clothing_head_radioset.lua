ITEM = class.Create("base_clothing")

ITEM.Name 				= "Radio Headset"
ITEM.Description 		= "A handy, portable microphone. Could be plugged into a reciever."

ITEM.Model 				= Model("models/tnb/items/trp/headgear/hat11.mdl")

ITEM.EquipmentSlots 	= {EQUIPMENT_HEAD}

-- ITEM.License 			= LICENSE_GREYMARKET
-- ITEM.UnitPrice          = 250
-- ITEM.SellPrice          = 100

ITEM.ItemGroup 			= "Clothing"

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			_base = {
				Bodygroups = {
					headset = 1
				}
			}
		}
	end
end

return ITEM
