ITEM = class.Create("base_clothing")

ITEM.Name 				= "Green Coveralls"
ITEM.Description 		= "Torso of the outfit worn by the civilian populace of C13."

ITEM.Model 				= Model("models/tnb/halflife2/citizens/items/world_coverall.mdl")
ITEM.Skin 				= 0

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 50
ITEM.SellPrice 			= 20

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {1, 2}
}


if SERVER then
	function ITEM:GetModelData(ply)
		return {
			torso = {
				Model = Model(string.format("models/tnb/halflife2/%s_torso_coveralls.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
				Skin = 1
			}
		}
	end
end

return ITEM