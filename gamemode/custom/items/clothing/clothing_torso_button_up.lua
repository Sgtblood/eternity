ITEM = class.Create("base_clothing")

ITEM.Name 				= "Button-Up"
ITEM.Description 		= "A thick coat worn by the weathlier few of society."

ITEM.Model 				= Model("models/props_junk/cardboard_box003a.mdl")
ITEM.Skin 				= 0

ITEM.Width 				= 3
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 700
ITEM.SellPrice 			= 300

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {2, 2}
}

function ITEM:GetContextOptions(ply)
	local tab = {}

	table.insert(tab, {
		Name = "Wear Black Variant",
		Callback = function()
			self.Skin = 0
			
			ply:HandlePlayerModel()
		end
	})

	table.insert(tab, {
		Name = "Wear Grey Variant",
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
		local model = "models/tnb/halflife/male_torso_overcoat.mdl"

		if GAMEMODE:GetModelGender(ply:CharModel()) == GENDER_FEMALE then
			model = "models/tnb/zrp/female_torso_overcoat.mdl"
		end

		return {
			torso = {
                Model = Model(model),
                Skin = self.Skin
			}
		}
	end
end

return ITEM
