ITEM = class.Create("base_clothing")

ITEM.Name 				= "Purple Hiker's Pack"
ITEM.Description 		= "A tall backpack often used by hikers and traders."

ITEM.Model 				= Model("models/tnb/items/shared/item_pilgrim.mdl")

ITEM.Width 				= 4
ITEM.Height 			= 4

ITEM.EquipmentSlots 	= {EQUIPMENT_BACK}


ITEM.ItemGroup 			= "Clothing"

ITEM.StoreBlock			= STOREBLOCK_BACKPACK
ITEM.Inventories 		= {
	["Main"] = {4, 5}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			back = {
				Model = Model("models/player/backpack_pilgrim/bp_piligrimm_body_lod0.mdl")
			}
		}
	end
end

return ITEM
