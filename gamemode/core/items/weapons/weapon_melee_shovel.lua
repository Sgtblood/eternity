ITEM = class.Create("base_weapon")

ITEM.Name 				= "Shovel"
ITEM.Description 		= "Well? Get to digging."
ITEM.OutlineColor		= Color(194, 136, 115)

ITEM.Model 				= "models/weapons/worldfix/w_me_spade.mdl"

ITEM.Width 				= 1
ITEM.Height 			= 4

ITEM.EquipmentSlots 	= {EQUIPMENT_MELEE}

-- ITEM.License 			= LICENSE_GREYMARKET
-- ITEM.UnitPrice          = 300
-- ITEM.SellPrice          = 75

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_melee_shovel",
		Model = "models/weapons/worldfix/w_me_spade.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the Shovel.",
		Width = 1,
		Height = 4
	},
}

ITEM.AmmoTypes 			= { }

return ITEM