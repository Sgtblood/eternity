ITEM = class.Create("base_consumable")

ITEM.Name                = "Pain Medication"
ITEM.Description         = "A small prescription bottle with some pain medication."

ITEM.Model               = Model("models/props_hla/lab/pill_bottle2.mdl")
ITEM.OutlineColor        = Color(144, 238, 238)

ITEM.Width               = 1
ITEM.Height              = 1
ITEM.ItemTags            = { "Medical" }

ITEM.AllowSelf           = true
ITEM.AllowTarget         = false
ITEM.AllowSelfMessage    = "Ingest"
ITEM.AllowTargetMessage  = ""

ITEM.License             = LICENSE_MEDICAL
ITEM.UnitPrice           = 125
ITEM.SellPrice           = 50

ITEM.MaximumCharges      = 3
ITEM.RemainingCharges    = 3
ITEM.RemainingChargeText = {
	One   = "This is %s pill left.",
	Other = "There are %s pills left."
}

ITEM.HealthRestore       = 10

if SERVER then
	function ITEM:OnSelfUse(ply, final)
		ply:GiveHealth(self.HealthRestore)

		if final then
			ply:SendChat("NOTICE", "You take the last pill from the bottle and discard the remains.")
		else
			ply:SendChat("NOTICE", "You take a pill from the bottle and swallow it whole.")
		end
	end
	
	function ITEM:OnTargetUse(ply, target, final)
	end
end

return ITEM
