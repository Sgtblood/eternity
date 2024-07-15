ITEM = class.Create("base_item")

ITEM.Name           = "Zippo Lighter"
ITEM.Description    = "An old-world lighter, good and handy."
ITEM.OutlineColor   = Color(183, 163, 136)

ITEM.Model          = Model("models/willardnetworks/cigarettes/zippo.mdl")

ITEM.License        = LICENSE_GREYMARKET
ITEM.UnitPrice      = 45
ITEM.SellPrice      = 20

ITEM.Width          = 1
ITEM.Height         = 1 

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_RARE }

ITEM.ItemGroup      = "Crafting"

return ITEM
