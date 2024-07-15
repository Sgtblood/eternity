ITEM = class.Create("base_clothing")

ITEM.Name 				= "Civil Protection Squad Leader Uniform"
ITEM.Description 		= "A superior-rated uniform, crafted for a dedicated and ambitious squad leader."

ITEM.Model 				= Model("models/tnb/halflife2/world_torso_metropolice.mdl")
ITEM.Skin 				= 2

ITEM.Width 				= 2
ITEM.Height 			= 3

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.ArmorLevel         = ARMOR_HEAVY

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
                Model = string.format("models/tnb/halflife2/cca/%s_torso_metropolice_variant.mdl", gender),
                Skin = 2
            }
        }
	end

        function ITEM:PostModelData(ply, data)
        data.hands = nil

        return data
    end

end

return ITEM
