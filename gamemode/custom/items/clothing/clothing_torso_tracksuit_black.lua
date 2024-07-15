ITEM = class.Create("base_clothing")

ITEM.Name 				= "Black Tracksuit"
ITEM.Description 		= "Loose fitting. The ideal choice for movement without sacrificing any insolation."

ITEM.Model 				= Model("models/tnb/halflife2/citizens/items/item_torso_track1.mdl")
ITEM.Material			= "models/tnb/zrp/torso_tracktop_black_flattened"

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 110
ITEM.SellPrice 			= 45

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {2, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			torso = {
				Model = Model(string.format("models/tnb/halflife2/%s_torso_track1.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
				Skin = 0,
				Materials = {
					["models/tnb/zrp/torso_tracktop1"] = "models/tnb/zrp/torso_tracktop_black_flattened",
			}
			}

		}
	end
end

return ITEM
