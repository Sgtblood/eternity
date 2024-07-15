ITEM = class.Create("base_item")

ITEM.Name           = "Rubber Roll"
ITEM.Description    = "A roll of Rubber."
ITEM.OutlineColor   = Color(183, 163, 136)

ITEM.Model          = Model("models/mosi/fallout4/props/junk/components/rubber.mdl")



ITEM.Width          = 1
ITEM.Height         = 2 

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_RARE }

ITEM.ItemGroup      = "Crafting"

return ITEM
