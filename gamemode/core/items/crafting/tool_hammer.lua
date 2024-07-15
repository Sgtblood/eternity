ITEM = class.Create("base_item")

ITEM.Name           = "Hammer"
ITEM.Description    = "A sturdy and common tool for building dreams, or breaking them."
ITEM.OutlineColor   = Color(80, 80, 80)

ITEM.Model          = Model("models/props_se/workshop/hammer01.mdl")


ITEM.Width          = 1
ITEM.Height         = 3

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_RARE }

ITEM.ItemGroup      = "Crafting"
ITEM.ItemTags       = { "Tool" }

return ITEM