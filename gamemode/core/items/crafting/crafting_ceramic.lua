ITEM = class.Create("base_item")

ITEM.Name           = "Ceramics"
ITEM.Description    = "Heavy ceramic, that is commonly used in military grade equipment and repairs."
ITEM.OutlineColor   = Color(183, 163, 136)

ITEM.Model          = Model("models/mosi/fallout4/props/junk/components/ceramic.mdl")

ITEM.Width          = 2
ITEM.Height         = 2 

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_LEGENDARY }

ITEM.ItemGroup      = "Crafting"

return ITEM
