ITEM = class.Create("base_clothing")

ITEM.Name 				= "Helmet"
ITEM.Description 		= "Old world woodland camo helmet."

ITEM.Model 				= Model("models/tnb/items/trp/headgear/hat16.mdl")
ITEM.Material           = "models/tnb/techcom/headgear2_wdlnd"

ITEM.EquipmentSlots 	= {EQUIPMENT_HEAD}

-- ITEM.License 			= LICENSE_GREYMARKET
-- ITEM.UnitPrice 			= 500
-- ITEM.SellPrice 			= 200

ITEM.ItemGroup 			= "Clothing"

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			_base = {
				Bodygroups = {
					hat = 15
				},
				Materials = {
					["models/tnb/techcom/headgear2"] = "models/tnb/techcom/headgear2_wdlnd"
			}
			}
		}
	end
end

return ITEM