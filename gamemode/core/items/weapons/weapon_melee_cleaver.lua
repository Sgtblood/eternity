ITEM = class.Create("base_weapon")

ITEM.Name 				= "Cleaver"
ITEM.Description 		= "Square knife used for tough tasks within the kitchen and out."

ITEM.Model 				= "models/weapons/worldfix/w_me_cleaver.mdl"

ITEM.Width 				= 1
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_MELEE}

ITEM.License 			= LICENSE_GREYMARKET
ITEM.UnitPrice          = 200
ITEM.SellPrice          = 100

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_melee_cleaver",
		Model = "models/weapons/worldfix/w_me_cleaver.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the Cleaver.",
		Width = 1,
		Height = 1
	},
}

ITEM.AmmoTypes 			= { }

return ITEM