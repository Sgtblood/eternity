ITEM = class.Create("base_clothing")

ITEM.Name 				= "UN Jacket"
ITEM.Description 		= "Blue and grey jacket. For a organization of false intentions."

ITEM.Model 				= Model("models/hls/alyxports/cardboard_box_3.mdl")
ITEM.Skin 				= 3

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {2, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			torso = {
                Model = Model(string.format("models/tnb/halflife/%s_torso_workjacket.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
                Skin = 0,
                Materials = {
                    ["models/tnb/citizens/cn_cln_rah_chest_cec"] = "models/tnb/citizens/cn_cln_rah_chest_un"
			}
			}
		}
	end
end

return ITEM
