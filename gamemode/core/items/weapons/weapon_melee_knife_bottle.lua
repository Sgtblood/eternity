ITEM = class.Create("base_weapon")

ITEM.Name 				= "Broken Bottle"
ITEM.Description 		= "Smashed bottle, sharp enough to pierce skin."
ITEM.OutlineColor		= Color(194, 136, 115)

ITEM.Model 				= "models/weapons/tfa_cod/mwr/wpn_h1_melee_broken_bottle_2_wm.mdl"

ITEM.Width 				= 1
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_MELEE}

-- ITEM.License 			= LICENSE_GREYMARKET
-- ITEM.UnitPrice          = 300
-- ITEM.SellPrice          = 75

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_melee_brokenbottle",
		Model = "models/weapons/tfa_cod/mwr/wpn_h1_melee_broken_bottle_2_wm.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the Broken Bottle.",
		Width = 1,
		Height = 2
	},
}

ITEM.AmmoTypes 			= { }

return ITEM

