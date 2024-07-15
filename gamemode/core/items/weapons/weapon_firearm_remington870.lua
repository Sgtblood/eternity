ITEM = class.Create("base_weapon")

ITEM.Name           = "Remington Model 870"
ITEM.Description    = "A American pump-action shotgun. \n\n Takes 12 Gauge Buckshot and Slugs."
ITEM.OutlineColor		= Color(205, 205, 230)

ITEM.Model          = Model("models/weapons/smc/r870/w_remington_m870.mdl")

ITEM.Width          = 4
ITEM.Height         = 2

ITEM.EquipmentSlots = {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 45000
ITEM.SellPrice          = 6000


ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_remington870",
		Model = "models/weapons/smc/r870/w_remington_m870.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 6,
		Description = "The base model of the M870.",
		Width = 4,
		Height = 2
	}
}

ITEM.AmmoTypes 			= {
	["ammo_12gauge_buckshot"] = true,
	["ammo_12gauge_slug"] = true
}

return ITEM
