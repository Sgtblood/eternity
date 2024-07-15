ITEM = class.Create("base_clothing")

ITEM.Name 				= "Baseball Cap"
ITEM.Description 		= "A generic hat, nothing to it really. Has goggles"

ITEM.Model 				= Model("models/tnb/items/trp/headgear/hat2.mdl")

ITEM.EquipmentSlots 	= {EQUIPMENT_HEAD}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 75
ITEM.SellPrice 			= 30

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
					hat = self.Flipped and 1 or 2
				}
			}
		}
	end
end

return ITEM


