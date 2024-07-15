ITEM = class.Create("base_clothing")

ITEM.Name 				= "Civil Protection Faceplate"
ITEM.Description 		= "A hard-plastic facemask, vocoder included, issued Civil Protection Ground Units."

ITEM.Model 				= Model("models/tnb/halflife2/world_head_metropolice.mdl")
ITEM.Material			= "models/tnb/cca/c13/metrocop_gasmask"
ITEM.Skin 				= 0

ITEM.EquipmentSlots 	= {EQUIPMENT_HEAD}

ITEM.ItemGroup 			= "Clothing"

ITEM.Filtered 			= true


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
		Name = "Toggle Faceplate",
        Callback = function()
            self.ShowFace = not self.ShowFace
            
            ply:HandlePlayerModel()
		end
	})

	return tab
end

if SERVER then
    function ITEM:GetModelData(ply)
        local model = string.format("models/tnb/halflife2/cca/%s_head_metropolice.mdl", GAMEMODE:GetGenderString(ply:CharModel()))

        if self.ShowFace then
            model = string.format("models/tnb/halflife2/cca/%s_head_metropolice_open.mdl", GAMEMODE:GetGenderString(ply:CharModel()))
        end

		return {
			_base = {
				HideHead = not self.ShowFace
			},

			head = {
				--Material = "models/tnb/cca/c13/metrocop_gasmask",
                Model = Model(model),
                Skin = 1
			}
		}
	end
end

return ITEM
