ITEM = class.Create("base_weapon")

ITEM.Name 				= "Rappel Gun"
ITEM.Description 		= "Rappel."

ITEM.Model 				= Model("models/props_junk/meathook001a.mdl")

ITEM.OutlineColor		= Color(71, 161, 184)

ITEM.Width 				= 1
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_MISC}

--ITEM.License 			= LICENSE_MISCGOODS
--ITEM.UnitPrice          = 600
--ITEM.SellPrice          = 275

ITEM.WeaponClass    = "rappel"

return ITEM