ITEM = class.Create("base_weapon")

ITEM.Name 				= "Handheld Floodlight"
ITEM.Description 		= "A portable floodlight meant for creating wide beams of light. Runs on a large rechargable battery."

ITEM.Model 				= Model("models/lamps/torch.mdl")
ITEM.Color 				= Color(220, 220, 40)
ITEM.OutlineColor		= Color(71, 161, 184)

ITEM.Width 				= 1
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_MISC}

ITEM.License 			= LICENSE_MISCGOODS
ITEM.UnitPrice          = 600
ITEM.SellPrice          = 275

ITEM.WeaponClass    = "eternity_misc_flood"

return ITEM