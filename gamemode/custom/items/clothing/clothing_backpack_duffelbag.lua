ITEM = class.Create("base_clothing")

ITEM.Name 				= "Duffel bag"
ITEM.Description 		= "An old duffel bag, rather spacious on the inside."

ITEM.Model 				= Model("models/tnb/items/bag.mdl")
ITEM.Skin 				= 1

ITEM.Width 				= 3
ITEM.Height 			= 3

ITEM.EquipmentSlots 	= {EQUIPMENT_BACK}

ITEM.License 			= LICENSE_GREYMARKET
ITEM.UnitPrice 			= 3250
ITEM.SellPrice 			= 375

ITEM.ItemGroup 			= "Clothing"

ITEM.StoreBlock			= STOREBLOCK_BACKPACK
ITEM.Inventories 		= {
	["Main"] = {4, 3}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			back = {
                Model = Model(string.format("models/tnb/halflife2/rebels/%s_backpack_rebel6.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
                Materials = {
					["models/tnb/rebels/rebel_bag"] = "models/tnb/rebels/rebel_bag_plain"
			}
			}
		}
	end
end

return ITEM
