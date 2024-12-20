ITEM = class.Create("base_throwable")

ITEM.Name 				= "AN-M18 Colored Grenade (Blue)"
ITEM.Description 		= "A military grenade used as a ground-to-air signaling or target-marking device. Burns anywhere between fifty and ninety seconds."
ITEM.OutlineColor		= Color(71, 161, 184)

ITEM.Model 				= Model("models/weapons/w_grenade.mdl")

ITEM.EquipmentSlots 	= {EQUIPMENT_MISC}

ITEM.MaxStack 			= 6

ITEM.WeaponClass 		= "eternity_throwable_signal"
ITEM.SmokeColor 		= Vector(0, 0, 125)
ITEM.SmokeTitle         = "Blue"

ITEM.License 			= LICENSE_GREYMARKET
ITEM.UnitPrice          = 750
ITEM.SellPrice          = 500

return ITEM