ITEM = class.Create("base_clothing")

ITEM.Name 				= "Combine Medical Hazmat Suit"
ITEM.Description 		= "A blue visibility suit meant to protect you from your toxic friends, and their sickness."

ITEM.Model 				= Model("models/wick/wrbstalker/anomaly/items/wick_case.mdl")
ITEM.Skin 				= 0

ITEM.Width 				= 3
ITEM.Height 			= 3

ITEM.OutlineColor       = Color(134, 197, 218)

ITEM.ArmorOverride      = true
ITEM.ArmorLevel         = ARMOR_LIGHT

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories        = {
    ["Left Pocket"] = {1, 2},
    ["Right Pocket"] = {1, 2}
}

ITEM.Filtered           = true

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
                Model = string.format("models/cellar/characters/hazmat/medic_%s.mdl", gender),
                Skin = 0
            }
        }
	end

     function ITEM:PostModelData(ply, data)
        data.legs = nil
        data.hands = nil

        return data
    end

end

return ITEM
