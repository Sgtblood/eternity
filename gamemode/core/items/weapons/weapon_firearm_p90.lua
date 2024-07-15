ITEM = class.Create("base_weapon")

ITEM.Name 				= "FN-P90"
ITEM.Description 		= "A favored NATO Belgium submachinegun. \n\n Chambered in 5.7x28mm."
ITEM.OutlineColor		= Color(205, 205, 230)

ITEM.Model 				= Model("models/tnb/weapons/w_p90.mdl")

ITEM.Width 				= 3
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}


ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_p90",
		Model = "models/tnb/weapons/w_p90.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the P90.",
		Width = 3,
		Height = 2
	},
	SD = {
		WeaponClass = "eternity_firearm_p90_sd",
		Model = "models/tnb/weapons/w_p90.mdl",
		Skin = 0,
		Bodygroups = {[1] = 1},
		Title = "SD",
		Cost = 4,
		Refund = 4,
		Description = "Attaches a suppressor and short-range optic to the weapon's frame. Sacrifice accuracy for covert action.",
		Width = 3,
		Height = 2
	},
	SF = {
		WeaponClass = "eternity_firearm_p90_sf",
		Model = "models/tnb/weapons/w_p90.mdl",
		Skin = 0,
		Bodygroups = {[1] = 2},
		Title = "SF",
		Cost = 8,
		Refund = 8,
		Description = "Added Red-Dot Sights, heavy suppressor.",
		Width = 3,
		Height = 2
	},
}

ITEM.AmmoTypes 			= {
	["ammo_smg"] = true
}

return ITEM