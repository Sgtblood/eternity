ITEM = class.Create("base_weapon")

ITEM.Name           = "Double Barreled Shotgun"
ITEM.Description    = "A Double Barreled Shotgun. Commonly used by hunter's or farmer's.\n\n Takes 12 Gauge Buckshot and Slugs."
ITEM.OutlineColor		= Color(205, 205, 230)

ITEM.Model          = Model("models/weapons/w_inss2_toz_194m.mdl")

ITEM.Width          = 5
ITEM.Height         = 1

ITEM.EquipmentSlots = {EQUIPMENT_PRIMARY}

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_doublebarrel",
		Model = "models/weapons/w_doublebarrel_new.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 6,
		Description = "You can at best saw it off.",
		Width = 5,
		Height = 1
	}
}

ITEM.AmmoTypes 			= {
	["ammo_12gauge_buckshot"] = true,
	["ammo_12gauge_slug"] = true
}

return ITEM
