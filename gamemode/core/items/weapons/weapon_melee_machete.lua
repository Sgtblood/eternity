ITEM = class.Create("base_weapon")

ITEM.Name 				= "Machete"
ITEM.Description 		= "A large, sharpened blade intended for clearing thick brush and woodland growth."
ITEM.OutlineColor		= Color(194, 136, 115)

ITEM.Model 				= "models/weapons/fix/w_me_machete.mdl"

ITEM.Width 				= 1
ITEM.Height 			= 4

ITEM.EquipmentSlots 	= {EQUIPMENT_MELEE}

-- ITEM.License 			= LICENSE_GREYMARKET
-- ITEM.UnitPrice          = 300
-- ITEM.SellPrice          = 75

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_melee_machete",
		Model = "models/weapons/fix/w_me_machete.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the Machete.",
		Width = 1,
		Height = 4
	},
}

ITEM.AmmoTypes 			= { }

return ITEM