ITEM = class.Create("base_weapon")

ITEM.Name 				= ".38 Special Revolver"
ITEM.Description 		= "A 1898 revovler designed by the Smith & Wesson, know for it reliability. \n\nChambered in .38 ACP."
ITEM.OutlineColor		= Color(12, 22, 125)

ITEM.Model 				= Model("models/tnb/weapons/w_38.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_SECONDARY}

ITEM.License 			= LICENSE_GREYMARKET
ITEM.UnitPrice          = 8000
ITEM.SellPrice          = 1250

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_38",
		Model = "models/tnb/weapons/w_38.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 6,
		Description = "The base model of the .38 Revolver.",
		Width = 2,
		Height = 1
	}
}

ITEM.AmmoTypes 			= {
	["ammo_38special"] = true
}

return ITEM