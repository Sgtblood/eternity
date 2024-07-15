ITEM = class.Create("base_weapon")

ITEM.Name 				= "AK-74u"
ITEM.Description 		= "A improved version of the AK-74, that features a shorter barrel and lighter weight. \n\nChambered primarily in 5.45x39mm."
ITEM.OutlineColor		= Color(205, 205, 230)

ITEM.Model 				= Model("models/tnb/weapons/w_ak74u.mdl")

ITEM.Width 				= 3
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}


ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_ak74u",
		Model = "models/tnb/weapons/w_ak74u.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the AK-74u.",
		Width = 3,
		Height = 1
	}
}

ITEM.AmmoTypes 			= {
	["ammo_545x39mm"] = true
}

return ITEM