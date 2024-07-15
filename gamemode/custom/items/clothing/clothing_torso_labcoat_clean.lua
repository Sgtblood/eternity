ITEM = class.Create("base_clothing")

ITEM.Name 				= "Clean Lab Coat"
ITEM.Description 		= "Torn and cut up. Despite this it's rather clean."

ITEM.Model 				= Model("models/props_junk/cardboard_box003a.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

-- ITEM.License 			= LICENSE_CLOTHING
-- ITEM.UnitPrice 			= 200
-- ITEM.SellPrice 			= 95

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {2, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			torso = {
				Model = Model(string.format("models/tnb/halflife2/%s_torso_labcoat.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
				Skin = 1
			}
		}
	end
end

return ITEM
