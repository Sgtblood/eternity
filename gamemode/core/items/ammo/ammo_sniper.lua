ITEM = class.Create("base_ammo")

ITEM.Name        = "Sniper Ammunition"
ITEM.Description = "Higher caliber rounds for bolt action and semi auto sniper rifles."
ITEM.Model       = Model("models/Items/357ammo.mdl")
ITEM.MaxStack    = 80
ITEM.AmmoGroup   = "Sniper"

ITEM.License     = LICENSE_BLACKMARKET
ITEM.UnitPrice   = 12
ITEM.SellPrice   = 0

return ITEM