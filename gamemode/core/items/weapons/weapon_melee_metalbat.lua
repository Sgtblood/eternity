ITEM = class.Create("base_weapon")

ITEM.Name 				= "Baseball Bat"
ITEM.Description 		= "A metal bat built for an iconic American sport. Barely dented."
ITEM.OutlineColor		= Color(194, 136, 115)

ITEM.Model 				= "models/weapons/worldfix/w_me_bat_metal.mdl"

ITEM.Width 				= 1
ITEM.Height 			= 4

ITEM.EquipmentSlots 	= {EQUIPMENT_MELEE}

-- ITEM.License 			= LICENSE_GREYMARKET
-- ITEM.UnitPrice          = 300
-- ITEM.SellPrice          = 75

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_melee_metalbat",
		Model = "models/weapons/worldfix/w_me_bat_metal.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the Metal Bat.",
		Width = 1,
		Height = 4
	},
}

ITEM.AmmoTypes 			= { }

return ITEM