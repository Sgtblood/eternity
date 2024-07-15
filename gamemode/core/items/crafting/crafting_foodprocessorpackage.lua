ITEM = class.Create("base_item")

ITEM.Name           = "Food Processor Package"
ITEM.Description    = "A colorless package, with a large amount of space."
ITEM.OutlineColor   = Color(102, 98, 98)

ITEM.Model          = Model("models/uu_branded/foodnhouseholdaaaaa/combirationa.mdl")

ITEM.Width          = 2
ITEM.Height         = 2

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_IMPOSSIBLE }

ITEM.ItemGroup      = "Crafting"

return ITEM
