ITEM = class.Create("base_item")

ITEM.Name           = "Gold Bar"
ITEM.Description    = "It's Heavy but it's useful."
ITEM.OutlineColor   = Color(183, 163, 136)

ITEM.Model          = Model("models/willard/work/goldingot.mdl")

ITEM.Width          = 3
ITEM.Height         = 1 

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_LEGENDARY }

ITEM.ItemGroup      = "Crafting"

return ITEM
