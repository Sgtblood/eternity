ITEM = class.Create("base_item")

ITEM.Name           = "Wrench"
ITEM.Description    = "Sturdy wrench for tightening and loosening bolts with dependable mechanical leverage."
ITEM.OutlineColor   = Color(80, 80, 80)

ITEM.Model          = Model("models/props_se/workshop/wrenchcrescent01.mdl")


ITEM.Width          = 1
ITEM.Height         = 2

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_RARE }

ITEM.ItemGroup      = "Crafting"
ITEM.ItemTags       = { "Tool" }

return ITEM