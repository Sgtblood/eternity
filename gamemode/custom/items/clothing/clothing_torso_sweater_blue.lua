ITEM = class.Create("base_clothing")

ITEM.Name 				= "Blue Sweater"
ITEM.Description 		= "Stained and aged blue sweater."

ITEM.Model 				= Model("models/tnb/items/trp/clothes/item_dirtyshirt.mdl")
ITEM.Skin				= 0

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 100
ITEM.SellPrice 			= 50

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {2, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			torso = {
				Model = Model(string.format("models/tnb/halflife2/%s_torso_dirtyshirt.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
				Skin = 0
			}
		}
	end
end

return ITEM
