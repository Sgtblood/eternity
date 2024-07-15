ITEM = class.Create("base_weapon")

ITEM.Name 				= "FN-FAL"
ITEM.Description 		= "A Belgium Battle Rifle that excels at taking out targets with precise shots. \n\n Chambered in 7.62×51mm."
ITEM.OutlineColor		= Color(205, 205, 230)

ITEM.Model 				= Model("models/tnb/weapons/w_fal.mdl")

ITEM.Width 				= 4
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}


ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_fal",
		Model = "models/tnb/weapons/w_fal.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the FN-FAL.",
		Width = 4,
		Height = 2
	}
}

ITEM.AmmoTypes 			= {
	["ammo_762x51mm"] = true
}

return ITEM