ITEM = class.Create("base_clothing")

ITEM.Name 				= "Armored Pants"
ITEM.Description 		= "A set of trousers, boots, and a bit of padding for resistance fighters."

ITEM.Model 				= Model("models/Items/item_item_crate.mdl")
ITEM.Skin 				= 0

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_LEGS}

-- ITEM.License 			= LICENSE_BLACKMARKET
-- ITEM.UnitPrice 			= 3000
-- ITEM.SellPrice 			= 2000

ITEM.ItemGroup 			= "Clothing"

ITEM.ArmorLevel			= ARMOR_HEAVY

ITEM.Inventories        = {
    ["Left Pocket"] = {1, 2},
    ["Right Pocket"] = {1, 2}
}

function ITEM:GetContextOptions(ply)
	local tab = {}

	table.insert(tab, {
		Name = "Wear Black Variant",
		Callback = function()
			self.Skin = 0
			self.Variant = 0
			
			ply:HandlePlayerModel()
		end
	})

	table.insert(tab, {
		Name = "Wear Black Camo Variant",
		Callback = function()
			self.Skin = 0
			self.Variant = 1
			
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
		local skin = self.Variant or 0
		local model = "models/tnb/halflife2/rebels/%s_legs_resistance1.mdl"

		

		return {
			legs = {
				Model = Model(string.format(model, GAMEMODE:GetGenderString(ply:CharModel()))),
                Skin = skin
            }
		}
	end
end

return ITEM
