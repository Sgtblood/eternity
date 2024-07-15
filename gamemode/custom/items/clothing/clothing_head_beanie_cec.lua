ITEM = class.Create("base_clothing")

ITEM.Name 				= "CEC Beanie"
ITEM.Description 		= "A generic beanie, nothing to it really."

ITEM.Model 				= Model("models/tnb/items/trp/headgear/hat4.mdl")
ITEM.Material			= "models/tnb/techcom/addons1_cmc13"

ITEM.EquipmentSlots 	= {EQUIPMENT_HEAD}

-- ITEM.License 			= LICENSE_CLOTHING
-- ITEM.UnitPrice 			= 40
-- ITEM.SellPrice 			= 15

ITEM.ItemGroup 			= "Clothing"

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			_base = {
				Bodygroups = {
					hat = 4
				},
				Materials = {
                    ["models/tnb/techcom/addons1"] = "models/tnb/techcom/addons1_cmc13"
                }
			}
		}
	end
end

return ITEM
