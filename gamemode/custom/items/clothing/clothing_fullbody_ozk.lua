ITEM = class.Create("base_clothing")

ITEM.Name 				= "OZK-Soviet Hazmat"
ITEM.Description 		= "A OZK-Soviet Hazmat, commonly used by Soviet Officials."

ITEM.Model 				= Model("models/Items/item_item_crate.mdl")
ITEM.Skin 				= 1

ITEM.Width 				= 3
ITEM.Height 			= 3

ITEM.ArmorOverride      = true
ITEM.ArmorLevel 		= ARMOR_LIGHT

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {2, 2}
}

ITEM.Filtered 			= true

if SERVER then
    function ITEM:SetupHands(ply, ent)
        ent:SetModel("models/weapons/c_arms_combine.mdl")
        ent:SetSkin(0)
        ent:SetBodyGroups("00000000")
    
        return true
    end
    
    function ITEM:PostModelData(ply, old)
            return { 
                _base = {
                    Model = Model("models/purgatory/soviet/zashita/ozk_razgruzka_pm.mdl"),
                    Skin = 0
                }
        }
    end
end

return ITEM
