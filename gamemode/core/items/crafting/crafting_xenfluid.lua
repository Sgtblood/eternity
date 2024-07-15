ITEM = class.Create("base_item")

ITEM.Name           = "Flask of Xen Fluid"
ITEM.Description    = "A strange and odd fluid that has been preserved."
ITEM.OutlineColor   = Color(41, 54, 180)

ITEM.Model          = Model("models/willardnetworks/skills/chemical_flask4.mdl")


ITEM.Width          = 1
ITEM.Height         = 1 

ITEM.LootPools      = { LOOT_CRAFTING }
ITEM.LootWeights    = { LOOTWEIGHT_LEGENDARY }

ITEM.ItemGroup      = "Crafting"

return ITEM
