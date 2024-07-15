ITEM = class.Create("base_clothing")

ITEM.Name 				= "Civil Authority Dress Slacks"
ITEM.Description 		= "A grey, pressed pair of pants for Combine Civil Authority Officials."

ITEM.Model 				= Model("models/tnb/halflife2/world_legs_metropolice.mdl")
ITEM.Skin 				= 0

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_LEGS}

ITEM.ArmorLevel 		= ARMOR_BASIC

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories        = {
    ["Left Pocket"] = {1, 2},
    ["Right Pocket"] = {1, 2}
}

if SERVER then
    function ITEM:GetModelData(ply)
        local gender = GAMEMODE:GetGenderString(ply:CharModel())

		return {
            legs = {
                Model = string.format("models/tnb/halflife/%s_legs_officer.mdl", gender),
            }
        }
	end
end

return ITEM
