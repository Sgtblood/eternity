ITEM = class.Create("base_clothing")

ITEM.Name 				= "Track Jacket"
ITEM.Description 		= "A blue, yellow, and white striped track jacket. Comes with a light grey undershirt."

ITEM.Model 				= Model("models/tnb/halflife/world_torso_rainjacket.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 75
ITEM.SellPrice 			= 35

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {1, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			torso = {
				Model = Model(string.format("models/tnb/halflife/%s_torso_rainjacket.mdl", GAMEMODE:GetGenderString(ply:CharModel())))
			}
		}
	end
end

return ITEM
