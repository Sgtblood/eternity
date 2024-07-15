ITEM = class.Create("base_ammo")

ITEM.Name        = "Shotgun Ammunition"
ITEM.Description = "12 gauge buckshot round for civilian and military shotguns.\n\n200 shells per box."
ITEM.Model       = Model("models/Items/BoxBuckshot.mdl")
ITEM.MaxStack    = 200
ITEM.AmmoGroup   = "Shotgun"

ITEM.License     = LICENSE_BLACKMARKET
ITEM.UnitPrice   = 2
ITEM.SellPrice   = 0

return ITEM