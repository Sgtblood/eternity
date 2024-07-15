ITEM = class.Create("base_clothing")

ITEM.Name               = "CEC Foreman's Uniform"
ITEM.Description        = "A orange construction suit plastered with Combine logos."

ITEM.Model              = Model("models/Items/item_item_crate.mdl")
ITEM.Skin               = 1

ITEM.Width              = 3
ITEM.Height             = 3

ITEM.OutlineColor       = Color(134, 197, 218)

ITEM.ArmorOverride      = true
ITEM.ArmorLevel         = ARMOR_LIGHT

ITEM.EquipmentSlots     = {EQUIPMENT_TORSO}

ITEM.ItemGroup          = "Clothing"

ITEM.Inventories        = {
    ["Left Pocket"] = {1, 2},
    ["Right Pocket"] = {1, 2}
}

ITEM.Filtered           = true

if SERVER then
    function ITEM:SetupHands(ply, ent)
        ent:SetModel("models/weapons/c_arms_hev.mdl")
        ent:SetSkin(0)
        ent:SetBodyGroups("00000000")
    
        return true
    end

    function ITEM:GetModelData(ply)
        local gender = GAMEMODE:GetGenderString(ply:CharModel())

		return {
            torso = {
                Model = string.format("models/tnb/halflife2/%s_torso_cecsuit.mdl", gender),
                Skin = 0,
                Materials = {
                    ["models/tnb/citizens/hazmat_worker_body1"] = "models/tnb/combine/worker/worker_suit_orange"
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
