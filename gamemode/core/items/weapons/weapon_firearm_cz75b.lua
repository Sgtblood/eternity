ITEM = class.Create("base_weapon")

ITEM.Name           = "Cz75B"
ITEM.Description    = "A Czechoslovakian semi-automatic pistol designed in the mid 1970's.\n\nChambered in 9x19mm."
ITEM.OutlineColor		= Color(205, 205, 230)

ITEM.Model          = Model("models/weapons/tfa_ins2/w_cz75b.mdl")

ITEM.Width          = 1
ITEM.Height         = 2

ITEM.EquipmentSlots = {EQUIPMENT_SECONDARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 7250
ITEM.SellPrice          = 3250

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_cz75b",
		Model = "models/weapons/tfa_ins2/w_cz75b.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 6,
		Description = "The base model of the Cz75B.",
		Width = 1,
		Height = 2
	}
}

ITEM.AmmoTypes 			= {
	["ammo_9x19mm"] = true
}

return ITEM
