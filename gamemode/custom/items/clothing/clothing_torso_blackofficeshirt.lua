ITEM = class.Create("base_clothing")

ITEM.Name 				= "Black office Shirt"
ITEM.Description 		= "Even comes with a tie!"

ITEM.Model 				= Model("models/props_junk/cardboard_box003b.mdl")
ITEM.Skin 				= 0

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 125
ITEM.SellPrice 			= 35

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {1, 2}
}

function ITEM:GetContextOptions(ply)
	local tab = {}

	table.insert(tab, {
		Name = "Remove Tie",
		Callback = function()
			self.Tie = 0
				
			ply:HandlePlayerModel()
		end
	})
	
	table.insert(tab, {
		Name = "Wear Tie",
		Callback = function()
			self.Tie = 1
				
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
				Model = Model(string.format("models/tnb/halflife2/ca/%s_torso_bra.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
				Bodygroups = {
				tie = self.Tie or 0
				}
			}
		}
	end
end

return ITEM