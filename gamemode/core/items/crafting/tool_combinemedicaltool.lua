ITEM = class.Create("base_item")

ITEM.Name           = "Combine A.M.I Tool"
ITEM.Description    = "An advanced Medical tool used by Combine Medics to rapidly exchange and inject medical fluids and vaccinations."
ITEM.OutlineColor   = Color(213, 101, 32)

ITEM.Model          = Model("models/comrade/fear_props/medic.mdl")


ITEM.Width          = 2
ITEM.Height         = 2

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_IMPOSSIBLE }

ITEM.ItemGroup      = "Crafting"
ITEM.ItemTags       = { "Tool" }

return ITEM