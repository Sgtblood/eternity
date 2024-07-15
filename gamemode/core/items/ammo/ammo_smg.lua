ITEM = class.Create("base_ammo")

ITEM.Name        = "Submachine Gun Ammunition"
ITEM.Description = "Small caliber rounds used in various submachineguns."
ITEM.Model       = Model("models/Items/BoxSRounds.mdl")
ITEM.MaxStack    = 500
ITEM.AmmoGroup   = "smg"

ITEM.License     = LICENSE_BLACKMARKET
ITEM.UnitPrice   = 3
ITEM.SellPrice   = 0

return ITEM