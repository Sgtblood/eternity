ITEM = class.Create("base_clothing")

ITEM.Name 				= "Engineer Core Helmet"
ITEM.Description 		= "Used for all the engineering needs."

ITEM.Model 				= Model("models/props_junk/cardboard_box003a.mdl")
ITEM.Skin 				= 0

ITEM.EquipmentSlots 	= {EQUIPMENT_HEAD}

ITEM.ItemGroup 			= "Clothing"

ITEM.Filtered 			= true

if SERVER then
    function ITEM:GetModelData(ply)
        local model = string.format("models/tnb/halflife2/%s_head_cecsuit.mdl", GAMEMODE:GetGenderString(ply:CharModel()))

        if self.ShowFace then
            model = string.format("models/tnb/halflife2/%s_head_cecsuit.mdl", GAMEMODE:GetGenderString(ply:CharModel()))
        end

		return {
			_base = {
				HideHead = not self.ShowFace
			},
			head = {
				Material = "models/tnb/combine/worker/worker_mask",
                Model = Model(model),
                Skin = 0 
			}
		}
	end
end

return ITEM