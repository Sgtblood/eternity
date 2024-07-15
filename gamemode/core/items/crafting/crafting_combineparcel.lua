ITEM = class.Create("base_item")

ITEM.Name           = "Combine Parcel"
ITEM.Description    = "A product for the Universal Union comes in many types."
ITEM.OutlineColor   = Color(183, 163, 136)

ITEM.Model          = Model("models/willard/combine/parcel.mdl")


ITEM.Width          = 2
ITEM.Height         = 2 

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_IMPOSSIBLE }

ITEM.ItemGroup      = "Crafting"

return ITEM
