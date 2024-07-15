ITEM = class.Create("base_clothing")

ITEM.Name 				= "Workers Uniform"
ITEM.Description 		= "For the backbone of the Union workforce."

ITEM.Model 				= Model("models/tnb/halflife2/citizens/items/world_grimyuniform.mdl")
ITEM.Skin 				= 0

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 50
ITEM.SellPrice 			= 20

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {1, 2}
}

function ITEM:GetContextOptions(ply)
	local tab = {}

	table.insert(tab, {
		Name = "Wear Blue Variant",
		Callback = function()
			self.Skin = 0
				
			ply:HandlePlayerModel()
		end
	})
	
	table.insert(tab, {
		Name = "Wear Tan Variant",
		Callback = function()
			self.Skin = 1
				
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
				Model = Model(string.format("models/tnb/halflife2/%s_torso_worker.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
				Skin = self.Skin,
			}
		}
	end
end

return ITEM
