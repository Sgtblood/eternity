ITEM = class.Create("base_weapon")

ITEM.Name 				= "Fort-12"
ITEM.Description 		= "A Ukrainian sidearm, favored by security forces during the 1990's.  \n\nChambered in 9x18mm."
ITEM.OutlineColor		= Color(12, 22, 125)

ITEM.Model 				= Model("models/tnb/weapons/w_fort.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_SECONDARY}

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_fort12",
		Model = "models/tnb/weapons/w_fort.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 6,
		Description = "The base model of the Fort-12",
		Width = 2,
		Height = 1
	}
}

ITEM.AmmoTypes 			= {
	["ammo_9x18mm"] = true
}

return ITEM