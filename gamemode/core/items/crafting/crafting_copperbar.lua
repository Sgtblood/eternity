ITEM = class.Create("base_item")

ITEM.Name           = "Copper Bar"
ITEM.Description    = "It's Heavy but it's useful."
ITEM.OutlineColor   = Color(183, 163, 136)

ITEM.Model          = Model("models/willard/work/copperingot.mdl")

ITEM.Width          = 3
ITEM.Height         = 1 

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_VERYRARE }

ITEM.ItemGroup      = "Crafting"

return ITEM
