ITEM = class.Create("base_clothing")

ITEM.Name 				= "Yellow Rain Coat"
ITEM.Description 		= "A large, yellow jacket used for stormy weather."

ITEM.Model 				= Model("models/tnb/halflife2/citizens/items/item_raincoat2.mdl")
ITEM.Skin 				= 0

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 150
ITEM.SellPrice 			= 45

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {1, 2}
}


if SERVER then
	function ITEM:GetModelData(ply)
		return {
			torso = {
				Model = Model(string.format("models/tnb/halflife2/%s_torso_raincoat2.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
				Skin = 0
			}
		}
	end
end

return ITEM