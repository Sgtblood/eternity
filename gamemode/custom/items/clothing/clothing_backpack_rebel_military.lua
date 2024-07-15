ITEM = class.Create("base_clothing")

ITEM.Name 				= "Soviet Military Pack"
ITEM.Description 		= "A spacious backpack dating from a forgotten era of war. Now reborn."

ITEM.Model 				= Model("models/tnb/items/shared/item_paratus.mdl")

ITEM.Width 				= 4
ITEM.Height 			= 3

ITEM.EquipmentSlots 	= {EQUIPMENT_BACK}

ITEM.License 			= LICENSE_GREYMARKET
ITEM.UnitPrice 			= 7500
ITEM.SellPrice 			= 300

ITEM.ItemGroup 			= "Clothing"

ITEM.StoreBlock			= STOREBLOCK_BACKPACK
ITEM.Inventories 		= {
	["Main"] = {4, 5}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			back = {
				Model = Model("models/player/backpack_paratus_3_day/bp_paratus_3_day_body_lod0.mdl")
			}
		}
	end
end

return ITEM
