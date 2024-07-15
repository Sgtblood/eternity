ITEM = class.Create("base_item")

ITEM.Name           = "Refined Metal"
ITEM.Description    = "Metal ready to be shaped."
ITEM.OutlineColor   = Color(183, 163, 136)

ITEM.Model          = Model("models/willardnetworks/props/reshaped_metal.mdl")

ITEM.Width          = 2
ITEM.Height         = 1

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_VERYRARE }

ITEM.ItemGroup      = "Crafting"

return ITEM
