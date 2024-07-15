ITEM = class.Create("base_clothing")

ITEM.Name 				= "Suit Pants"
ITEM.Description 		= "Worn by the upper echelon of the city."

ITEM.Model 				= Model("models/tnb/halflife2/citizens/items/world_suitjacket_legs.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_LEGS}

-- ITEM.License 			= LICENSE_CLOTHING
-- ITEM.UnitPrice 			= 60
-- ITEM.SellPrice 			= 25

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories        = {
    ["Left Pocket"] = {1, 2},
    ["Right Pocket"] = {1, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			legs = {
				Model = Model(string.format("models/tnb/halflife2/%s_legs_suitjacket.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
            }
		}
	end
end

return ITEM
