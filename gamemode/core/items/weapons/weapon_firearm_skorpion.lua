ITEM = class.Create("base_weapon")

ITEM.Name 				= "Škorpion vz. 61"
ITEM.Description 		= "Czechoslovak machine pistol developed in 1959 that offer's mobility and control. \n\n Chambered in .32 ACP."
ITEM.OutlineColor		= Color(205, 205, 230)

ITEM.Model 				= Model("models/tnb/weapons/w_skorpion.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_SECONDARY}


ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_skorpion",
		Model = "models/tnb/weapons/w_skorpion.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the Skorpion.",
		Width = 2,
		Height = 1
	}
}

ITEM.AmmoTypes 			= {
	["ammo_32acp"] = true
}

return ITEM