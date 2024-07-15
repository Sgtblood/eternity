ITEM = class.Create("base_consumable")

ITEM.Name                = "Pear"
ITEM.Description         = "A healthy snack."
ITEM.Model               = Model("models/uu_branded/bioshockinfinite/hext_pear.mdl")
ITEM.OutlineColor        = Color(145, 238, 168)

ITEM.Width               = 1
ITEM.Height              = 1
ITEM.ItemTags            = { "Food" }

ITEM.AllowSelf           = true
ITEM.AllowTarget         = false
ITEM.AllowSelfMessage    = "Eat"
ITEM.AllowTargetMessage  = ""

ITEM.License             = LICENSE_FOOD
ITEM.UnitPrice           = 20
ITEM.SellPrice           = 10

ITEM.MaximumCharges      = 1
ITEM.RemainingChargeText = false

ITEM.HungerRestore       = 75

if SERVER then
	function ITEM:OnSelfUse(ply, final)
		ply:SendChat("NOTICE", "You enjoy a healthy snack.")
		ply:RestoreHunger(self.HungerRestore)
	end
	
	function ITEM:OnTargetUse(ply, target, final)
	end
end

return ITEM