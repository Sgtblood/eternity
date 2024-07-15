ITEM = class.Create("base_weapon")

ITEM.Name 				= "Knife"
ITEM.Description 		= "Razor sharp."

ITEM.Model 				= "models/weapons/arc9/darsu_eft/w_melee_bars_a2607.mdl"

ITEM.Width 				= 1
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_MELEE}

-- ITEM.License 			= LICENSE_GREYMARKET
-- ITEM.UnitPrice          = 300
-- ITEM.SellPrice          = 75

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_melee_knife",
		Model = "models/weapons/arc9/darsu_eft/w_melee_bars_a2607.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the Knife.",
		Width = 1,
		Height = 1
	},
}

ITEM.AmmoTypes 			= { }

return ITEM