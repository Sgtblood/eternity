ITEM = class.Create("base_throwable")

ITEM.Name 				= "M84 Stun Grenade"
ITEM.Description 		= "The primary-issue stun grenade of armed forces everywhere. Features a short one and a half second second timer."
ITEM.OutlineColor		= Color(71, 161, 184)

ITEM.Model 				= Model("models/weapons/w_eq_flashbang.mdl")

ITEM.EquipmentSlots 	= {EQUIPMENT_MISC}

ITEM.MaxStack 			= 6

ITEM.WeaponClass 		= "eternity_throwable_flashbang"

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 1500
ITEM.SellPrice          = 650

return ITEM