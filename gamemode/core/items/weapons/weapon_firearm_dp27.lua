ITEM = class.Create("base_weapon")

ITEM.Name 				= "DP27"
ITEM.Description 		= "A 1928 LMG that offers reliable accuracy at the cost of unreliable jamming. \n\nChambered in 7.62×54mmR."
ITEM.OutlineColor		= Color(205, 205, 230)

ITEM.Model 				= Model("models/tnb/weapons/w_dp27.mdl")

ITEM.Width 				= 4
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}


ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_dp27",
		Model = "models/tnb/weapons/w_dp27.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the DP27.",
		Width = 4,
		Height = 2
	}
}

ITEM.AmmoTypes 			= {
	["ammo_rifle"] = true
}

return ITEM