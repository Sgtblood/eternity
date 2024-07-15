ITEM = class.Create("base_consumable")

ITEM.Name                = "First Aid Kit"
ITEM.Description         = "A simple kit consisting of bandages, tweezers, and some other essentials."

ITEM.Model               = Model("models/illusion/eftcontainers/carmedkit.mdl")
ITEM.OutlineColor        = Color(144, 238, 238)

ITEM.Width               = 1
ITEM.Height              = 1
ITEM.ItemTags            = { "Medical" }

ITEM.AllowSelf           = true
ITEM.AllowTarget         = true
ITEM.AllowSelfMessage    = "Heal Self"
ITEM.AllowTargetMessage  = "Heal %s"

ITEM.License             = LICENSE_GREYMARKET
ITEM.UnitPrice           = 600
ITEM.SellPrice           = 100

ITEM.MaximumCharges      = 1
ITEM.RemainingChargeText = false

ITEM.HealthRestore       = 40

if SERVER then
	function ITEM:OnSelfUse(ply, final)
		ply:SendChat("NOTICE", "You open the first-aid kit and treat your wounds.")
		ply:GiveHealth(self.HealthRestore)
	end
	
	function ITEM:OnTargetUse(ply, target, final)
		ply:VisibleMessage(string.format("%s uses a first-aid kit to treat %s's wounds.", ply:VisibleRPName(), target:VisibleRPName()))
		target:GiveHealth(self.HealthRestore)
	end
end

return ITEM
