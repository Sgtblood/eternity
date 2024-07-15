ITEM = class.Create("base_weapon")

ITEM.Name           = "M1911A1"
ITEM.Description    = "This handgun has seen multiple conflicts and has been a standard issue for the US Military for many decades. Widely used in other Law enforcement agencies, this tried and true handgun will stop any bad guy or ... thing in their path. Now, considered a relic from the past, you'll most likely find this handgun on a Fudd.\n\nChambered in .45 ACP."
ITEM.OutlineColor		= Color(205, 205, 230)

ITEM.Model          = Model("models/weapons/tfa_ins2/w_m1911.mdl")

ITEM.Width          = 1
ITEM.Height         = 2

ITEM.EquipmentSlots = {EQUIPMENT_SECONDARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 7800
ITEM.SellPrice          = 2000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_m1911",
		Model = "models/weapons/tfa_ins2/w_m1911.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 6,
		Description = "The base model of the M1911A1.",
		Width = 1,
		Height = 2
	}
}

ITEM.AmmoTypes 			= {
	["ammo_45acp"] = true
}

return ITEM
