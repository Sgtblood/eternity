ITEM = class.Create("base_weapon")

ITEM.Name 				= "MAC-10"
ITEM.Description 		= "A reliable submachinegun that easily could rip through targets. \n\nChambered in .45 ACP."
ITEM.OutlineColor		= Color(205, 205, 230)

ITEM.Model 				= Model("models/tnb/weapons/w_mac10.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_SECONDARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 30500
ITEM.SellPrice          = 5000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_mac10",
		Model = "models/tnb/weapons/w_mac10.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the MAC-10.",
		Width = 2,
		Height = 2
	},
	SD = {
		WeaponClass = "eternity_firearm_mac10_sd",
		Model = "models/tnb/weapons/w_mac10.mdl",
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
		WeaponClass = "eternity_firearm_mac10_sf",
		Model = "models/tnb/weapons/w_mac10.mdl",
		Skin = 0,
		Bodygroups = {[1] = 3},
		Title = "SF",
		Cost = 8,
		Refund = 8,
		Description = "Upgraded greatly.",
		Width = 3,
		Height = 2
	},
}

ITEM.AmmoTypes 			= {
	["ammo_45acp"] = true,
	["ammo_9x19mm"] = true
}

return ITEM