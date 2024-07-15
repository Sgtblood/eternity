ITEM = class.Create("base_weapon")

ITEM.Name 				= "Heckler & Koch MP5"
ITEM.Description 		= "A German submachinegun from the 1960's, that offers reliable accuracy and damage.  \n\nChambered in 9x19mm."
ITEM.OutlineColor		= Color(205, 205, 230)

ITEM.Model 				= Model("models/weapons/w_inss2_mp5a5.mdl")

ITEM.Width 				= 3
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}


ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_mp5",
		Model = "models/weapons/w_inss2_mp5a5.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the MP5.",
		Width = 3,
		Height = 2
	}
}

ITEM.AmmoTypes 			= {
	["ammo_9x19mm"] = true
}

return ITEM