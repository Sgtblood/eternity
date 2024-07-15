ITEM = class.Create("base_weapon")

ITEM.Name 				= "FB PM-63"
ITEM.Description 		= "A Polish submachine gun that translate to 'Cancer'. God speed. \n\n Chambered in 9×18mm."
ITEM.OutlineColor		= Color(205, 205, 230)

ITEM.Model 				= Model("models/tnb/weapons/w_pm63.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}


ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_pm63",
		Model = "models/tnb/weapons/w_pm63.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the PM-63.",
		Width = 2,
		Height = 2
	}
}

ITEM.AmmoTypes 			= {
	["ammo_9x18mm"] = true
}

return ITEM