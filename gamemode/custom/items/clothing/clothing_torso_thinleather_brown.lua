ITEM = class.Create("base_clothing")

ITEM.Name 				= "Thin Brown Leather Jacket"
ITEM.Description 		= "A brown thin leather jacket, can provide some protection from the elements."

ITEM.Model 				= Model("models/tnb/items/trp/clothes/item_survivor_jacket.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 65
ITEM.SellPrice 			= 30

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {2, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			torso = {
				Model = Model(string.format("models/tnb/halflife2/%s_torso_leatherjacket3.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
				Skin = 1
			}
		}
	end
end

return ITEM
