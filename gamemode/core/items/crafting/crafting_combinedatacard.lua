ITEM = class.Create("base_item")

ITEM.Name           = "Combine Data Card"
ITEM.Description    = "A very elusive and contraband item, used by the Combine in someway."
ITEM.OutlineColor   = Color(125, 25, 136)

ITEM.Model          = Model("models/willardnetworks/gearsofindustry/wn_data_card.mdl")



ITEM.Width          = 1
ITEM.Height         = 1 

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_IMPOSSIBLE }

ITEM.ItemGroup      = "Crafting"

return ITEM
