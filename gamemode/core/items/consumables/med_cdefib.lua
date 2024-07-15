ITEM = class.Create("base_consumable")

ITEM.Name                = "Combine Defibrillator"
ITEM.Description         = "A Modernized and High-Technological device that can read various vital signs. Holds 3 charges."

ITEM.Model               = Model("models/w_models/weapons/w_eq_defibrillator.mdl")
ITEM.OutlineColor        = Color(144, 238, 238)

ITEM.Width               = 2
ITEM.Height              = 2
ITEM.ItemTags            = { "Medical" }

ITEM.AllowSelf           = false
ITEM.AllowTarget         = true
ITEM.AllowSelfMessage    = ""
ITEM.AllowTargetMessage  = "Defibrillate %s"

ITEM.MaximumCharges      = 3
ITEM.RemainingChargeText = false

ITEM.HealthRestore       = 100

if SERVER then
	function ITEM:OnSelfUse(ply, final)
	end
	
	function ITEM:OnTargetUse(ply, target, final)
		ply:VisibleMessage(string.format("%s uses an emergency defibrillator on %s.", ply:VisibleRPName(), target:VisibleRPName()))
		target:GiveHealth(self.HealthRestore)
	end
end

return ITEM
