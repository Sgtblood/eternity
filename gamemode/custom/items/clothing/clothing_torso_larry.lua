ITEM = class.Create("base_clothing")

ITEM.Name 				= "Electrical Worker's Suit"
ITEM.Description 		= "A Mad man who waddles water is but a mad man."

ITEM.Model 				= Model("models/tnb/halflife/world_torso_larry.mdl")
ITEM.Skin 				= 0

ITEM.Width 				= 3
ITEM.Height 			= 3

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.License 			= LICENSE_GREYMARKET
ITEM.UnitPrice 			= 200
ITEM.SellPrice 			= 75

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {2, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			torso = {
				Model = Model(string.format("models/tnb/halflife/%s_torso_larry.mdl", GAMEMODE:GetGenderString(ply:CharModel())))
			}
		}
	end
end

return ITEM
