ITEM = class.Create("base_clothing")

ITEM.Name 				= "Green Canvas Jacket"
ITEM.Description 		= "A large, green jacket with more than a few pockets."

ITEM.Model 				= Model("models/tnb/halflife2/citizens/items/item_raincoat1.mdl")
ITEM.Skin 				= 0

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 100
ITEM.SellPrice 			= 50

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {1, 2}
}


if SERVER then
	function ITEM:GetModelData(ply)
		return {
			torso = {
				Model = Model(string.format("models/tnb/halflife2/%s_torso_raincoat1.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
				Skin = 0
			}
		}
	end
end

return ITEM