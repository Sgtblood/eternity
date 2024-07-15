ITEM = class.Create("base_clothing")

ITEM.Name 				= "Electrical Worker's Waders"
ITEM.Description 		= "A Mad man who waddles water is but a mad man."

ITEM.Model 				= Model("models/tnb/halflife/world_legs_larry.mdl")
ITEM.Skin 				= 1

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_LEGS}

ITEM.License 			= LICENSE_GREYMARKET
ITEM.UnitPrice 			= 300
ITEM.SellPrice 			= 45

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories        = {
    ["Left Pocket"] = {1, 2},
    ["Right Pocket"] = {1, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			legs = {
				Model = Model(string.format("models/tnb/halflife/%s_legs_larry.mdl", GAMEMODE:GetGenderString(ply:CharModel())))            }
		}
	end
end

return ITEM
