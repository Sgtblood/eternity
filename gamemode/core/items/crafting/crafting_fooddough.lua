ITEM = class.Create("base_item")

ITEM.Name           = "Dough"
ITEM.Description    = "Cooking dough created from flour."
ITEM.OutlineColor   = Color(171, 180, 121)

ITEM.Model          = Model("models/willardnetworks/props/dough.mdl")


ITEM.Width          = 1
ITEM.Height         = 1 

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_IMPOSSIBLE }

ITEM.ItemGroup      = "Crafting"

return ITEM
