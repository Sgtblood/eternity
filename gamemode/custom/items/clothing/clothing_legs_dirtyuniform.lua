ITEM = class.Create("base_clothing")

ITEM.Name 				= "Dirty work outfit"
ITEM.Description 		= "Part of a working mans uniform."

ITEM.Model 				= Model("models/tnb/halflife2/citizens/items/world_grimyuniform_legs.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_LEGS}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 75
ITEM.SellPrice 			= 25

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories        = {
    ["Left Pocket"] = {1, 2},
    ["Right Pocket"] = {1, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			legs = {
				Model = Model(string.format("models/tnb/halflife2/%s_legs_grimyuniform.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
            }
		}
	end
end

return ITEM
