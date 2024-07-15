ITEM = class.Create("base_item")

ITEM.Name           = "Wire Wrap"
ITEM.Description    = "A wrap of electrical wires."
ITEM.OutlineColor   = Color(183, 163, 136)

ITEM.Model          = Model("models/illusion/eftcontainers/wires.mdl")



ITEM.Width          = 1
ITEM.Height         = 1 

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_RARE }

ITEM.ItemGroup      = "Crafting"

return ITEM
