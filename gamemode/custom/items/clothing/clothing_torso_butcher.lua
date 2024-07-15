ITEM = class.Create("base_clothing")

ITEM.Name 				= "Butchers Uniform"
ITEM.Description 		= "For the backbone of the Union workforce."

ITEM.Model 				= Model("models/tnb/halflife2/citizens/items/world_metalworker.mdl")
ITEM.Skin 				= 0

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 150
ITEM.SellPrice 			= 55

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {1, 2}
}


if SERVER then
	function ITEM:GetModelData(ply)
		return {
			torso = {
				Model = Model(string.format("models/tnb/halflife2/%s_torso_worker_apron.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
				Skin = 0
			}
		}
	end
end

return ITEM