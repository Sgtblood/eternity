ITEM = class.Create("base_clothing")

ITEM.Name 				= "Infestation Control Team Leader Helmet"
ITEM.Description 		= "Used for all the infestation needs."

ITEM.Model 				= Model("models/tnb/halflife2/citizens/items/item_hazmat_mask.mdl")
ITEM.Skin 				= 0

ITEM.EquipmentSlots 	= {EQUIPMENT_HEAD}

ITEM.ItemGroup 			= "Clothing"

ITEM.Filtered 			= true

if SERVER then
    function ITEM:GetModelData(ply)
        local model = string.format("models/tnb/halflife2/%s_suit_hazmat_mask_orange.mdl", GAMEMODE:GetGenderString(ply:CharModel()))

        if self.ShowFace then
            model = string.format("models/tnb/halflife2/%s_suit_hazmat_mask_orange.mdl", GAMEMODE:GetGenderString(ply:CharModel())) -- Have to use this to make the head model invisible
        end

		return {
			_base = {
				HideHead = not self.ShowFace
			},
			head = {
                Model = Model(model),
                Skin = 0
			}
		}
	end
end

return ITEM