ITEM = class.Create("base_ammo")

ITEM.Name        = "Pistol Ammunition"
ITEM.Description = "Small caliber rounds used in various sidearms."
ITEM.Model       = Model("models/Items/BoxSRounds.mdl")
ITEM.MaxStack    = 500
ITEM.AmmoGroup   = "Pistol"

ITEM.License     = LICENSE_BLACKMARKET
ITEM.UnitPrice   = 1
ITEM.SellPrice   = 0

return ITEM