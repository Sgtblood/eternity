ITEM = class.Create("base_weapon")

ITEM.Name 				= "SR-2 Veresk"
ITEM.Description 		= "A Russian favored submachinegun with high armor penetration capabilities. \n\n Chambered in 9x21mm."
ITEM.OutlineColor		= Color(205, 205, 230)

ITEM.Model 				= Model("models/weapons/w_ins2_sr2m_veresk.mdl")

ITEM.Width 				= 3
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}


ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_sr2",
		Model = "models/weapons/w_ins2_sr2m_veresk.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the SR2.",
		Width = 3,
		Height = 2
	}
}

ITEM.AmmoTypes 			= {
	["ammo_smg"] = true
}

return ITEM