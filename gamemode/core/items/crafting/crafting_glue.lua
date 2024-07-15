ITEM = class.Create("base_item")

ITEM.Name           = "Glue"
ITEM.Description    = "Combine grade Glue."
ITEM.OutlineColor   = Color(183, 163, 136)

ITEM.Model          = Model("models/willardnetworks/props/glue.mdl")

ITEM.Width          = 1
ITEM.Height         = 1 

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_UNCOMMON }

ITEM.ItemGroup      = "Crafting"

return ITEM
