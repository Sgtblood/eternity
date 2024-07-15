ITEM = class.Create("base_weapon")

ITEM.Name           = "Toz-194"
ITEM.Description    = "A Russian pump-action shotgun. \n\n Takes 12 Gauge Buckshot and Slugs."
ITEM.OutlineColor		= Color(205, 205, 230)

ITEM.Model          = Model("models/weapons/w_inss2_toz_194m.mdl")

ITEM.Width          = 2
ITEM.Height         = 4

ITEM.EquipmentSlots = {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 37000
ITEM.SellPrice          = 6000


ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_toz194",
		Model = "models/weapons/w_inss2_toz_194m.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 6,
		Description = "The base model of the Toz-194M.",
		Width = 2,
		Height = 4
	}
}

ITEM.AmmoTypes 			= {
	["ammo_12gauge_buckshot"] = true,
	["ammo_12gauge_slug"] = true
}

return ITEM
