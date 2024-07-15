ITEM = class.Create("base_weapon")

ITEM.Name 				= "AK-47"
ITEM.Description 		= "An iconic Soviet Assault Rifle created in the 1940's that bolsters awesome stopping power and reliability. \n\nChambered primarily in 7.62x39mm."
ITEM.OutlineColor		= Color(205, 205, 230)

ITEM.Model 				= Model("models/weapons/tfa_cod/mwr/w_ak47.mdl")

ITEM.Width 				= 4
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 45000
ITEM.SellPrice          = 7500

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_ak47",
		Model = "models/weapons/tfa_cod/mwr/w_ak47.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the AK-47.",
		Width = 4,
		Height = 2
	}
}

ITEM.AmmoTypes 			= {
	["ammo_762x39mm"] = true
}

return ITEM