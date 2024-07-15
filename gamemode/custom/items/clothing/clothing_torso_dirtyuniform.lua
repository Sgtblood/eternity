ITEM = class.Create("base_clothing")

ITEM.Name 				= "Dirty Uniform"
ITEM.Description 		= "The other half of a working mans uniform."

ITEM.Model 				= Model("models/tnb/halflife2/citizens/items/world_grimyuniform.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 50
ITEM.SellPrice 			= 20

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {1, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			torso = {
				Model = Model(string.format("models/tnb/halflife2/%s_torso_grimyuniform.mdl", GAMEMODE:GetGenderString(ply:CharModel())))
			}
		}
	end
end

return ITEM
