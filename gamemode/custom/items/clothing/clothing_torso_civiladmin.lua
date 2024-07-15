ITEM = class.Create("base_clothing")

ITEM.Name 				= "Combine Administrative Top"
ITEM.Description 		= "A Top commonly worn by Eastern City Administrative Staff. Comes with a pair of Epaulettes."

ITEM.Model 				= Model("models/tnb/halflife2/citizens/items/world_catop.mdl")
ITEM.Skin 				= 0

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

--ITEM.License 			= LICENSE_CLOTHING
--ITEM.UnitPrice 			= 80
--ITEM.SellPrice 			= 35

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {1, 2}
}

function ITEM:GetContextOptions(ply)
	local tab = {}

	table.insert(tab, {
		Name = "Remove Epaulettes",
		Callback = function()
			self.Epaulette = 0
				
			ply:HandlePlayerModel()
		end
	})
	
	table.insert(tab, {
		Name = "Wear Epaulettes",
		Callback = function()
			self.Epaulette = 1
				
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
				Model = Model(string.format("models/tnb/halflife2/ca/%s_torso_ca.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
				Bodygroups = {
				epaulette = self.Epaulette or 0
				}
			}
		}
	end
end

return ITEM