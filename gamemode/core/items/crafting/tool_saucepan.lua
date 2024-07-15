ITEM = class.Create("base_item")

ITEM.Name           = "Sauce Pan"
ITEM.Description    = "A good tool for food preparation."
ITEM.OutlineColor   = Color(183, 163, 136)

ITEM.Model          = Model("models/props_interiors/pot02a.mdl")

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