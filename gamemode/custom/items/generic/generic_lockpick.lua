ITEM = class.Create("base_weapon")

ITEM.Name 				= "Lockpick"
ITEM.Description 		= "A lockpick that unlocks most non-combine locks if used correctly."
ITEM.OutlineColor		= Color(240, 190, 0)

ITEM.Model 				= Model("models/custom/lockpick2.mdl")

ITEM.Width 				= 1
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_MISC}

ITEM.License 			= LICENSE_GREYMARKET
ITEM.UnitPrice          = 600
ITEM.SellPrice          = 275

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_lockpick",
		Model = "models/custom/lockpick2.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the Lockpick.",
		Width = 1,
		Height = 6
	},
}


ITEM.AmmoTypes 			= { }

return ITEM
