ITEM = class.Create("base_clothing")

ITEM.Name 				= "Combine Backpack"
ITEM.Description 		= "A black backpack intended for use by those who serve the Combine."

ITEM.Model 				= Model("models/tnb/items/shared/item_coyote.mdl")

ITEM.Width 				= 3
ITEM.Height 			= 3

ITEM.EquipmentSlots 	= {EQUIPMENT_BACK}

ITEM.ItemGroup 			= "Clothing"

ITEM.License 			= LICENSE_GREYMARKET
ITEM.UnitPrice 			= 2000
ITEM.SellPrice 			= 325

ITEM.StoreBlock			= STOREBLOCK_BACKPACK
ITEM.Inventories 		= {
	["Main"] = {3, 4}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			back = {
				Model = Model("models/tnb/clothing/shared/pack_coyote.mdl")
			}
		}
	end
end

return ITEM
