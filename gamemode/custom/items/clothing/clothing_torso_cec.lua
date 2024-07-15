ITEM = class.Create("base_clothing")

ITEM.Name 				= "CEC Jacket"
ITEM.Description 		= "A high-visibility jacket worn by Combine employees. Waterproof."

ITEM.Model 				= Model("models/tnb/items/shirt_citizen2.mdl")
ITEM.Skin 				= 3

ITEM.Width 				= 3
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {3, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			torso = {
                Model = Model(string.format("models/tnb/halflife/%s_torso_workjacket.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
                Skin = 1,
                 Materials = {
                    ["models/tnb/citizens/cn_cln_rah_chest_cic"] = "models/tnb/citizens/cn_cln_rah_chest_cmc13"
			}
			}
		}
	end
end

return ITEM
