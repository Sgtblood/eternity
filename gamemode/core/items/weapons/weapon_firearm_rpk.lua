ITEM = class.Create("base_weapon")

ITEM.Name 				= "RPK"
ITEM.Description 		= "A Soviet LMG, that can support very large drums. \n\n Chambered in 7.62x39mm."
ITEM.OutlineColor		= Color(205, 205, 230)

ITEM.Model 				= Model("models/weapons/w_ins2_rpk_74m.mdl")

ITEM.Width 				= 5
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 67500
ITEM.SellPrice          = 7500

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_rpk",
		Model = "models/weapons/w_ins2_rpk_74m.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the RPK.",
		Width = 5,
		Height = 2
	}
}

ITEM.AmmoTypes 			= {
	["ammo_762x39mm"] = true
}

return ITEM