ITEM = class.Create("base_clothing")

ITEM.Name 				= "Blue Overalls"
ITEM.Description 		= "Perfect for work that requires you to have loose clothing."

ITEM.Model 				= Model("models/tnb/halflife2/citizens/items/world_overall.mdl")
ITEM.Skin 				= 0

ITEM.Width 				= 3
ITEM.Height 			= 3

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories        = {
    ["Left Pocket"] = {1, 3},
    ["Right Pocket"] = {1, 3}
}

function ITEM:GetContextOptions(ply)
    local tab = {}

    table.insert(tab, {
        Name = "Remove Toolbelt",
        Callback = function()
            self.Toolbelt = 0

            ply:HandlePlayerModel()
        end
    })

    table.insert(tab, {
        Name = "Wear Toolbelt",
        Callback = function()
            self.Toolbelt = 1

            ply:HandlePlayerModel()
        end
    })

    table.insert(tab, {
        Name = "Remove Logo",
        Callback = function()
            self.Logo = 0

            ply:HandlePlayerModel()
        end
    })

    table.insert(tab, {
        Name = "Wear Logo",
        Callback = function()
            self.Logo = 1

            ply:HandlePlayerModel()
        end
    })

    table.insert(tab, {
        Name = "Wear Clean",
        Callback = function()
            self.Skin = 0

            ply:HandlePlayerModel()
        end
    })

    table.insert(tab, {
        Name = "Wear Dirty",
        Callback = function()
            self.Skin = 2

            ply:HandlePlayerModel()
        end
    })

        return table.Add(tab, self:ParentCall("GetContextOptions", ply))

end


if SERVER then
    function ITEM:GetModelData(ply)
        local gender = GAMEMODE:GetGenderString(ply:CharModel())

		return {
            torso = {
                Model = Model(string.format("models/tnb/halflife2/%s_overalls.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
                Skin = self.Skin or 0,
                Bodygroups = {
                    logo = self.Logo or 0,
                    toolbelt = self.Toolbelt or 0
                }
        }
    }
end


     function ITEM:PostModelData(ply, data)
        data.legs = nil

        return data
    end

end

return ITEM
