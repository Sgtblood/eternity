ITEM = class.Create("base_weapon")

ITEM.Name 				= "SKS"
ITEM.Description 		= "A reliable Soviet marksman rifle. \n\n Chambered in 7.62×39mm."
ITEM.OutlineColor		= Color(205, 205, 230)

ITEM.Model 				= Model("models/tnb/weapons/w_sks.mdl")

ITEM.Width 				= 4
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}


ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_sks",
		Model = "models/tnb/weapons/w_sks.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the SKS.",
		Width = 4,
		Height = 2
	}
}

ITEM.AmmoTypes 			= {
	["ammo_762x39mm"] = true
}

return ITEM