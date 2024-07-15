ITEM = class.Create("base_item")

ITEM.Name           = "Hacksaw"
ITEM.Description    = "Reliable saw for precision cutting through wood and metal effortlessly."
ITEM.OutlineColor   = Color(80, 80, 80)

ITEM.Model          = Model("models/props_se/workshop/saw_metal.mdl")


ITEM.Width          = 3
ITEM.Height         = 1

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_RARE }

ITEM.ItemGroup      = "Crafting"
ITEM.ItemTags       = { "Tool" }

return ITEM