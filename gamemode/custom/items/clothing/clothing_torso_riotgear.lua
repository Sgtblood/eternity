ITEM = class.Create("base_clothing")

ITEM.Name 				= "Refurbished Riot Gear"
ITEM.Description 		= "Cleaned and ready for use, thick armor and surprisingly high quality."

ITEM.Model 				= Model("models/freeman/guncase.mdl")
ITEM.Skin 				= 0

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.ItemGroup 			= "Clothing"

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice 			= 8000
ITEM.SellPrice 			= 6000

ITEM.ArmorLevel			= ARMOR_HEAVY

ITEM.Inventories 		= {
	["Main"] = {1, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			torso = {
				Model = Model(string.format("models/tnb/halflife/male_torso_riot.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
				Skin = 0,
				Materials = {
					["models/tnb/citizens/riotcop1"] = "models/tnb/citizens/riotcop_mopp",
			}
			}

		}
	end
end


return ITEM
