ITEM = class.Create("base_ammo")

ITEM.Name        = "Rifle Ammunition"
ITEM.Description = "Standard caliber rounds used in rifles and various magazine fed weapons."
ITEM.Model       = Model("models/Items/BoxMRounds.mdl")
ITEM.MaxStack    = 500
ITEM.AmmoGroup   = "Rifle"

ITEM.License     = LICENSE_BLACKMARKET
ITEM.UnitPrice   = 5
ITEM.SellPrice   = 0

return ITEM