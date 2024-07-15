ITEM = class.Create("base_item")

ITEM.Name           = "Bottle of Nails"
ITEM.Description    = "A bottle of nails, great for any project."
ITEM.OutlineColor   = Color(183, 163, 136)

ITEM.Model          = Model("models/illusion/eftcontainers/nailpack.mdl")



ITEM.Width          = 1
ITEM.Height         = 1

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_UNCOMMON }

ITEM.ItemGroup      = "Crafting"

return ITEM
