ITEM = class.Create("base_item")

ITEM.Name           = "Combine Battery"
ITEM.Description    = "A battery used to power Combine devices of small calibers."
ITEM.OutlineColor   = Color(183, 163, 136)

ITEM.Model          = Model("models/willardnetworks/gearsofindustry/wn_battery.mdl")

ITEM.Width          = 1
ITEM.Height         = 2

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_VERYRARE }

ITEM.ItemGroup      = "Crafting"

return ITEM
