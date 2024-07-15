ITEM = class.Create("base_clothing")

ITEM.Name 				= "OZKF Combat Gear"
ITEM.Description 		= "A modern design of many lacklusting Hazmats, used by the Combine's first generation of COTA in Eastern Europe, now recycled and abandoned."

ITEM.Model 				= Model("models/Items/item_item_crate.mdl")
ITEM.Skin 				= 1

ITEM.Width 				= 3
ITEM.Height 			= 3

ITEM.ArmorOverride      = true
ITEM.ArmorLevel 		= ARMOR_HEAVY

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
                    Model = Model("models/musfog/army/equipment/ozkf_ratnik_boevoy_pm.mdl"),
                    Skin = 1
                }
        }
    end
end

return ITEM
