ITEM = class.Create("base_weapon")

ITEM.Name           = "Franchi SPAS-12"
ITEM.Description    = "A American pump-action shotgun. \n\n Takes 12 Gauge Buckshot and Slugs."
ITEM.OutlineColor		= Color(205, 205, 230)

ITEM.Model          = Model("models/tnb/weapons/w_spas12.mdl")

ITEM.Width          = 4
ITEM.Height         = 2

ITEM.EquipmentSlots = {EQUIPMENT_PRIMARY}




ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_spas12",
		Model = "models/tnb/weapons/w_spas12.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the Spas-12.",
		Width = 3,
		Height = 2
	},
	SD = {
		WeaponClass = "eternity_firearm_spas12_sd",
		Model = "models/tnb/weapons/w_spas12.mdl",
		Skin = 0,
		Bodygroups = {[1] = 1},
		Title = "SD",
		Cost = 8,
		Refund = 4,
		Description = "Attaches a suppressor and short-range optic to the weapon's frame. Sacrifice accuracy for covert action.",
		Width = 3,
		Height = 2
	},
}

ITEM.AmmoTypes 			= {
	["ammo_12gauge_buckshot"] = true,
	["ammo_12gauge_slug"] = true
}

return ITEM
