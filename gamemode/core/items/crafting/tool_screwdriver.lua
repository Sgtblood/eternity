ITEM = class.Create("base_item")

ITEM.Name           = "Screwdriver"
ITEM.Description    = "Versatile screwdriver for precise assembly and disassembly of various components."
ITEM.OutlineColor   = Color(80, 80, 80)

ITEM.Model          = Model("models/props_se/workshop/screwdriver01.mdl")


ITEM.Width          = 1
ITEM.Height         = 1

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_RARE }

ITEM.ItemGroup      = "Crafting"
ITEM.ItemTags       = { "Tool" }

return ITEM