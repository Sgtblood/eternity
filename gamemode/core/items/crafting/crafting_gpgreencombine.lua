ITEM = class.Create("base_item")

ITEM.Name           = "Gunpowder GRE Mix"
ITEM.Description    = "Green Gunpowder, used in the crafting of Combine munitions."
ITEM.OutlineColor   = Color(183, 163, 136)

ITEM.Model          = Model("models/illusion/eftcontainers/gpgreen.mdl")



ITEM.Width          = 1
ITEM.Height         = 1 

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_IMPOSSIBLE }

ITEM.ItemGroup      = "Crafting"

return ITEM
