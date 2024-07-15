ITEM = class.Create("base_clothing")

ITEM.Name 				= "Union Trench Coat"
ITEM.Description 		= "Stylish trench coat for the collaborators of City C34."

ITEM.Model 				= Model("models/tnb/halflife2/cca/items/world_metropolice_overcoat.mdl")
ITEM.Skin				= 6

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}



ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {1, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			torso = {
				Model = Model(string.format("models/tnb/halflife2/%s_torso_overcoat2.mdl", GAMEMODE:GetGenderString(ply:CharModel())))
			}
		}
	end
end

return ITEM
