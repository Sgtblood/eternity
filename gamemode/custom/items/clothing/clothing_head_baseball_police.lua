ITEM = class.Create("base_clothing")

ITEM.Name 				= "Black Police Hat"
ITEM.Description 		= "used by the upholders of the law."

ITEM.Model 				= Model("models/tnb/items/trp/headgear/hat3.mdl")
ITEM.Material			= "models/tnb/techcom/addons1_hat_black_claw"

ITEM.EquipmentSlots 	= {EQUIPMENT_HEAD}

-- ITEM.License 			= LICENSE_CLOTHING
-- ITEM.UnitPrice 			= 75
-- ITEM.SellPrice 			= 35

ITEM.ItemGroup 			= "Clothing"

function ITEM:GetContextOptions(ply)
	local tab = {}

	table.insert(tab, {
		Name = "Flip",
		Callback = function()
			self.Flipped = not self.Flipped
			ply:HandlePlayerModel()
		end
	})

	for _, v in pairs(self:ParentCall("GetContextOptions",ply)) do
		table.insert(tab, v)
	end

	return tab
end

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			_base = {
				Bodygroups = {
					hat = self.Flipped and 1 or 3
				},
				Materials = {
					["models/tnb/techcom/body_a1"] = "models/tnb/techcom/body_a_nypd",
                    ["models/tnb/techcom/addons1"] = "models/tnb/techcom/addons_nypd",
			}
			}
		}
	end
end

return ITEM
