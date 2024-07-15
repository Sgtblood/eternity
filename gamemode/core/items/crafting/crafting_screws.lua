ITEM = class.Create("base_item")

ITEM.Name           = "Box of Screws"
ITEM.Description    = "An essential to any project."
ITEM.OutlineColor   = Color(183, 163, 136)

ITEM.Model          = Model("models/mosi/fallout4/props/junk/components/screws.mdl")


ITEM.Width          = 1
ITEM.Height         = 1 

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_COMMON }

ITEM.ItemGroup      = "Crafting"

return ITEM
