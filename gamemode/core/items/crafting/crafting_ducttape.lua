ITEM = class.Create("base_item")

ITEM.Name           = "Duct Tape"
ITEM.Description    = "Can we fix it?"
ITEM.OutlineColor   = Color(183, 163, 136)

ITEM.Model          = Model("models/mosi/fallout4/props/junk/ducttape.mdl")

ITEM.Width          = 2
ITEM.Height         = 2

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_RARE }

ITEM.ItemGroup      = "Crafting"

return ITEM
