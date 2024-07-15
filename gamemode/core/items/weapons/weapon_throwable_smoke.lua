ITEM = class.Create("base_throwable")

ITEM.Name 				= "AN-M8 HC Smoke Grenade"
ITEM.Description 		= "A military grenade used as a ground-to-ground obscuring or screening device. Burns anywhere between fifty and ninety seconds."
ITEM.OutlineColor		= Color(71, 161, 184)

ITEM.Model 				= Model("models/weapons/w_grenade.mdl")

ITEM.EquipmentSlots 	= {EQUIPMENT_MISC}

ITEM.MaxStack 			= 6

ITEM.WeaponClass 		= "eternity_throwable_smoke"
ITEM.SmokeColor 		= Vector(135, 135, 135)

ITEM.License 			= LICENSE_GREYMARKET
ITEM.UnitPrice          = 750
ITEM.SellPrice          = 500

return ITEM