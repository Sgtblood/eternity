ITEM = class.Create("base_weapon")

ITEM.Name 				= "AK-107"
ITEM.Description 		= "A 1990's Soviet Assault Rifle. \n\nChambered in 5.45×39mm."
ITEM.OutlineColor		= Color(205, 205, 230)

ITEM.Model 				= Model("models/tnb/weapons/w_ak107.mdl")

ITEM.Width 				= 4
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}


ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_ak107",
		Model = "models/tnb/weapons/w_ak107.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the AK-107.",
		Width = 4,
		Height = 2
	}
}

ITEM.AmmoTypes 			= {
	["ammo_545x39mm"] = true
}

return ITEM