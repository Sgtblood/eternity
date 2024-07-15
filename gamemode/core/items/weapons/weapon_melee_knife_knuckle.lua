ITEM = class.Create("base_weapon")

ITEM.Name 				= "Knuckle Knife"
ITEM.Description 		= "Rather unique looking blade, handle is brass knuckles."
ITEM.OutlineColor		= Color(194, 136, 115)

ITEM.Model 				= "models/weapons/tfa_cod/mwr/wpn_h1_melee_knuckle_knife_irish_wm.mdl"

ITEM.Width 				= 1
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_MELEE}

-- ITEM.License 			= LICENSE_GREYMARKET
-- ITEM.UnitPrice          = 300
-- ITEM.SellPrice          = 75

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_melee_knuckleknife",
		Model = "models/weapons/tfa_cod/mwr/wpn_h1_melee_knuckle_knife_irish_wm.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the Knuckle Knife.",
		Width = 1,
		Height = 2
	},
}

ITEM.AmmoTypes 			= { }

return ITEM

