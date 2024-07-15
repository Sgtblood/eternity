ITEM = class.Create("base_item")

ITEM.Name           = "Box of Dried Veggies."
ITEM.Description    = "Yum yum."
ITEM.OutlineColor   = Color(183, 163, 136)

ITEM.Model          = Model("models/willardnetworks/foods/vege.mdl")

ITEM.License        = LICENSE_FOOD
ITEM.UnitPrice      = 100
ITEM.SellPrice      = 15

ITEM.Width          = 1
ITEM.Height         = 1 

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_COMMON }

ITEM.ItemGroup      = "Crafting"

return ITEM
