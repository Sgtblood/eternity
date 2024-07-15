ITEM = class.Create("base_clothing")

ITEM.Name 				= "Nylon Jacket"
ITEM.Description 		= "Formly green jacket, worn with age. Comes with a thick sweater beneath."

ITEM.Model 				= Model("models/tnb/halflife2/citizens/items/item_unzippedjacket.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 75
ITEM.SellPrice 			= 25

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {1, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			torso = {
				Model = Model(string.format("models/tnb/halflife2/%s_torso_unzippedjacket.mdl", GAMEMODE:GetGenderString(ply:CharModel())))
			}
		}
	end
end

return ITEM
