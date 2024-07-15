ITEM = class.Create("base_item")

ITEM.Name           = "Food Processor Liquid Injector"
ITEM.Description    = "An Injector with a strange mix in it. It makes you sick to the core to look at."
ITEM.OutlineColor   = Color(23, 163, 112)

ITEM.Model          = Model("models/willardnetworks/syringefull.mdl")


ITEM.Width          = 1
ITEM.Height         = 3 

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_IMPOSSIBLE }

ITEM.ItemGroup      = "Crafting"

return ITEM
