ITEM = class.Create("base_weapon")

ITEM.Name 				= "Walter PPK"
ITEM.Description 		= "A German-developed semi-automatic pistol from the 1900s.\n\nChambered in .32 ACP."
ITEM.OutlineColor		= Color(205, 205, 230)

ITEM.Model 				= Model("models/tnb/weapons/w_ppk.mdl")

ITEM.Width 				= 1
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_SECONDARY}

ITEM.License 			= LICENSE_GREYMARKET
ITEM.UnitPrice          = 6500
ITEM.SellPrice          = 1250

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_ppk",
		Model = "models/tnb/weapons/w_ppk.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the PPK.",
		Width = 1,
		Height = 1
	},
	SD = {
		WeaponClass = "eternity_firearm_ppk_sd",
		Model = "models/tnb/weapons/w_ppk.mdl",
		Skin = 0,
		Bodygroups = {[1] = 1},
		Title = "SD",
		Cost = 1,
		Refund = 1,
		Description = "Attaches a suppressor to the weapon's frame.",
		Width = 1,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_32acp"] = true
}

return ITEM