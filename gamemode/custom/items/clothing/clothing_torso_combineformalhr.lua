ITEM = class.Create("base_clothing")

ITEM.Name 				= "Combine Command Dress Uniform"
ITEM.Description 		= "A Officer's Uniform. Reserved for those within the Combine Civil Authority who have reached the status of Command. It's pristine and clean, and feature's an attachable leather holster. Stored within a Dress Briefcase."

ITEM.Model 				= Model("models/props_c17/suitcase003a.mdl")



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
                    Epaulettes = 1
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
