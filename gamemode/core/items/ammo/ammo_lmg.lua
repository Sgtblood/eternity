ITEM = class.Create("base_ammo")

ITEM.Name        = "Machine Gun Ammunition"
ITEM.Description = "Higher caliber rounds used by belt fed machineguns."
ITEM.Model       = Model("models/Items/BoxMRounds.mdl")
ITEM.MaxStack    = 1000
ITEM.AmmoGroup   = "MachineGun"

ITEM.License     = LICENSE_BLACKMARKET
ITEM.UnitPrice   = 6
ITEM.SellPrice   = 0

return ITEM