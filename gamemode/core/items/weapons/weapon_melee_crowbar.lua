ITEM = class.Create("base_weapon")

ITEM.Name 				= "Crowbar"
ITEM.Description 		= "Favored by scientists and burglars alike."
ITEM.OutlineColor		= Color(194, 136, 115)

ITEM.Model 				= "models/weapons/worldfix/w_me_crowbar.mdl"

ITEM.Width 				= 1
ITEM.Height 			= 3

ITEM.EquipmentSlots 	= {EQUIPMENT_MELEE}

ITEM.License 			= LICENSE_GREYMARKET
ITEM.UnitPrice          = 300
ITEM.SellPrice          = 75

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_melee_crowbar",
		Model = "models/weapons/worldfix/w_me_crowbar.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the crowbar.",
		Width = 1,
		Height = 3
	},
}

ITEM.AmmoTypes 			= { }

return ITEM