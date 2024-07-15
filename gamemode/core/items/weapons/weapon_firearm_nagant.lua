ITEM = class.Create("base_weapon")

ITEM.Name 				= "Nagant M1895"
ITEM.Description 		= "A Soviet Commissar's best friend. \n\n Chambered in .32 ACP."
ITEM.OutlineColor		= Color(205, 205, 230)

ITEM.Model 				= Model("models/tnb/weapons/w_nagant.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_SECONDARY}

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_nagant",
		Model = "models/tnb/weapons/w_nagant.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the Nagant M1895.",
		Width = 2,
		Height = 1
	},
	SD = {
		WeaponClass = "eternity_firearm_nagant_sd",
		Model = "models/tnb/weapons/w_nagant.mdl",
		Skin = 0,
		Bodygroups = {[1] = 1},
		Title = "SD",
		Cost = 2,
		Refund = 1,
		Description = "Attaches a suppressor to the weapon's frame.",
		Width = 3,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_32acp"] = true
}

return ITEM