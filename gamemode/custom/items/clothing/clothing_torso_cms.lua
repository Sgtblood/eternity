ITEM = class.Create("base_clothing")

ITEM.Name 				= "CMS Suit"
ITEM.Description 		= "Used by the CMS branch of the CCA."

ITEM.Model 				= Model("models/props_junk/cardboard_box003a.mdl")
ITEM.Skin 				= 0

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
				Model = Model(string.format("models/tnb/halflife2/cms/%s_torso_cms.mdl", GAMEMODE:GetGenderString(ply:CharModel())))
			}
		}
	end
end

return ITEM
