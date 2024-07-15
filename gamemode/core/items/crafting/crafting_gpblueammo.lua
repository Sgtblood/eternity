ITEM = class.Create("base_item")

ITEM.Name           = "Gunpowder BLUE Mix"
ITEM.Description    = "Blue Gunpowder, used in the crafting of munitions."
ITEM.OutlineColor   = Color(183, 163, 136)

ITEM.Model          = Model("models/illusion/eftcontainers/gpblue.mdl")



ITEM.Width          = 1
ITEM.Height         = 1 

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_RARE }

ITEM.ItemGroup      = "Crafting"

return ITEM
