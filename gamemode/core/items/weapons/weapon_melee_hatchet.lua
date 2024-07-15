ITEM = class.Create("base_weapon")

ITEM.Name 				= "Hatchet"
ITEM.Description 		= "The wood has long since turned old, splinter and cracked. Yet it continues onwards."
ITEM.OutlineColor		= Color(194, 136, 115)

ITEM.Model 				= "models/weapons/worldfix/w_me_hatchet.mdl"

ITEM.Width 				= 1
ITEM.Height 			= 3

ITEM.EquipmentSlots 	= {EQUIPMENT_MELEE}

-- ITEM.License 			= LICENSE_GREYMARKET
-- ITEM.UnitPrice          = 300
-- ITEM.SellPrice          = 75

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_melee_hatchet",
		Model = "models/weapons/worldfix/w_me_hatchet.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the Hatchet.",
		Width = 1,
		Height = 3
	},
}

ITEM.AmmoTypes 			= { }

return ITEM