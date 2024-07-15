ITEM = class.Create("base_item")

ITEM.Name           = "Gunpowder RED Mix"
ITEM.Description    = "Red Gunpowder, used for highly concentrated explosives."
ITEM.OutlineColor   = Color(183, 163, 136)

ITEM.Model          = Model("models/illusion/eftcontainers/gpred.mdl")



ITEM.Width          = 1
ITEM.Height         = 1 

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_LEGENDARY }

ITEM.ItemGroup      = "Crafting"

return ITEM
