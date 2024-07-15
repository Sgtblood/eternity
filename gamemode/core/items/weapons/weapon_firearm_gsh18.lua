ITEM = class.Create("base_weapon")

ITEM.Name 				= "GSh-18"
ITEM.Description 		= "A 2000's Russian sidearm, that packs a punch.  \n\nChambered in 9x19mm."
ITEM.OutlineColor		= Color(12, 22, 125)

ITEM.Model 				= Model("models/weapons/w_gsh18.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_SECONDARY}

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_gsh18",
		Model = "models/weapons/w_gsh18.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 6,
		Description = "The base model of the GSh-18.",
		Width = 2,
		Height = 1
	}
}

ITEM.AmmoTypes 			= {
	["ammo_9x19mm"] = true
}

return ITEM