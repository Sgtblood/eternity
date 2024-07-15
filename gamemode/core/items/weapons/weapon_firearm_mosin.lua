ITEM = class.Create("base_weapon")

ITEM.Name 				= "Mosin-Nagant"
ITEM.Description 		= "One of the most damn reliable rifles you'll ever find. \n\nChambered in 7.62×54mmR."
ITEM.OutlineColor		= Color(205, 205, 230)

ITEM.Model 				= Model("models/weapons/w_ins2_mosin_nagant.mdl")

ITEM.Width 				= 5
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}


ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_mosin",
		Model = "models/weapons/w_ins2_mosin_nagant.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the Mosin-Nagant.",
		Width = 5,
		Height = 1
	}
}

ITEM.AmmoTypes 			= {
	["ammo_rifle"] = true
}

return ITEM