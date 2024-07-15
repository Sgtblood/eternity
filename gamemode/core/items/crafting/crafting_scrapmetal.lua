ITEM = class.Create("base_item")

ITEM.Name           = "Scrap Metal"
ITEM.Description    = "Old metal, that can still be used with the right mind."
ITEM.OutlineColor   = Color(183, 163, 136)

ITEM.Model          = Model("models/willardnetworks/props/scrap.mdl")



ITEM.Width          = 2
ITEM.Height         = 1 

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_COMMON }

ITEM.ItemGroup      = "Crafting"

return ITEM
