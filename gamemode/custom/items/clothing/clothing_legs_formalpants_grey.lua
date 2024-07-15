ITEM = class.Create("base_clothing")

ITEM.Name 				= "Grey Suit Pants"
ITEM.Description 		= "A formal set of pants for high-ranking officials."

ITEM.Model 				= Model("models/hls/alyxports/cardboard_box_3.mdl")
ITEM.SKin = 0

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_LEGS}

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories        = {
    ["Left Pocket"] = {1, 2},
    ["Right Pocket"] = {1, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			legs = {
				Model = Model(string.format("models/tnb/halflife/%s_legs_suit_white.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
				Materials = {
					["models/tnb/citizens/suit_white"] = "models/tnb/citizens/suit_grey",
					["models/tnb/citizens/femsuit_white"] = "models/tnb/citizens/femsuit_grey",
			}

			}
		}
	end
end

return ITEM