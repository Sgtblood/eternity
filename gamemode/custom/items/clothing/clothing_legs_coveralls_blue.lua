ITEM = class.Create("base_clothing")

ITEM.Name 				= "Blue Coveralls Pants"
ITEM.Description 		= "Legs of the outfit worn by the civilian populace usually within factories across the Union."

ITEM.Model 				= Model("models/tnb/halflife2/citizens/items/world_coverall_legs.mdl")
ITEM.Skin 				= 2

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_LEGS}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 50
ITEM.SellPrice 			= 10

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories        = {
    ["Left Pocket"] = {1, 2},
    ["Right Pocket"] = {1, 2}
}


if SERVER then
	function ITEM:GetModelData(ply)
		return {
			legs = {
				Model = Model(string.format("models/tnb/halflife2/%s_legs_coveralls.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
				Skin = 2
			}
		}
	end
end

return ITEM