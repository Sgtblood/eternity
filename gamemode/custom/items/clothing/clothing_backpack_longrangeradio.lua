ITEM = class.Create("base_clothing")

ITEM.Name 				= "Long Range Combine Radio"
ITEM.Description 		= "Long Range Radio, typically used by the Combine Overwatch, or CCA."

ITEM.Model 				= Model("models/tnb/halflife2/cca/items/item_bp_cp_radio1.mdl")

ITEM.Width 				= 3
ITEM.Height 			= 3

ITEM.EquipmentSlots 	= {EQUIPMENT_BACK}

-- ITEM.License 			= LICENSE_BLACKMARKET
-- ITEM.UnitPrice 			= 1000
-- ITEM.SellPrice 			= 450

ITEM.ItemGroup 			= "Clothing"

ITEM.StoreBlock			= STOREBLOCK_BACKPACK
ITEM.Inventories 		= {
	["Main"] = {3, 3}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			back = {
                Model = Model("models/tnb/halflife2/cca/items/bp_cp_radio1.mdl"),
			}
		}
	end
end

return ITEM
