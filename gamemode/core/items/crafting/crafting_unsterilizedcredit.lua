ITEM = class.Create("base_item")

ITEM.Name           = "Unsterilized Credit"
ITEM.Description    = "A raw coin of a strange plastic texture, yet to be activated."
ITEM.OutlineColor   = Color(183, 163, 136)

ITEM.Model          = Model("models/uu_branded/bioshockinfinite/hext_coin.mdl")


ITEM.Width          = 2
ITEM.Height         = 1

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_COMMON }

ITEM.ItemGroup      = "Crafting"

return ITEM
