ITEM = class.Create("base_clothing")

ITEM.Name 				= "Hiking Backpack"
ITEM.Description 		= "Used mostly for those long walks through nature trails."

ITEM.Model 				= Model("models/tnb/halflife2/citizens/items/item_backpack1.mdl")

ITEM.Width 				= 3
ITEM.Height 			= 4

ITEM.EquipmentSlots 	= {EQUIPMENT_BACK}

ITEM.License 			= LICENSE_GREYMARKET
ITEM.UnitPrice 			= 500
ITEM.SellPrice 			= 225

ITEM.ItemGroup 			= "Clothing"

ITEM.StoreBlock			= STOREBLOCK_BACKPACK
ITEM.Inventories 		= {
	["Main"] = {3, 4}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			back = {
                Model = Model(string.format("models/tnb/halflife2/%s_backpack1.mdl", GAMEMODE:GetGenderString(ply:CharModel())))
			}
		}
	end
end

return ITEM
