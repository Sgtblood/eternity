ITEM = class.Create("base_item")

ITEM.Name           = "9v Battery"
ITEM.Description    = "To power your handheld flashlight and electronics."
ITEM.OutlineColor   = Color(183, 163, 136)

ITEM.Model          = Model("models/hls/alyxports/battery.mdl")

ITEM.Width          = 1
ITEM.Height         = 1 

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_UNCOMMON }

ITEM.ItemGroup      = "Crafting"

return ITEM
