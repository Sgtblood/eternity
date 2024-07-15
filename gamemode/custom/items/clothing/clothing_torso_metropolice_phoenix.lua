ITEM = class.Create("base_clothing")

ITEM.Name 				= "Civil Protection Phoenix Uniform"
ITEM.Description 		= "A Red Uniform for the Squad 'Phoenix'."

ITEM.Model 				= Model("models/tnb/halflife2/cca/items/world_torso_metropolice.mdl")
ITEM.Skin 				= 0

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.ArmorLevel         = ARMOR_LIGHT

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {2, 2}
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
                Model = string.format("models/tnb/halflife2/%s_torso_metrocop_variant.mdl", gender),
                Skin = 3
            }
        }
	end

        function ITEM:PostModelData(ply, data)
        data.hands = nil

        return data
    end

end

return ITEM
