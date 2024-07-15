ITEM = class.Create("base_item")

ITEM.Name           = "Food Processor Unsterilized Credit Pack"
ITEM.Description    = "A pack of Unsterilized Credits, ready to be put in a ration."
ITEM.OutlineColor   = Color(102, 98, 98)

ITEM.Model          = Model("models/props_lab/box01a.mdl")

ITEM.Width          = 1
ITEM.Height         = 1 

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_IMPOSSIBLE }

ITEM.ItemGroup      = "Crafting"

return ITEM
