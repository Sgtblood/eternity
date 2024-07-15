ITEM = class.Create("base_clothing")

ITEM.Name 				= "Welders Uniform"
ITEM.Description 		= "Perfect for protecting from the harmful circumstances of a workshift."

ITEM.Model 				= Model("models/tnb/halflife2/citizens/items/item_suit_worker.mdl")
ITEM.Skin 				= 0

ITEM.Width 				= 3
ITEM.Height 			= 3

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.License            = LICENSE_CLOTHING
ITEM.UnitPrice          = 250
ITEM.SellPrice          = 100

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories        = {
    ["Left Pocket"] = {1, 2},
    ["Right Pocket"] = {1, 2}
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
                Model = string.format("models/tnb/halflife2/%s_suit_worker.mdl", gender),
                Skin = 0
            }
        }
	end

     function ITEM:PostModelData(ply, data)
        data.legs = nil

        return data
    end

end

return ITEM
