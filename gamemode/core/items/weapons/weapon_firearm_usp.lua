ITEM = class.Create("base_weapon")

ITEM.Name           = "Heckler & Koch USP"
ITEM.Description    = "A reliable German Handgun, capable of using various ammo types. \n\nChambered in .45 ACP."
ITEM.OutlineColor		= Color(205, 205, 230)

ITEM.Model          = Model("models/tnb/weapons/w_usp.mdl")

ITEM.Width          = 1
ITEM.Height         = 2

ITEM.EquipmentSlots = {EQUIPMENT_SECONDARY}


ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_usp",
		Model = "models/tnb/weapons/w_usp.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 6,
		Description = "The base model of the USP.",
		Width = 1,
		Height = 2
	}
}

ITEM.AmmoTypes 			= {
	["ammo_45acp"] = true,
	["ammo_9x19mm"] = true
}

return ITEM
