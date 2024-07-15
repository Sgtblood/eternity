ITEM = class.Create("base_item")

ITEM.Name           = "Medical Tool Kit"
ITEM.Description    = "A kit containing every medical tool you'd need to perform surgery and more."
ITEM.OutlineColor   = Color(214, 22, 22)

ITEM.Model          = Model("models/carlsmei/escapefromtarkov/medical/automedkit.mdl")


ITEM.Width          = 2
ITEM.Height         = 2

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_LEGENDARY }

ITEM.ItemGroup      = "Crafting"
ITEM.ItemTags       = { "Tool" }

return ITEM