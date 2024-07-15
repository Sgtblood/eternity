ITEM = class.Create("base_clothing")

ITEM.Name 				= "Soviet Alicepack"
ITEM.Description 		= "A large and rare reminder of Soviet efficiency and effectiveness. It's fetchs a very nice price."

ITEM.Model 				= Model("models/props_c17/suitcase001a.mdl")

ITEM.Width 				= 4
ITEM.Height 			= 4

ITEM.EquipmentSlots 	= {EQUIPMENT_BACK}

-- ITEM.License 			= LICENSE_MISCGOODS
-- ITEM.UnitPrice 			= 600
-- ITEM.SellPrice 			= 200

ITEM.ItemGroup 			= "Clothing"

ITEM.StoreBlock			= STOREBLOCK_BACKPACK
ITEM.Inventories 		= {
	["Main"] = {5, 5}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			back = {
				Model = Model("models/player/backpack_sso/bp_sso_body_lod0.mdl")
			}
		}
	end
end

return ITEM
