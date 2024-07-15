ITEM = class.Create("base_clothing")

ITEM.Name 				= "Buckled Backpack"
ITEM.Description 		= "A large green sack held together by straps and buckles. Holds a good amount."

ITEM.Model 				= Model("models/tnb/items/shared/item_baul_vkbo.mdl")

ITEM.Width 				= 3
ITEM.Height 			= 3

ITEM.EquipmentSlots 	= {EQUIPMENT_BACK}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 3750
ITEM.SellPrice 			= 250

ITEM.ItemGroup 			= "Clothing"

ITEM.StoreBlock			= STOREBLOCK_BACKPACK
ITEM.Inventories 		= {
	["Main"] = {4, 3}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			back = {
                Model = Model("models/player/backpack_vkbo/bp_baul_vkbo_body_lod0.mdl"),
			}
		}
	end
end

return ITEM
