ITEM = class.Create("base_weapon")

ITEM.Name 				= "Pipe"
ITEM.Description 		= "Has some heft to it. Only a few dents."
ITEM.OutlineColor		= Color(194, 136, 115)

ITEM.Model 				= "models/weapons/worldfix/w_me_pipe_lead.mdl"

ITEM.Width 				= 1
ITEM.Height 			= 3

ITEM.EquipmentSlots 	= {EQUIPMENT_MELEE}

ITEM.License 			= LICENSE_GREYMARKET
ITEM.UnitPrice          = 200
ITEM.SellPrice          = 40


ITEM.WeaponClass    = "eternity_melee_pipe"

return ITEM
