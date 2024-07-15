ITEM = class.Create("base_weapon")

ITEM.Name 				= "Wrench"
ITEM.Description 		= "Plumbers delight."
ITEM.OutlineColor		= Color(194, 136, 115)

ITEM.Model 				= "models/weapons/worldfix/w_me_wrench.mdl"

ITEM.Width 				= 1
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_MELEE}

-- ITEM.License 			= LICENSE_GREYMARKET
-- ITEM.UnitPrice          = 300
-- ITEM.SellPrice          = 75

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_melee_wrench",
		Model = "models/weapons/worldfix/w_me_wrench.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the Wrench.",
		Width = 1,
		Height = 2
	},
}

ITEM.AmmoTypes 			= { }

return ITEM