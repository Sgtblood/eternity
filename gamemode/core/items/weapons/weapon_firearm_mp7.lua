ITEM = class.Create("base_weapon")

ITEM.Name 				= "Heckler & Koch MP7"
ITEM.Description 		= "A reliable submachinegun that the Combine favor. \n\nChambered in 4.6×30mm."
ITEM.OutlineColor		= Color(205, 205, 230)

ITEM.Model 				= Model("models/tnb/weapons/w_mp7.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 25000
ITEM.SellPrice          = 5000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_mp7",
		Model = "models/tnb/weapons/w_mp7.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the MP7.",
		Width = 2,
		Height = 2
	},
	SD = {
		WeaponClass = "eternity_firearm_mp7_sd",
		Model = "models/tnb/weapons/w_mp7.mdl",
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
		WeaponClass = "eternity_firearm_mp7_sf",
		Model = "models/tnb/weapons/w_mp7.mdl",
		Skin = 0,
		Bodygroups = {[1] = 3},
		Title = "SF",
		Cost = 8,
		Refund = 8,
		Description = "Added Red-Dot Sights, heavy suppressor, and increased magazine size.",
		Width = 3,
		Height = 2
	},
	SF = {
		WeaponClass = "eternity_firearm_mp7_ap",
		Model = "models/tnb/weapons/w_mp7.mdl",
		Skin = 0,
		Bodygroups = {[1] = 2},
		Title = "AP",
		Cost = 8,
		Refund = 8,
		Description = "Added Aimpoint Sights, improved grips, and increased magazine size.",
		Width = 3,
		Height = 2
	},
}

ITEM.AmmoTypes 			= {
	["ammo_smg"] = true
}

return ITEM