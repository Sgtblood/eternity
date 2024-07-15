ITEM = class.Create("base_weapon")

ITEM.Name 				= ".357 Magnum"
ITEM.Description 		= "A Revolver capable of punching the toughest armor. \n\nChambered in .357 Magnum."
ITEM.OutlineColor		= Color(205, 205, 230)

ITEM.Model 				= Model("models/tnb/weapons/w_magnum.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_SECONDARY}

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_magnum",
		Model = "models/tnb/weapons/w_magnum.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 6,
		Description = "The base model of the .357 Magnum.",
		Width = 2,
		Height = 2
	}
}

ITEM.AmmoTypes 			= {
	["ammo_357magnum"] = true
}

return ITEM