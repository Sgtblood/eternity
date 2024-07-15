ITEM = class.Create("base_weapon")

ITEM.Name           = "Serbu Super Shorty"
ITEM.Description    = "Goodbye Door! \n\n Takes 12 Gauge Buckshot and Slugs."
ITEM.OutlineColor		= Color(205, 205, 230)

ITEM.Model          = Model("models/tnb/weapons/w_shorty.mdl")

ITEM.Width          = 2
ITEM.Height         = 2

ITEM.EquipmentSlots = {EQUIPMENT_SECONDARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 32000
ITEM.SellPrice          = 6000


ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_shorty",
		Model = "models/tnb/weapons/w_shorty.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 6,
		Description = "The base model of the Shorty.",
		Width = 2,
		Height = 2
	}
}

ITEM.AmmoTypes 			= {
	["ammo_12gauge_buckshot"] = true,
	["ammo_12gauge_slug"] = true
}

return ITEM
