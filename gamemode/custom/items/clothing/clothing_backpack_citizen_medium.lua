ITEM = class.Create("base_clothing")

ITEM.Name 				= "Citizen Backpack"
ITEM.Description 		= "Black backpack commonly associated with citizens."

ITEM.Model 				= Model("models/tnb/items/shared/item_bp_rebel.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 3

ITEM.EquipmentSlots 	= {EQUIPMENT_BACK}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 2625
ITEM.SellPrice 			= 150

ITEM.ItemGroup 			= "Clothing"

ITEM.StoreBlock			= STOREBLOCK_BACKPACK
ITEM.Inventories 		= {
	["Main"] = {3, 3}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			back = {
                Model = Model("models/tnb/halflife/male_backpack_citizen.mdl"),
			}
		}
	end
end

return ITEM
