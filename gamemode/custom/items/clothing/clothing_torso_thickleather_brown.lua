ITEM = class.Create("base_clothing")

ITEM.Name 				= "Thick Brown Leather Jacket"
ITEM.Description 		= "A brown leather jacket. Quite thick.."

ITEM.Model 				= Model("models/tnb/items/trp/clothes/item_survivor_leatherjacket.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 200
ITEM.SellPrice 			= 95

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {2, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			torso = {
				Model = Model(string.format("models/tnb/halflife2/%s_torso_leatherjacket4.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
				Skin = 0
			}
		}
	end
end

return ITEM
