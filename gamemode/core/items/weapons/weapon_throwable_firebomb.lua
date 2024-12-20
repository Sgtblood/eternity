ITEM = class.Create("base_throwable")

ITEM.Name 				= "Molotov Cocktail"
ITEM.Description 		= "A a crude incendiary device typically consisting of a bottle filled with flammable liquid and with a means of ignition."
ITEM.OutlineColor		= Color(71, 161, 184)

ITEM.Model 				= Model("models/craphead_scripts/ocrp2/props_meow/weapons/w_molotov.mdl")

ITEM.EquipmentSlots 	= {EQUIPMENT_MISC}


ITEM.MaxStack 			= 2

ITEM.WeaponClass 		= "eternity_throwable_firebomb"
ITEM.SmokeColor 		= Vector(20, 20, 20)

ITEM.Forward = 6
ITEM.Right = 3
ITEM.LobVelocity = 800

-- ITEM.License 			= LICENSE_BLACKMARKET
-- ITEM.UnitPrice          = 500
-- ITEM.SellPrice          = 200

return ITEM