ITEM = class.Create("base_clothing")

ITEM.Name 				= "Red Beanie"
ITEM.Description 		= "A generic beanie, nothing to it really."

ITEM.Model 				= Model("models/tnb/items/trp/headgear/hat4.mdl")
ITEM.Material			= "models/tnb/techcom/addons1_beanie_red"

ITEM.EquipmentSlots 	= {EQUIPMENT_HEAD}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 75
ITEM.SellPrice 			= 35

ITEM.ItemGroup 			= "Clothing"

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			_base = {
				Bodygroups = {
					hat = 4
				},
				Materials = {
                    ["models/tnb/techcom/addons1"] = "models/tnb/techcom/addons1_beanie_red"
                }
			}
		}
	end
end

return ITEM
