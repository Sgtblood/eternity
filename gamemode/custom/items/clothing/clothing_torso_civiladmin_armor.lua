ITEM = class.Create("base_clothing")

ITEM.Name 				= "Civil Administration Security Armor"
ITEM.Description 		= "A White and Pristine variant of Civil Authority Armor. Designated for the member's of the Civil Administration Branch. Offers better protection then the usual set."

ITEM.Model 				= Model("models/tnb/halflife2/cca/items/world_torso_metropolice.mdl")
ITEM.Material           = "models/tnb/cca/c13/metro13_white_ca"


ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.ArmorLevel 		= ARMOR_SUPER

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {2, 1}
}

if SERVER then
    function ITEM:SetupHands(ply, ent)
        ent:SetModel("models/weapons/c_arms_combine.mdl")
        ent:SetSkin(0)
        ent:SetBodyGroups("00000000")
    
        return true
    end

    function ITEM:GetModelData(ply)
        local gender = GAMEMODE:GetGenderString(ply:CharModel())

		return {
            torso = {
                Model = string.format("models/tnb/halflife2/cca/%s_torso_metropolice_variant.mdl", gender),
                Skin = 5
            }
        }
	end

        function ITEM:PostModelData(ply, data)
        data.hands = nil

        return data
    end

end

return ITEM
