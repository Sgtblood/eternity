ITEM = class.Create("base_clothing")

ITEM.Name 				= "Soviet Survivalist Pack"
ITEM.Description 		= "Green backpack filled with small pockets and tons of space. Easily obtainable."

ITEM.Model 				= Model("models/props_junk/cardboard_box003a.mdl")

ITEM.Width 				= 3
ITEM.Height 			= 3

ITEM.EquipmentSlots 	= {EQUIPMENT_BACK}

ITEM.License 			= LICENSE_GREYMARKET
ITEM.UnitPrice 			= 1750
ITEM.SellPrice 			= 225

ITEM.ItemGroup 			= "Clothing"

ITEM.StoreBlock			= STOREBLOCK_BACKPACK
ITEM.Inventories 		= {
	["Main"] = {3, 3}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			back = {
				Model = Model(string.format("models/tnb/halflife2/rebels/%s_backpack_rebel1.mdl", GAMEMODE:GetGenderString(ply:CharModel())))
			}
		}
	end
end

return ITEM
