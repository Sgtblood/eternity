ITEM = class.Create("base_clothing")

ITEM.Name 				= "Brown Bomber Jacket"
ITEM.Description 		= "A large, brown jacket. Eastern Europeans choice of jacket."

ITEM.Model 				= Model("models/tnb/halflife2/citizens/items/item_torso_bomberjacket.mdl")
ITEM.Skin				= 0

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 250
ITEM.SellPrice 			= 100

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {2, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			torso = {
				Model = Model(string.format("models/tnb/halflife2/%s_torso_bomberjacket.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
				Skin = 0,
			}
		}
	end
end

return ITEM
