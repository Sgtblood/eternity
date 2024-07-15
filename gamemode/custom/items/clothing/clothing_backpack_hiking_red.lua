ITEM = class.Create("base_clothing")

ITEM.Name 				= "Hiking Backpack"
ITEM.Description 		= "Used mostly for those long walks through nature trails."

ITEM.Model 				= Model("models/tnb/halflife2/citizens/items/item_backpack1.mdl")
ITEM.Skin				= 2

ITEM.Width 				= 3
ITEM.Height 			= 4

ITEM.EquipmentSlots 	= {EQUIPMENT_BACK}

ITEM.License 			= LICENSE_GREYMARKET
ITEM.UnitPrice 			= 4500
ITEM.SellPrice 			= 225

ITEM.ItemGroup 			= "Clothing"

ITEM.StoreBlock			= STOREBLOCK_BACKPACK
ITEM.Inventories 		= {
	["Main"] = {4, 4}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			back = {
                Model = Model(string.format("models/tnb/halflife2/%s_backpack1.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
                Skin = 2
			}
		}
	end
end

return ITEM
