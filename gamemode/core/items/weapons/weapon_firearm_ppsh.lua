ITEM = class.Create("base_weapon")

ITEM.Name 				= "PPSh-41"
ITEM.Description 		= "A Soviet-era submachinegun, that suffers terrible recoil but can field 71 rounds of common rounds at a very-very fast rate. \n\n Chambered in 9×19mm."
ITEM.OutlineColor		= Color(205, 205, 230)

ITEM.Model 				= Model("models/tnb/weapons/w_ppsh.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}


ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_ppsh",
		Model = "models/tnb/weapons/w_ppsh.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the PPSh-41.",
		Width = 2,
		Height = 2
	}
}

ITEM.AmmoTypes 			= {
	["ammo_9x19mm"] = true
}

return ITEM