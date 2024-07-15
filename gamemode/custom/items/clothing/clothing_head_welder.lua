ITEM = class.Create("base_clothing")

ITEM.Name 				= "Welders Mask"
ITEM.Description 		= "Created by the Union specifically for welding. Nearly impossible to see out of normally."

ITEM.Model 				= Model("models/tnb/halflife2/citizens/items/item_suit_worker_gasmask.mdl")
ITEM.Skin 				= 0

ITEM.EquipmentSlots 	= {EQUIPMENT_HEAD}

ITEM.ItemGroup 			= "Clothing"

ITEM.License 			= LICENSE_GREYMARKET
ITEM.UnitPrice 			= 500
ITEM.SellPrice 			= 60

ITEM.Filtered 			= true

if SERVER then
    function ITEM:GetModelData(ply)
        local model = string.format("models/tnb/halflife2/%s_suit_worker_gasmask.mdl", GAMEMODE:GetGenderString(ply:CharModel()))

        if self.ShowFace then
            model = string.format("models/tnb/halflife2/%s_suit_worker_gasmask.mdl", GAMEMODE:GetGenderString(ply:CharModel())) -- Have to use this to make the head model invisible
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