ITEM = class.Create("base_clothing")

ITEM.Name 				= "Combine Airtank"
ITEM.Description 		= "A Airtank mass-produced by the Combine, that can provide a large supply of air to the user for a prolonged period. A necessity for many, a gold mine for others."

ITEM.Model 				= Model("models/tnb/items/shared/item_oxygen.mdl")

ITEM.Width 				= 3
ITEM.Height 			= 3

ITEM.EquipmentSlots 	= {EQUIPMENT_BACK}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 300
ITEM.SellPrice 			= 130

ITEM.ItemGroup 			= "Clothing"

ITEM.StoreBlock			= STOREBLOCK_BACKPACK
ITEM.Inventories 		= {
	["Main"] = {1, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			back = {
                Model = Model("models/tnb/clothing/shared/pack_oxygen.mdl"),
			}
		}
	end
end

return ITEM
