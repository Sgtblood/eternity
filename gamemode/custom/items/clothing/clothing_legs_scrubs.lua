ITEM = class.Create("base_clothing")

ITEM.Name 				= "Medical Pants"
ITEM.Description 		= "A set of blue medical scrub-pants for medics.."

ITEM.Model 				= Model("models/tnb/items/pants_citizen.mdl")
ITEM.Skin 				= 0

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_LEGS}



ITEM.ItemGroup 			= "Clothing"

ITEM.ArmorLevel			= ARMOR_NONE

ITEM.Inventories        = {
    ["Left Pocket"] = {1, 2},
    ["Right Pocket"] = {1, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			legs = {
				Model = Model(string.format("models/tnb/halflife/%s_legs_scrubs.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
            }
		}
	end
end

return ITEM
