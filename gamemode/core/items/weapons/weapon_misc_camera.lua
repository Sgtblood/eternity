ITEM = class.Create("base_weapon")

ITEM.Name 				= "TV Camera"
ITEM.Description 		= "The all seeing eye of the world."

ITEM.Model 				= Model("models/props_c17/SuitCase001a.mdl")

ITEM.OutlineColor		= Color(71, 161, 184)

ITEM.Width 				= 1
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_MISC}

--ITEM.License 			= LICENSE_MISCGOODS
--ITEM.UnitPrice          = 600
--ITEM.SellPrice          = 275

ITEM.WeaponClass    = "eternity_misc_camera"

return ITEM