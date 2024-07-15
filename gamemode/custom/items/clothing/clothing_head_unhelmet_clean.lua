ITEM = class.Create("base_clothing")

ITEM.Name 				= "UN Helmet"
ITEM.Description 		= "Old World United Nations helmet."

ITEM.Model 				= Model("models/tnb/items/trp/headgear/hat16.mdl")
ITEM.Material 			= "models/tnb/techcom/headgear2_un"

ITEM.EquipmentSlots 	= {EQUIPMENT_HEAD}


ITEM.ItemGroup 			= "Clothing"


if SERVER then
	function ITEM:GetModelData(ply)
		return {
			_base = {
				Bodygroups = {
					hat = 15
				},
				Materials = {
					["models/tnb/techcom/headgear2"] = "models/tnb/techcom/headgear2_un"
			}
			}
		}
	end
end

return ITEM