ITEM = class.Create("base_clothing")

ITEM.Name 				= "Infestation Control Director Suit"
ITEM.Description 		= "All knowning."

ITEM.Model 				= Model("models/tnb/halflife2/citizens/items/item_hazmat.mdl")
ITEM.Material           = "models/hlvr/characters/hazmat_worker/hazmat_worker_black"

ITEM.Width 				= 3
ITEM.Height 			= 3

ITEM.OutlineColor       = Color(134, 197, 218)

ITEM.ArmorOverride      = true
ITEM.ArmorLevel         = ARMOR_HEAVY

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
                Model = string.format("models/tnb/halflife2/%s_suit_hazmat_white.mdl", gender),
                Materials = {
                    ["models/hlvr/characters/hazmat_worker/hazmat_worker_3"] = "models/hlvr/characters/hazmat_worker/hazmat_worker_black"
            }
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
