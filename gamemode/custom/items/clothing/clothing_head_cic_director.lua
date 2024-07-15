ITEM = class.Create("base_clothing")

ITEM.Name 				= "Infestation Control Hazmat Helmet"
ITEM.Description 		= "Used for all the infestation needs."

ITEM.Model 				= Model("models/props_junk/cardboard_box003a.mdl")
ITEM.Skin 				= 0

ITEM.EquipmentSlots 	= {EQUIPMENT_HEAD}

ITEM.ItemGroup 			= "Clothing"

ITEM.Filtered 			= true

if SERVER then
    function ITEM:GetModelData(ply)
        local model = string.format("models/tnb/halflife2/%s_suit_hazmat_mask.mdl", GAMEMODE:GetGenderString(ply:CharModel()))

        if self.ShowFace then
            model = string.format("models/tnb/halflife2/%s_suit_hazmat_mask.mdl", GAMEMODE:GetGenderString(ply:CharModel()))
        end

		return {
			_base = {
				HideHead = not self.ShowFace
			},
			head = {
                Model = Model(model),
                Materials = {
                    ["models/hlvr/characters/hazmat_worker/hazmat_worker"] = "models/hlvr/characters/hazmat_worker/hazmat_worker_black"
            }
			}
		}
	end
end

return ITEM