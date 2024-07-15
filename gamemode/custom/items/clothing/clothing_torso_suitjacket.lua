ITEM = class.Create("base_clothing")

ITEM.Name 				= "Suit Jacket"
ITEM.Description 		= "Glory to the Union!"

ITEM.Model 				= Model("models/tnb/halflife2/citizens/items/world_suitjacket.mdl")
ITEM.Skin 				= 0

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}


ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {1, 2}
}

function ITEM:GetContextOptions(ply)
	local tab = {}

	table.insert(tab, {
		Name = "Remove Pin",
		Callback = function()
			self.Pin = 0
				
			ply:HandlePlayerModel()
		end
	})
	
	table.insert(tab, {
		Name = "Wear Pin",
		Callback = function()
			self.Pin = 1
				
			ply:HandlePlayerModel()
		end
	})

	for _, v in pairs(self:ParentCall("GetContextOptions", ply)) do
		table.insert(tab, v)
	end

	return tab
end

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			torso = {
				Model = Model(string.format("models/tnb/halflife2/%s_torso_suitjacket.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
					Bodygroups = {
				pin = self.Pin or 0
				}
			}
		}
	end
end

return ITEM