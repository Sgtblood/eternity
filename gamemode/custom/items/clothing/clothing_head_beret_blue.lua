ITEM = class.Create("base_clothing")

ITEM.Name 				= "Blue Beret"
ITEM.Description 		= "A fancy Blue Beret."

ITEM.Model 				= Model("models/tnb/items/trp/headgear/hat6.mdl")
ITEM.Material			= "models/tnb/techcom/trenchcoat1_beret_uneca"

ITEM.EquipmentSlots 	= {EQUIPMENT_HEAD}

-- ITEM.License 			= LICENSE_GREYMARKET
-- ITEM.UnitPrice 			= 300
-- ITEM.SellPrice 			= 100

ITEM.ItemGroup 			= "Clothing"

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			_base = {
				Bodygroups = {
					hat = 6
				},
				Materials = {
					["models/tnb/techcom/trenchcoat1"] = "models/tnb/techcom/trenchcoat1_beret_uneca"
			}
			}
		}
	end
end

return ITEM