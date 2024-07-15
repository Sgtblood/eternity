ITEM = class.Create("base_weapon")

ITEM.Name 				= "AK-74"
ITEM.Description 		= "A improved version of the AKM, that bolsters mobility and general improvements. \n\nChambered primarily in 5.45x39mm."
ITEM.OutlineColor		= Color(205, 205, 230)

ITEM.Model 				= Model("models/tnb/weapons/w_ak74.mdl")

ITEM.Width 				= 3
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}


ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_ak74",
		Model = "models/tnb/weapons/w_ak74.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the AK-74.",
		Width = 3,
		Height = 2
	}
}

ITEM.AmmoTypes 			= {
	["ammo_545x39mm"] = true
}

return ITEM