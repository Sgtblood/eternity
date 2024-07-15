ITEM = class.Create("base_item")

ITEM.Name           = "Disinfectant"
ITEM.Description    = "Combine Grade Clean-it-All. God it reeks like bleach."
ITEM.OutlineColor   = Color(183, 163, 136)

ITEM.Model          = Model("models/willardnetworks/props/disinfectant.mdl")

ITEM.Width          = 2
ITEM.Height         = 2

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_UNCOMMON }

ITEM.ItemGroup      = "Crafting"

return ITEM
