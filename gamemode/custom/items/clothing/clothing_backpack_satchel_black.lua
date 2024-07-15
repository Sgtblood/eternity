ITEM = class.Create("base_clothing")

ITEM.Name 				= "Black Satchel"
ITEM.Description 		= "Small and helpful."

ITEM.Model 				= Model("models/tnb/halflife2/citizens/items/item_satchel.mdl")
ITEM.Skin				= 0

ITEM.Width 				= 1
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_BACK}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 250
ITEM.SellPrice 			= 75

ITEM.ItemGroup 			= "Clothing"

ITEM.StoreBlock			= STOREBLOCK_BACKPACK
ITEM.Inventories 		= {
	["Main"] = {2, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			back = {
                Model = Model(string.format("models/tnb/halflife2/%s_bag_satchel.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
                Skin = 0
			}
		}
	end
end

return ITEM
