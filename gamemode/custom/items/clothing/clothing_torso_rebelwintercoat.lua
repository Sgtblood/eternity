ITEM = class.Create("base_clothing")

ITEM.Name 				= "Armored Wintercoat"
ITEM.Description 		= "Prestigious and illusive, the wintercoat protects against all forms of the Combine."

ITEM.Model 				= Model("models/tnb/items/wintercoat.mdl")
ITEM.Skin 				= 0

ITEM.Width 				= 3
ITEM.Height 			= 2

ITEM.ArmorLevel 		= ARMOR_LIGHT

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

-- ITEM.License 			= LICENSE_BLACKMARKET
-- ITEM.UnitPrice 			= 9000
-- ITEM.SellPrice 			= 4000

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {2, 2}
}

function ITEM:GetContextOptions(ply)
	local tab = {}

	table.insert(tab, {
		Name = "Wear Green Variant",
		Callback = function()
			self.Skin = 0
			
			ply:HandlePlayerModel()
		end
	})

	table.insert(tab, {
		Name = "Wear Brown Variant",
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
				Model = Model(string.format("models/tnb/halflife/%s_torso_wintercoat.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
				Skin = self.Skin
			}
		}
	end
end

return ITEM
