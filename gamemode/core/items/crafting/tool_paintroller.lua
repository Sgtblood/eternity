ITEM = class.Create("base_item")

ITEM.Name           = "Paint Roller"
ITEM.Description    = "A necessary job for any rennovative or construction project."
ITEM.OutlineColor   = Color(80, 80, 80)

ITEM.Model          = Model("models/props_se/junk/paint_roll.mdl")

ITEM.License        = LICENSE_MISCGOODS
ITEM.UnitPrice      = 50
ITEM.SellPrice      = 15

ITEM.Width          = 1
ITEM.Height         = 4

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_RARE }

ITEM.ItemGroup      = "Crafting"
ITEM.ItemTags       = { "Tool" }

return ITEM