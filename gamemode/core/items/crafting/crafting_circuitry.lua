ITEM = class.Create("base_item")

ITEM.Name           = "Circuit Board"
ITEM.Description    = "An old-world circuit board, responsible for computer automation or otherwise."
ITEM.OutlineColor   = Color(183, 163, 136)

ITEM.Model          = Model("models/willardnetworks/skills/circuit.mdl")

ITEM.Width          = 2
ITEM.Height         = 1 

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_VERYRARE }

ITEM.ItemGroup      = "Crafting"

return ITEM
