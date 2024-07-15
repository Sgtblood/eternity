ITEM = class.Create("base_item")

ITEM.Name           = "Xen Extract"
ITEM.Description    = "Only a creature of knowledge can extract this."
ITEM.OutlineColor   = Color(19, 113, 146)

ITEM.Model          = Model("models/willardnetworks/food/xen_extract.mdl")

ITEM.Width          = 1
ITEM.Height         = 1 

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_IMPOSSIBLE }

ITEM.ItemGroup      = "Crafting"

return ITEM
