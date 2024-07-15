ITEM = class.Create("base_item")

ITEM.Name           = "Fabric Roll"
ITEM.Description    = "A Cloth Roll."
ITEM.OutlineColor   = Color(183, 163, 136)

ITEM.Model          = Model("models/mosi/fallout4/props/junk/components/cloth.mdl")

ITEM.License        = LICENSE_MISC
ITEM.UnitPrice      = 75
ITEM.SellPrice      = 20

ITEM.Width          = 1
ITEM.Height         = 1 

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_COMMON }

ITEM.ItemGroup      = "Crafting"

return ITEM
