ITEM = class.Create("base_clothing")

ITEM.Name 				= "Overcoat"
ITEM.Description 		= "A large, well kept overcoat worn by the more wealthy citizens of a city."

ITEM.Model 				= Model("models/tnb/halflife2/cca/items/world_metropolice_overcoat.mdl")
ITEM.Skin 				= 0

ITEM.Width 				= 3
ITEM.Height 			= 3

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}



ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {1, 2}
}


if SERVER then
	function ITEM:GetModelData(ply)
		return {
			torso = {
				Model = Model(string.format("models/tnb/halflife2/%s_torso_overcoat2.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
				Skin = 0
			}
		}
	end
end

return ITEM