ITEM = class.Create("base_clothing")

ITEM.Name 				= "Thin Black Jacket"
ITEM.Description 		= "A thin, black jacket. Comes with a formerly white undershirt."

ITEM.Model 				= Model("models/tnb/halflife/world_torso_jacket_black.mdl")

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
				Model = Model(string.format("models/tnb/halflife2/%s_torso_leatherjacket2.mdl", GAMEMODE:GetGenderString(ply:CharModel())))
			}
		}
	end
end

return ITEM
