ITEM = class.Create("base_weapon")

ITEM.Name 				= "Sledgehammer"
ITEM.Description 		= "Oversized mallet used for smashing objects, that be inanimate or not."
ITEM.OutlineColor		= Color(194, 136, 115)

ITEM.Model 				= "models/weapons/worldfix/w_me_sledge.mdl"

ITEM.Width 				= 1
ITEM.Height 			= 5

ITEM.EquipmentSlots 	= {EQUIPMENT_MELEE}

-- ITEM.License 			= LICENSE_GREYMARKET
-- ITEM.UnitPrice          = 300
-- ITEM.SellPrice          = 75

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_melee_sledgehammer",
		Model = "models/weapons/worldfix/w_me_sledge.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the Sledehammer.",
		Width = 1,
		Height = 5
	},
}

ITEM.AmmoTypes 			= { }

return ITEM