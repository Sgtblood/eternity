ITEM = class.Create("base_clothing")

ITEM.Name 				= "First Responder Backpack"
ITEM.Description 		= "Faded and cut up. This backpack was used by the first line of the world pre-war."

ITEM.Model 				= Model("models/tnb/items/shared/item_coyote.mdl")

ITEM.Width 				= 3
ITEM.Height 			= 3

ITEM.EquipmentSlots 	= {EQUIPMENT_BACK}

ITEM.License 			= LICENSE_GREYMARKET
ITEM.UnitPrice 			= 2650
ITEM.SellPrice 			= 375

ITEM.ItemGroup 			= "Clothing"

ITEM.StoreBlock			= STOREBLOCK_BACKPACK
ITEM.Inventories 		= {
	["Main"] = {3, 3}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			back = {
                Model = Model(string.format("models/tnb/halflife2/rebels/%s_backpack_rebel2.mdl", GAMEMODE:GetGenderString(ply:CharModel())))
			}
		}
	end
end

return ITEM
