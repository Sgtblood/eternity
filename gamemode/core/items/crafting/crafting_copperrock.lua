ITEM = class.Create("base_item")

ITEM.Name           = "Copper Ore"
ITEM.Description    = "Copper Wires anyone?"
ITEM.OutlineColor   = Color(183, 163, 136)

ITEM.Model          = Model("models/props_junk/rock003a.mdl")


ITEM.Width          = 2
ITEM.Height         = 2 

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_IMPOSSIBLE }

ITEM.ItemGroup      = "Crafting"

return ITEM