ITEM = class.Create("base_weapon")

ITEM.Name 				= "Riot Shield"
ITEM.Description 		= "The tool that is a must have for smashing down any protests."
ITEM.OutlineColor		= Color(194, 136, 115)

ITEM.Model 				= "models/weapons/riotshield/w_riotshield.mdl"

ITEM.Width 				= 2
ITEM.Height 			= 5

ITEM.EquipmentSlots 	= {EQUIPMENT_MELEE}

-- ITEM.License 			= LICENSE_BLACKMARKET
-- ITEM.UnitPrice          = 250
-- ITEM.SellPrice          = 200

ITEM.WeaponClass    = "eternity_melee_shield"

return ITEM
