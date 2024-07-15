ITEM = class.Create("base_weapon")

ITEM.Name 				= "M1918 Browning Automatic Rifle"
ITEM.Description 		= "A WW1 Era Machinegun that continues to prove deadly effective. \n\nChambered in .303 British."
ITEM.OutlineColor		= Color(205, 205, 230)

ITEM.Model 				= Model("models/tnb/weapons/w_bar.mdl")

ITEM.Width 				= 4
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}


ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_bar",
		Model = "models/tnb/weapons/w_bar.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "An M1918 Browning Automatic Rifle.",
		Width = 4,
		Height = 2
	}
}

ITEM.AmmoTypes 			= {
	["ammo_303british"] = true
}

return ITEM