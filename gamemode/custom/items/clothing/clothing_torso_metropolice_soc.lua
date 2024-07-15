ITEM = class.Create("base_clothing")

ITEM.Name 				= "CCA City Operations Commander Uniform"
ITEM.Description 		= "A pristine and thickly padded commander's uniform, the weight alone made it considerably clear how much more attention and care was put into its design than the common uniform."

ITEM.Model 				= Model("models/tnb/halflife2/world_torso_metropolice.mdl")
ITEM.Skin 				= 1

ITEM.Width 				= 3
ITEM.Height 			= 3

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.ArmorLevel         = ARMOR_SUPER

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {2, 3}
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
                Skin = 6
            }
        }
	end

        function ITEM:PostModelData(ply, data)
        data.hands = nil

        return data
    end

end

return ITEM
