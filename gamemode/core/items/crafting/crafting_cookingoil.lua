ITEM = class.Create("base_item")

ITEM.Name           = "Cooking Oil"
ITEM.Description    = "A strange and odd fluid that has been preserved."
ITEM.OutlineColor   = Color(211, 22, 31)

ITEM.Model          = Model("models/mark2580/gtav/garage_stuff/oilbot01.mdl")


ITEM.Width          = 1
ITEM.Height         = 1 

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_UNCOMMON }

ITEM.ItemGroup      = "Crafting"

return ITEM
