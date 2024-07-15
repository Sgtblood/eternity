ITEM = class.Create("base_consumable")

ITEM.Name                = "Emergency Bandage"
ITEM.Description         = "A well designed bandage designed for trauma and hemmorage control."

ITEM.Model               = Model("models/illusion/eftcontainers/bandage.mdl")
ITEM.OutlineColor        = Color(144, 238, 238)

ITEM.Width               = 1
ITEM.Height              = 1
ITEM.ItemTags            = { "Medical" }

ITEM.AllowSelf           = true
ITEM.AllowTarget         = true
ITEM.AllowSelfMessage    = "Bandage Self"
ITEM.AllowTargetMessage  = "Bandage %s"

ITEM.License             = LICENSE_MEDICAL
ITEM.UnitPrice           = 30
ITEM.SellPrice           = 25

ITEM.MaximumCharges      = 1
ITEM.RemainingChargeText = false

ITEM.HealthRestore       = 15

if SERVER then
	function ITEM:OnSelfUse(ply, final)
		ply:SendChat("NOTICE", "You bandage your wounds and stop any bleeding.")
		ply:GiveHealth(self.HealthRestore)
	end
	
	function ITEM:OnTargetUse(ply, target, final)
		ply:VisibleMessage(string.format("%s bandages %s's wounds and stops any bleeding.", ply:VisibleRPName(), target:VisibleRPName()))
		target:GiveHealth(self.HealthRestore)
	end
end

return ITEM
