ITEM = class.Create("base_clothing")

ITEM.Name 				= "Night Vision Goggles"
ITEM.Description 		= "Helps you see in the dark!"

ITEM.Model 				= Model("models/tnb/items/trp/headgear/nvg1.mdl")

ITEM.EquipmentSlots 	= {EQUIPMENT_HEAD}

-- ITEM.License 			= LICENSE_CLOTHING
-- ITEM.UnitPrice 			= 75
-- ITEM.SellPrice 			= 30

ITEM.ItemGroup 			= "Clothing"

function ITEM:OnUnequip(ply, slot, unloading)
    ply:SetVISR(false)

    self:ParentCall("OnUnequip", ply, slot, unloading)
end

function ITEM:GetContextOptions(ply)
	local tab = {}

	table.insert(tab, {
		Name = "Toggle NVG Mode",
		Callback = function()
			ply:SetVISR(not ply:VISR())
		end
	})

	table.insert(tab, {
		Name = "Pull Down",
		Callback = function()
			self.Down = not self.Down

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
					nvg = self.Down and 1 or 2
				}
			}
		}
	end
end

return ITEM


