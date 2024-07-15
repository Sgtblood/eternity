ITEM = class.Create("base_item")

ITEM.Name           = "Electrial Tape"
ITEM.Description    = "A large roll of Electrical Tape, crucial for electronical repairs."
ITEM.OutlineColor   = Color(183, 163, 136)

ITEM.Model          = Model("models/props_hla/props/electrical_tape.mdl")



ITEM.Width          = 2
ITEM.Height         = 2 

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_VERYRARE }

ITEM.ItemGroup      = "Crafting"

return ITEM
