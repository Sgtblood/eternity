ITEM = class.Create("base_item")

ITEM.Name           = "Food Processor Meal"
ITEM.Description    = "An odorless can, with a strange yellow goo."
ITEM.OutlineColor   = Color(102, 98, 98)

ITEM.Model          = Model("models/willardnetworks/food/wn_food_can.mdl")

ITEM.Width          = 1
ITEM.Height         = 1 

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_IMPOSSIBLE }

ITEM.ItemGroup      = "Crafting"

return ITEM
