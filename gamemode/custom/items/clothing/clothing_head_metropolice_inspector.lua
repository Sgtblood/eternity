ITEM = class.Create("base_clothing")

ITEM.Name 				= "OIC Faceplate"
ITEM.Description 		= "A guarded facemask, vocoder included, issued to OIC Members to protect their identification."

ITEM.Model 				= Model("models/tnb/halflife2/world_head_metropolice_asi.mdl")
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
        local model = string.format("models/tnb/halflife2/cca/%s_head_metropolice_asi.mdl", GAMEMODE:GetGenderString(ply:CharModel()))

        if self.ShowFace then
            model = string.format("models/tnb/halflife2/cca/%s_head_metropolice_open.mdl", GAMEMODE:GetGenderString(ply:CharModel()))
        end

		return {
			_base = {
				HideHead = not self.ShowFace
			},
			head = {
                Model = Model(model),
                Skin = 0
			}
		}
	end
end

return ITEM
