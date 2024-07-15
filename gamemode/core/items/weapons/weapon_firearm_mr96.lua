ITEM = class.Create("base_weapon")

ITEM.Name 				= "MR96"
ITEM.Description 		= "A French Revolver capable offering modularity in ammunition use. \n\n Chambered in .357 Magnum."
ITEM.OutlineColor		= Color(205, 205, 230)

ITEM.Model 				= Model("models/weapons/w_ins2_revolver_mr96.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_SECONDARY}

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_mr96",
		Model = "models/weapons/w_ins2_revolver_mr96.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 6,
		Description = "The base model of the MR96.",
		Width = 2,
		Height = 2
	}
}

ITEM.AmmoTypes 			= {
	["ammo_357magnum"] = true,
	["ammo_38special"] = true,
	["ammo_9x19mm"] = true
}

return ITEM