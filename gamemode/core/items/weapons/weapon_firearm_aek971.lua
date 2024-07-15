ITEM = class.Create("base_weapon")

ITEM.Name 				= "AEK-971"
ITEM.Description 		= "A 1980's Soviet Rifle that offers reliable accuracy even in full automatic fire.\n\nChambered primarily in 5.45×39mm."
ITEM.OutlineColor		= Color(205, 205, 230)

ITEM.Model 				= Model("models/tnb/weapons/w_aek.mdl")

ITEM.Width 				= 4
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 42500
ITEM.SellPrice          = 7500

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_aek971",
		Model = "models/tnb/weapons/w_aek.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the AEK-971.",
		Width = 4,
		Height = 2
	}
}

ITEM.AmmoTypes 			= {
	["ammo_545x39mm"] = true
}

return ITEM