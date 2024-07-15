ITEM = class.Create("base_item")

ITEM.Name           = "Gas Filter"
ITEM.Description    = "A vital resource to both sides of the conflict. Heavy soviet filters."
ITEM.OutlineColor   = Color(183, 163, 136)

ITEM.Model          = Model("models/willardnetworks/props/sovietfilter.mdl")

ITEM.License        = LICENSE_GREYMARKET
ITEM.UnitPrice      = 600
ITEM.SellPrice      = 15

ITEM.Width          = 2
ITEM.Height         = 2

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_VERYRARE }

ITEM.ItemGroup      = "Crafting"

return ITEM
