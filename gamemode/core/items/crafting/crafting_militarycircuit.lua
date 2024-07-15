ITEM = class.Create("base_item")

ITEM.Name           = "Military Circuit Board"
ITEM.Description    = "An old-world military circuit board, responsible for computer automation or otherwise. You'd best hide this."
ITEM.OutlineColor   = Color(183, 163, 136)

ITEM.Model          = Model("models/illusion/eftcontainers/militaryboard.mdl")

ITEM.License        = LICENSE_BLACKMARKET
ITEM.SellPrice      = 500

ITEM.Width          = 2
ITEM.Height         = 2

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_IMPOSSIBLE }

ITEM.ItemGroup      = "Crafting"

return ITEM
