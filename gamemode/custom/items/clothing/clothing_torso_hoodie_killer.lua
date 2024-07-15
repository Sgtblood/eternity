ITEM = class.Create("base_clothing")

ITEM.Name 				= "Bloody Sweatshirt"
ITEM.Description 		= "Used by psychos or someone in an unfortunate situation."

ITEM.Model 				= Model("models/Items/item_item_crate.mdl")
ITEM.Skin				= 1

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}



ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {2, 2}
}

function ITEM:GetContextOptions(ply)
	local tab = {}

	table.insert(tab, {
		Name = "Put Hood Down",
		Callback = function()
			self.Hood = 0
				
			ply:HandlePlayerModel()
		end
	})
	
	table.insert(tab, {
		Name = "Put Hood Up",
		Callback = function()
			self.Hood = 1
				
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
				Model = Model(string.format("models/tnb/halflife2/%s_torso_sweater.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
				Skin = 3,
				Bodygroups = {
				hood = self.Hood or 0
				}
			}
		}
	end
end

return ITEM