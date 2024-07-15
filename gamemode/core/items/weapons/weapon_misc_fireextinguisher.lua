ITEM = class.Create("base_weapon")

ITEM.Name 				= "Fire Extinguisher"
ITEM.Description 		= "Fight fire with fire... Extinguishers."

ITEM.Model 				= Model("models/props_c17/SuitCase001a.mdl")

ITEM.OutlineColor		= Color(71, 161, 184)

ITEM.Width 				= 1
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_MISC}

--ITEM.License 			= LICENSE_MISCGOODS
--ITEM.UnitPrice          = 600
--ITEM.SellPrice          = 275

ITEM.WeaponClass    = "weapon_extinguisher_infinite"

return ITEM