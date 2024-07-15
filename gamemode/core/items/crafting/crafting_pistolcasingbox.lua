ITEM = class.Create("base_item")

ITEM.Name           = "Pistol Casing Ammo Box"
ITEM.Description    = "A place to store various calibers of Combine Ammo."
ITEM.OutlineColor   = Color(183, 163, 136)

ITEM.Model          = Model("models/Items/BoxSRounds.mdl")


ITEM.Width          = 2
ITEM.Height         = 1

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_IMPOSSIBLE }

ITEM.ItemGroup      = "Crafting"

return ITEM
