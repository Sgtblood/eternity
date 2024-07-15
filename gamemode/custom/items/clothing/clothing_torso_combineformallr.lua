ITEM = class.Create("base_clothing")

ITEM.Name 				= "Combine Dress Uniform"
ITEM.Description 		= "A Combine Dress Uniform, designed for formal settings. The Uniform comes pristine and clean, accommodating attachable medals and pins from the Universal Union. Stored neatly and polished within a box."

ITEM.Model 				= Model("models/hls/alyxports/cardboard_box_3.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.ArmorLevel 		= ARMOR_BASIC

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {2, 2}
}

if SERVER then

    function ITEM:GetModelData(ply)
        local gender = GAMEMODE:GetGenderString(ply:CharModel())

		return {
            torso = {
                Model = string.format("models/ma/offduty/%s_bodyupper.mdl", gender),
                Skin = 0,
                Bodygroups = {
                    Body = 0,
                    Epaulettes = 0
                }
            }
        }
	end

        function ITEM:PostModelData(ply, data)
        data.hands = nil

        return data
    end

end

return ITEM
