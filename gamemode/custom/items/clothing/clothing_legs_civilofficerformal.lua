ITEM = class.Create("base_clothing")

ITEM.Name 				= "Civil Administration Formal Leggings"
ITEM.Description 		= "A Civil Member Uniform's Leggings. Reserved for those within the Civil Administration or who have graduated from the academy. It's pristine and clean."

ITEM.Model 				= Model("models/tnb/halflife2/world_legs_metropolice.mdl")
ITEM.Skin 				= 2

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_LEGS}

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories        = {
    ["Left Pocket"] = {1, 2},
    ["Right Pocket"] = {1, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			legs = {
				Model = Model(string.format("models/ma/offduty/%s_bodylower.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
				Skin = 0,
				Bodygroups = {
                    Body = 1
                }
			}
		}
	end
end

return ITEM
