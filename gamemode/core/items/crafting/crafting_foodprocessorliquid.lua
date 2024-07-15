ITEM = class.Create("base_item")

ITEM.Name           = "Food Processor Liquid"
ITEM.Description    = "An odorless can, with a strange white metallic liquid."
ITEM.OutlineColor   = Color(102, 98, 98)

ITEM.Model          = Model("models/uu_branded/props_nunk/popcan01a.mdl")

ITEM.Width          = 1
ITEM.Height         = 1 

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_IMPOSSIBLE }

ITEM.ItemGroup      = "Crafting"

return ITEM
