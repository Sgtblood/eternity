ITEM = class.Create("base_item")

ITEM.Name           = "Adhesive Glue"
ITEM.Description    = "Combine grade Super-Glue."
ITEM.OutlineColor   = Color(183, 163, 136)

ITEM.Model          = Model("models/willardnetworks/props/spicyglue.mdl")

ITEM.Width          = 1
ITEM.Height         = 1 

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_LEGENDARY }

ITEM.ItemGroup      = "Crafting"

return ITEM
