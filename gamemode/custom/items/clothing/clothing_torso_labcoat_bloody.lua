ITEM = class.Create("base_clothing")

ITEM.Name 				= "Bloodied Lab Coat"
ITEM.Description 		= "Torn, cut up, and blood lab coat."

ITEM.Model 				= Model("models/props_junk/cardboard_box003a.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}



ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {2, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			torso = {
				Model = Model(string.format("models/tnb/halflife2/%s_torso_labcoat.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
				Skin = 0
			}
		}
	end
end

return ITEM
