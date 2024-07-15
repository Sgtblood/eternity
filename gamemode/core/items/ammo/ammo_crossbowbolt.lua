ITEM = class.Create("base_ammo")

ITEM.Name 				= "Crossbow Bolts"
ITEM.Description 		= "A small bundle of crossbow bolts"

ITEM.Model 				= Model("models/Items/CrossbowRounds.mdl")

ITEM.MaxStack 			= 10

ITEM.AmmoClass 			= "crossbowbolt"

-- ITEM.License 			= LICENSE_BLACKMARKET
-- ITEM.UnitPrice          = 2
-- ITEM.SellPrice          = 0

return ITEM