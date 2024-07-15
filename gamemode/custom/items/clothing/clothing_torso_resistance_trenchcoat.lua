ITEM = class.Create("base_clothing")

ITEM.Name 				= "Standard Resistance Gear Variant Trenchcoat"
ITEM.Description 		= "Retooled gear for the resistance freedom fighter."

ITEM.Model 				= Model("models/Items/item_item_crate.mdl")
ITEM.Skin 				= 0

ITEM.Width 				= 3
ITEM.Height 			= 2

ITEM.ArmorLevel 		= ARMOR_HEAVY

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

-- ITEM.License 			= LICENSE_BLACKMARKET
-- ITEM.UnitPrice 			= 5000
-- ITEM.SellPrice 			= 2000

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {2, 2}
}

function ITEM:GetContextOptions(ply)
	local tab = {}

	
	
	
	
	
	
	table.insert(tab, {
		Name = "Toggle Theta",
		Callback = function()
			self.Shoulder = not self.Shoulder

			ply:HandlePlayerModel()
		end
	})
	
	
	table.insert(tab, {
		Name = "Wear No Hood or Mask",
		Callback = function()
			self.Hood = 0
			
			ply:HandlePlayerModel()
		end
	})

	
	table.insert(tab, {
		Name = "Wear Hood",
		Callback = function()
			self.Hood = 1
			
			ply:HandlePlayerModel()
		end
	})
	
	table.insert(tab, {
		Name = "Wear Hood w/ Mask",
		Callback = function()
			self.Hood = 2
			
			ply:HandlePlayerModel()
		end
	})
	
	table.insert(tab, {
		Name = "Toggle Scarf",
		Callback = function()
			self.Scarf = not self.Scarf

			ply:HandlePlayerModel()
		end
	})
	

	return table.Add(tab, self:ParentCall("GetContextOptions", ply))
end

if SERVER then
	function ITEM:GetModelData(ply)
		local variant = self.Variant or 0

		local model = "models/tnb/halflife2/rebels/%s_torso_resistance8.mdl"

			

		return {
			torso = {
				Model = Model(string.format(model, GAMEMODE:GetGenderString(ply:CharModel()))),
				Skin = variant,
				
				Bodygroups = {
					shoulder = self.Shoulder and 1 or 0,
					hood = self.Hood,
					scarf = self.Scarf and 1 or 0,
				}
				
			}
		}
	end
end

return ITEM
