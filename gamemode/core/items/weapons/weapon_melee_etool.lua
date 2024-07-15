ITEM = class.Create("base_weapon")

ITEM.Name 				= "E-Tool"
ITEM.Description 		= "Incredibly useful tool favored by the survivalists of the world."
ITEM.OutlineColor		= Color(194, 136, 115)

ITEM.Model 				= "models/weapons/worldfix/w_me_etool.mdl"

ITEM.Width 				= 1
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_MELEE}

-- ITEM.License 			= LICENSE_GREYMARKET
-- ITEM.UnitPrice          = 300
-- ITEM.SellPrice          = 75

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_melee_etool",
		Model = "models/weapons/worldfix/w_me_etool.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the E-Tool.",
		Width = 1,
		Height = 2
	},
}

ITEM.AmmoTypes 			= { }

return ITEM