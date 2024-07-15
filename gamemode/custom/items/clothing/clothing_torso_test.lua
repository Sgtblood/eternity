ITEM = class.Create("base_clothing")

ITEM.Name 				= "Test"
ITEM.Description 		= "WIP."

ITEM.Model 				= Model("models/tnb/items/shirt_citizen2.mdl")
ITEM.Skin 				= 3

ITEM.Width 				= 3
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {2, 2}
}

if SERVER then
    function ITEM:GetModelData(ply)
        local model = "models/gs3/clothing/b_torso.mdl"

        if GAMEMODE:GetModelSkinTone(ply:CharModel()) == SKINTONE_BLACK then
            model = "models/gs3/clothing/b_torso_afr.mdl"
        end

        if GAMEMODE:GetModelGender(ply:CharModel()) == GENDER_FEMALE then
            model = "models/gs3/clothing/b_femtorso.mdl"
        end

        return { 
            torso = {
                Model = Model(model)
            },
        }
    end
end


return ITEM