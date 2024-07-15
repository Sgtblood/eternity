ITEM = class.Create("base_weapon")

ITEM.Name 				= "Bayonet"
ITEM.Description 		= "Aged and slightly faded, still holds some edge."

ITEM.Model 				= "models/weapons/tfa_cod/mwr/wpn_h1_melee_rifle_bayonet_wm.mdl"

ITEM.Width 				= 1
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_MELEE}

-- ITEM.License 			= LICENSE_GREYMARKET
-- ITEM.UnitPrice          = 300
-- ITEM.SellPrice          = 75

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_melee_bayonet",
		Model = "models/weapons/tfa_cod/mwr/wpn_h1_melee_rifle_bayonet_wm.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the Bayonet.",
		Width = 1,
		Height = 1
	},
}

ITEM.AmmoTypes 			= { }

return ITEM