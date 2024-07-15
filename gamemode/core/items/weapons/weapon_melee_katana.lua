ITEM = class.Create("base_weapon")

ITEM.Name 				= "Wakizashi"
ITEM.Description 		= "The Katana's little brother."
ITEM.OutlineColor		= Color(194, 136, 115)

ITEM.Model 				= "models/weapons/tfa_cod/mwr/wpn_h1_melee_katana_wm.mdl"

ITEM.Width 				= 1
ITEM.Height 			= 3

ITEM.EquipmentSlots 	= {EQUIPMENT_MELEE}

-- ITEM.License 			= LICENSE_GREYMARKET
-- ITEM.UnitPrice          = 300
-- ITEM.SellPrice          = 75

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_melee_katana",
		Model = "models/weapons/tfa_cod/mwr/wpn_h1_melee_katana_wm.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the Wakizashi.",
		Width = 1,
		Height = 3
	},
}

ITEM.AmmoTypes 			= { }

return ITEM
