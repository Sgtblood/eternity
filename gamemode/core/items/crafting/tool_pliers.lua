ITEM = class.Create("base_item")

ITEM.Name           = "Pliers"
ITEM.Description    = "Versatile pliers for crafting, repairing, and manipulating objects with precision."
ITEM.OutlineColor   = Color(80, 80, 80)

ITEM.Model          = Model("models/mark2580/gtav/garage_stuff/pliers.mdl")


ITEM.Width          = 1
ITEM.Height         = 2

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_RARE }

ITEM.ItemGroup      = "Crafting"
ITEM.ItemTags       = { "Tool" }

return ITEM