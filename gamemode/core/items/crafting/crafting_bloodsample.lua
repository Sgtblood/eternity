ITEM = class.Create("base_item")

ITEM.Name           = "Blood Sample"
ITEM.Description    = "A unknown extracted blood sample, good for something?"
ITEM.OutlineColor   = Color(183, 163, 136)

ITEM.Model          = Model("models/illusion/eftcontainers/bloodsample.mdl")


ITEM.Width          = 1
ITEM.Height         = 2

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_IMPOSSIBLE }

ITEM.ItemGroup      = "Crafting"

return ITEM
