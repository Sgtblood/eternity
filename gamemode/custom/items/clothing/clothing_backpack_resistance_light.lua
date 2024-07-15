ITEM = class.Create("base_clothing")

ITEM.Name 				= "Light Resistance Backpack"
ITEM.Description 		= "Black backpack commonly associated with rebels."

ITEM.Model 				= Model("models/props_c17/suitcase_passenger_physics.mdl")

ITEM.Width 				= 3
ITEM.Height 			= 3

ITEM.EquipmentSlots 	= {EQUIPMENT_BACK}

--ITEM.License 			= LICENSE_CLOTHING
--ITEM.UnitPrice 			= 200
--ITEM.SellPrice 			= 100

ITEM.ItemGroup 			= "Clothing"

ITEM.StoreBlock			= STOREBLOCK_BACKPACK
ITEM.Inventories 		= {
	["Main"] = {2, 3}
}

if SERVER then
	function ITEM:GetModelData(ply)
	
		local model = "models/tnb/halflife2/rebels/%s_backpack_rebel4.mdl"

		return {
			back = {
                Model = Model(string.format(model, GAMEMODE:GetGenderString(ply:CharModel()))),
			}
		}
	end
end

return ITEM
