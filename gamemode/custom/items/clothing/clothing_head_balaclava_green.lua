ITEM = class.Create("base_clothing")

ITEM.Name 				= "Green Balaclava"
ITEM.Description 		= "A green balaclava with accompanying ski goggles."

ITEM.Model 				= Model("models/Items/item_item_crate.mdl")
ITEM.Skin 				= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_HEAD}

ITEM.ItemGroup 			= "Clothing"
ITEM.Filtered 			= false

ITEM.License 			= LICENSE_GREYMARKET
ITEM.UnitPrice 			= 100
ITEM.SellPrice 			= 45

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			_base = {
				HideHead = true
			},
			head = {
				Model = Model(string.format("models/tnb/heads/trp/%s_balaclava.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
				Materials = {
					["models/tnb/techcom/headgear1"] = "models/tnb/techcom/headgear1_green"
			}
			}
		}
	end
end

return ITEM
