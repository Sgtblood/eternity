ITEM = class.Create("base_item")

ITEM.Name           = "Combine Supply Crate"
ITEM.Description    = "A Empty Combine Crate, to be sent for their galactic use."
ITEM.OutlineColor   = Color(183, 163, 136)

ITEM.Model          = Model("models/wn7new/advcrates/n7_crate.mdl")


ITEM.Width          = 3
ITEM.Height         = 3

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_IMPOSSIBLE }

ITEM.ItemGroup      = "Crafting"

return ITEM
