ITEM = class.Create("base_item")

ITEM.Name           = "Lump of Coal"
ITEM.Description    = "Coal used by the Combine within Factories."
ITEM.OutlineColor   = Color(183, 163, 136)

ITEM.Model          = Model("models/willardnetworks/props/charcoal.mdl")


ITEM.Width          = 2
ITEM.Height         = 1 

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_UNCOMMON }

ITEM.ItemGroup      = "Crafting"

return ITEM
