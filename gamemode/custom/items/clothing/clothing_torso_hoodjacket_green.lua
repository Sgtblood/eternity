ITEM = class.Create("base_clothing")

ITEM.Name 				= "Green Hooded Coat"
ITEM.Description 		= "Thick jacket with a hooded sweatshirt beneath."

ITEM.Model 				= Model("models/tnb/halflife2/citizens/items/item_torso_coathood.mdl")
ITEM.Skin				= 2

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 225
ITEM.SellPrice 			= 75

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {2, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			torso = {
				Model = Model(string.format("models/tnb/halflife2/%s_torso_coathood.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
				Skin = 2
			}
		}
	end
end

return ITEM
