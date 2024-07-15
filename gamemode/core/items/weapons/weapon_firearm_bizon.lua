ITEM = class.Create("base_weapon")

ITEM.Name 				= "PP-19 Bizon"
ITEM.Description 		= "A 1990's Soviet Counter-Terrorism submachinegun that boasts fast and accurate close range fire. \n\nChambered in 9x18mm."
ITEM.OutlineColor		= Color(205, 205, 230)

ITEM.Model 				= Model("models/tnb/weapons/w_bizon.mdl")

ITEM.Width 				= 3
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}


ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_bizon",
		Model = "models/tnb/weapons/w_bizon.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the PP-19 Bizon.",
		Width = 3,
		Height = 1
	}
}

ITEM.AmmoTypes 			= {
	["ammo_9x18mm"] = true,
	["ammo_9x19mm"] = true
}
return ITEM