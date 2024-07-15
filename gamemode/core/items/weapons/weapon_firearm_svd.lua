ITEM = class.Create("base_weapon")

ITEM.Name 				= "SVD"
ITEM.Description 		= "A Russian marksman sniper with very high penetration power. \n\n Chambered in 7.62×54mmR."
ITEM.OutlineColor		= Color(205, 205, 230)

ITEM.Model 				= Model("models/tnb/weapons/w_svd.mdl")

ITEM.Width 				= 5
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}


ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_svd",
		Model = "models/tnb/weapons/w_svd.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the SVU.",
		Width = 5,
		Height = 2
	}
}

ITEM.AmmoTypes 			= {
	["ammo_sniper"] = true
}

return ITEM