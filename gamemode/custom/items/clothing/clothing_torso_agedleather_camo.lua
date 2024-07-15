ITEM = class.Create("base_clothing")

ITEM.Name 				= "Aged Camo Leather Jacket"
ITEM.Description 		= "Torn, stretched, and ancient camo leather jacket."

ITEM.Model 				= Model("models/tnb/items/trp/clothes/item_dirtyvest.mdl")
ITEM.Skin				= 1

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.License 			= LICENSE_GREYMARKET
ITEM.UnitPrice 			= 200
ITEM.SellPrice 			= 75

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {2, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			torso = {
				Model = Model(string.format("models/tnb/halflife2/%s_torso_dirtyvest.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
				Skin = 1
			}
		}
	end
end

return ITEM
