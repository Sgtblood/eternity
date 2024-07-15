ITEM = class.Create("base_clothing")

ITEM.Name 				= "Work Uniform"
ITEM.Description 		= "Standard uniform for the factory workers of City 34."

ITEM.Model 				= Model("models/tnb/halflife2/citizens/items/world_metalworker.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}


ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {1, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			torso = {
				Model = Model(string.format("models/tnb/halflife2/%s_torso_metalworker.mdl", GAMEMODE:GetGenderString(ply:CharModel())))
			}
		}
	end
        function ITEM:PostModelData(ply, data)
        data.hands = nil

        return data
    end
end

return ITEM
