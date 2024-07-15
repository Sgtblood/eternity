ITEM = class.Create("base_item")

ITEM.Name           = "Bottle of Oil"
ITEM.Description    = "A bottle of useful Oil. But for what?"
ITEM.OutlineColor   = Color(183, 163, 136)

ITEM.Model          = Model("models/mosi/fallout4/props/junk/components/oil.mdl")



ITEM.Width          = 1
ITEM.Height         = 1

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_VERYRARE }

ITEM.ItemGroup      = "Crafting"

return ITEM
