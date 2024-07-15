ITEM = class.Create("base_consumable")

ITEM.Name                = "Emergency Surgical Kit"
ITEM.Description         = "A complex kit consisting of bandages, tweezers, and some other essentials. Mass produced by the Combine."

ITEM.Model               = Model("models/carlsmei/escapefromtarkov/medical/core_medical_surgical_kit.mdl")
ITEM.OutlineColor        = Color(144, 238, 238)

ITEM.Width               = 2
ITEM.Height              = 2
ITEM.ItemTags            = { "Medical" }

ITEM.AllowSelf           = true
ITEM.AllowTarget         = true
ITEM.AllowSelfMessage    = "Heal Self"
ITEM.AllowTargetMessage  = "Heal %s"

ITEM.License             = LICENSE_MEDICAL
ITEM.UnitPrice           = 500
ITEM.SellPrice           = 300

ITEM.MaximumCharges      = 3
ITEM.RemainingCharges    = 3
ITEM.RemainingChargeText = {
	One   = "Only enough for %s more.",
	Other = "Enough to help %s victims."
}

ITEM.HealthRestore       = 65

if SERVER then
	function ITEM:OnSelfUse(ply, final)
		ply:GiveHealth(self.HealthRestore)

		if final then
			ply:SendChat("NOTICE", "You open the surgical kit and use the last of its contents.")
		else
			ply:SendChat("NOTICE", "You open the surgical kit and treat your wounds.")
		end
	end
	
	function ITEM:OnTargetUse(ply, target, final)
		target:GiveHealth(self.HealthRestore)

		if final then
			ply:VisibleMessage(string.format("%s uses the last of their trauma kit to treat %s's wounds.", ply:VisibleRPName(), target:VisibleRPName()))
		else
			ply:VisibleMessage(string.format("%s uses a trauma kit to treat %s's wounds.", ply:VisibleRPName(), target:VisibleRPName()))
		end
	end
end

return ITEM
