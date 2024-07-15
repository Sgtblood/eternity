ITEM = class.Create("base_weapon")

ITEM.Name 				= "Spectre M4"
ITEM.Description 		= "Italtian submachinegun. \n\n Chambered in 9x19mm."
ITEM.OutlineColor		= Color(205, 205, 230)

ITEM.Model 				= Model("models/weapons/tfa_ins2/w_spectre.mdl")

ITEM.Width 				= 3
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}


ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_spectre",
		Model = "models/weapons/tfa_ins2/w_spectre.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the Spectre.",
		Width = 3,
		Height = 2
	}
}

ITEM.AmmoTypes 			= {
	["ammo_9x19mm"] = true
}

return ITEM