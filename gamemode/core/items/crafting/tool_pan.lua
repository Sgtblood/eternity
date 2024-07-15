ITEM = class.Create("base_item")

ITEM.Name           = "Frying Pan"
ITEM.Description    = "A good tool for food preparation."
ITEM.OutlineColor   = Color(183, 163, 136)

ITEM.Model          = Model("models/synapse/alyxports/pan_1.mdl")

ITEM.License        = LICENSE_MISCGOODS
ITEM.UnitPrice      = 125
ITEM.SellPrice      = 15

ITEM.Width          = 2
ITEM.Height         = 1 

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_RARE }

ITEM.ItemGroup      = "Crafting"
ITEM.ItemTags       = { "Tool" }

return ITEM