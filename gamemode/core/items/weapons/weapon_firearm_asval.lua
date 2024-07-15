ITEM = class.Create("base_weapon")

ITEM.Name 				= "AS-VAL"
ITEM.Description 		= "A 1980's Soviet Assault Rifle designed for Asassinations. \n\n Chambered in 9×39mm."
ITEM.OutlineColor		= Color(205, 205, 230)

ITEM.Model 				= Model("models/weapons/tfa_ins2/w_asval.mdl")

ITEM.Width 				= 3
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}


ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_asval",
		Model = "models/weapons/tfa_ins2/w_asval.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the AS-VAL.",
		Width = 3,
		Height = 1
	}
}

ITEM.AmmoTypes 			= {
	["ammo_9x39mm"] = true
}

return ITEM