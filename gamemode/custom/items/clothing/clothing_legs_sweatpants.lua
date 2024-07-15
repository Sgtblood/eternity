ITEM = class.Create("base_clothing")

ITEM.Name 				= "Black Sweat Pants"
ITEM.Description 		= "Baggy but comfortable and warm."

ITEM.Model 				= Model("models/tnb/halflife2/citizens/items/world_grimyuniform_legs.mdl")
ITEM.Skin 				= 0

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_LEGS}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 50
ITEM.SellPrice 			= 20

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories        = {
    ["Left Pocket"] = {1, 2},
    ["Right Pocket"] = {1, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			legs = {
				Model = Model(string.format("models/tnb/halflife2/%s_legs_bosnian.mdl", GAMEMODE:GetGenderString(ply:CharModel())))            }
		}
	end
end

return ITEM
