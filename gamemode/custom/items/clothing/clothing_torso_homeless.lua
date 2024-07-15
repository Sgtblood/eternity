ITEM = class.Create("base_clothing")

ITEM.Name 				= "Disheveled Top"
ITEM.Description 		= "Probably worn by the local drunk."

ITEM.Model 				= Model("models/tnb/halflife2/citizens/items/item_torso_tramp.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 15
ITEM.SellPrice 			= 2

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {2, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			torso = {
				Model = Model(string.format("models/tnb/halflife2/%s_torso_tramp.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
				Skin = 0
			}
		}
	end
end

return ITEM