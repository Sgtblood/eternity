ITEM = class.Create("base_clothing")

ITEM.Name 				= "Blue Jacket"
ITEM.Description 		= "Thick blue jacket meant for the colder months of the world."

ITEM.Model 				= Model("models/Items/item_item_crate.mdl")
ITEM.Skin 				= 1

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 125
ITEM.SellPrice 			= 45

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {1, 2}
}


if SERVER then
	function ITEM:GetModelData(ply)
		return {
			torso = {
				Model = Model(string.format("models/tnb/halflife2/%s_torso_bosnian.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
				Skin = 0
			}
		}
	end
end

return ITEM