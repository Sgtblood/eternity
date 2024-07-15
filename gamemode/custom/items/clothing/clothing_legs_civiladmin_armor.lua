ITEM = class.Create("base_clothing")

ITEM.Name 				= "Civil Administration Armored Legs"
ITEM.Description 		= "An armored pair of pants befitting the Civil Administration."

ITEM.Model 				= Model("models/tnb/halflife2/world_legs_metropolice.mdl")
ITEM.Material                = "models/tnb/cca/c13/metro13_white_ca"

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_LEGS}

ITEM.ArmorLevel 		= ARMOR_HEAVY

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {2, 1}
}

if SERVER then
    function ITEM:GetModelData(ply)
        local gender = GAMEMODE:GetGenderString(ply:CharModel())

		return {
            legs = {
                Model = string.format("models/tnb/halflife2/ca/%s_legs_ca.mdl", gender),
					Materials = {
						["models/tnb/ca/cabottom"] = "models/tnb/cca/c13/metro13_white_ca" 
            },
            }
        }
	end
end

return ITEM
