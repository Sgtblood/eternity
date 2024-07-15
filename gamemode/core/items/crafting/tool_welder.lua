ITEM = class.Create("base_item")

ITEM.Name           = "Welder"
ITEM.Description    = "A powerful tool, that requires a direct fuel source. Essential in fabrication."
ITEM.OutlineColor   = Color(80, 80, 80)

ITEM.Model          = Model("models/props_se/propper/garage/weld_tool.mdl")


ITEM.Width          = 1
ITEM.Height         = 2

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_IMPOSSIBLE }

ITEM.ItemGroup      = "Crafting"
ITEM.ItemTags       = { "Tool" }

return ITEM