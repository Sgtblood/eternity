ITEM = class.Create("base_weapon")

ITEM.Name 				= "Makarov"
ITEM.Description 		= "A nice Soviet Era pistol. \n\nChambered in 9x18mm."
ITEM.OutlineColor		= Color(205, 205, 230)

ITEM.Model 				= Model("models/tnb/weapons/w_makarov.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_SECONDARY}

ITEM.License 			= LICENSE_GREYMARKET
ITEM.UnitPrice          = 6800
ITEM.SellPrice          = 1250

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_makarov",
		Model = "models/tnb/weapons/w_makarov.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the Makarov.",
		Width = 2,
		Height = 1
	},
	SD = {
		WeaponClass = "eternity_firearm_makarov_sd",
		Model = "models/tnb/weapons/w_makarov.mdl",
		Skin = 0,
		Bodygroups = {[1] = 1},
		Title = "SD",
		Cost = 2,
		Refund = 1,
		Description = "Attaches a suppressor to the weapon's frame.",
		Width = 2,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_9x18mm"] = true
}

return ITEM