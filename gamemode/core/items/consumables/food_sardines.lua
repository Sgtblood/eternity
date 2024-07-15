ITEM = class.Create("base_consumable")

ITEM.Name                = "Sardine Substitution"
ITEM.Description         = "A recreation of an old world seafood."
ITEM.Model               = Model("models/uu_branded/bioshockinfinite/cardine_can_open.mdl")
ITEM.OutlineColor        = Color(145, 238, 168)

ITEM.Width               = 1
ITEM.Height              = 1
ITEM.ItemTags            = { "Food" }

ITEM.AllowSelf           = true
ITEM.AllowTarget         = false
ITEM.AllowSelfMessage    = "Eat"
ITEM.AllowTargetMessage  = ""

ITEM.License             = false
ITEM.UnitPrice           = 0
ITEM.SellPrice           = 0

ITEM.MaximumCharges      = 1
ITEM.RemainingChargeText = false

ITEM.HungerRestore       = 125

if SERVER then
	function ITEM:OnSelfUse(ply, final)
		ply:SendChat("NOTICE", "You break the seal and eat from the can.")
		ply:RestoreHunger(self.HungerRestore)
	end
	
	function ITEM:OnTargetUse(ply, target, final)
	end
end

return ITEM