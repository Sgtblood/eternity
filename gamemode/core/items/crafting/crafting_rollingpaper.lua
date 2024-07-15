ITEM = class.Create("base_item")

ITEM.Name           = "Rolling Paper"
ITEM.Description    = "Rolling Paper for various smoking objects."
ITEM.OutlineColor   = Color(183, 163, 136)

ITEM.Model          = Model("models/wick/wrbstalker/anomaly/items/wick_dev_hand_rolling_tobacco.mdl")

ITEM.License        = LICENSE_GREYMARKET
ITEM.UnitPrice      = 30
ITEM.SellPrice      = 10

ITEM.Width          = 1
ITEM.Height         = 1 

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_UNCOMMON }

ITEM.ItemGroup      = "Crafting"

return ITEM
