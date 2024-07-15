ITEM = class.Create("base_item")

ITEM.Name           = "Box of Herbs"
ITEM.Description    = "A box containing crucial cooking herbs."
ITEM.OutlineColor   = Color(183, 163, 136)

ITEM.Model          = Model("models/willardnetworks/food/cmb_food7.mdl")

ITEM.License        = LICENSE_FOOD
ITEM.UnitPrice      = 30
ITEM.SellPrice      = 15

ITEM.Width          = 1
ITEM.Height         = 1 

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_COMMON }

ITEM.ItemGroup      = "Crafting"

return ITEM