ITEM = class.Create("base_clothing")

ITEM.Name 				= "Small Bag"
ITEM.Description 		= "A small pack capable of fitting only a handful of items."

ITEM.Model 				= Model("models/tnb/items/shared/item_max_fuchs.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_BACK}

ITEM.License 			= LICENSE_MISCGOODS
ITEM.UnitPrice 			= 500
ITEM.SellPrice 			= 80

ITEM.ItemGroup 			= "Clothing"

ITEM.StoreBlock			= STOREBLOCK_BACKPACK
ITEM.Inventories 		= {
	["Main"] = {2, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			back = {
                Model = Model("models/player/backpack_molle/bp_max_fuchs_body_lod0.mdl"),
			}
		}
	end
end

return ITEM
