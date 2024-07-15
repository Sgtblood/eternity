ITEM = class.Create("base_clothing")

ITEM.Name 				= "BMD SHADOW SET"
ITEM.Description 		= "Blacked out Armor, used by what remains of a shadowy organization."

ITEM.Model 				= Model("models/wick/wrbstalker/anomaly/items/dez_upgr_o_3.mdl")
ITEM.Skin 				= 1

ITEM.Width 				= 3
ITEM.Height 			= 3

ITEM.ArmorOverride      = true
ITEM.ArmorLevel 		= ARMOR_SUPER

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {3, 3}
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
                    Model = Model("models/schmutz/blackopshave.mdl")
                }
        }
    end
end

return ITEM
