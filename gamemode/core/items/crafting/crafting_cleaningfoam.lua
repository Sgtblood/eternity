ITEM = class.Create("base_item")

ITEM.Name           = "Flask of Cleaning Solution"
ITEM.Description    = "A crucial step to making the Cleaning Solution, sent off to who know's where!"
ITEM.OutlineColor   = Color(183, 163, 136)

ITEM.Model          = Model("models/props_hospital/flask02.mdl")

ITEM.Width          = 2
ITEM.Height         = 2

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_RARE }

ITEM.ItemGroup      = "Crafting"

return ITEM
