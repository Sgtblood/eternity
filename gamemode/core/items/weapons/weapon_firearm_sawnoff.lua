ITEM = class.Create("base_weapon")

ITEM.Name           = "Sawed Off Double Barrel"
ITEM.Description    = "Haha, I'm in danger! \n\n Takes 12 Gauge Buckshot and Slugs."
ITEM.OutlineColor		= Color(205, 205, 230)

ITEM.Model          = Model("models/weapons/tfa_custom/w_custom_ranger.mdl")

ITEM.Width          = 2
ITEM.Height         = 2

ITEM.EquipmentSlots = {EQUIPMENT_SECONDARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 32000
ITEM.SellPrice          = 6000


ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_sawnoff",
		Model = "models/weapons/tfa_custom/w_custom_ranger.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 6,
		Description = "The base model of the Sawed Off.",
		Width = 2,
		Height = 2
	}
}

ITEM.AmmoTypes 			= {
	["ammo_12gauge_buckshot"] = true,
	["ammo_12gauge_slug"] = true
}

return ITEM
