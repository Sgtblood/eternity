ITEM = class.Create("base_consumable")

ITEM.Name                = "IFAK"
ITEM.Description         = "An essential kit packed with everything an aspiring combat surgeon could want."

ITEM.Model               = Model("models/illusion/eftcontainers/ifak.mdl")
ITEM.OutlineColor        = Color(144, 238, 238)

ITEM.Width               = 1
ITEM.Height              = 2
ITEM.ItemTags            = { "Medical" }

ITEM.AllowSelf           = true
ITEM.AllowTarget         = true
ITEM.AllowSelfMessage    = "Heal Self"
ITEM.AllowTargetMessage  = "Heal %s"

ITEM.License             = LICENSE_GREYMARKET
ITEM.UnitPrice           = 1000
ITEM.SellPrice           = 200

ITEM.MaximumCharges      = 1
ITEM.RemainingChargeText = false

ITEM.HealthRestore       = 85

if SERVER then
	function ITEM:OnSelfUse(ply, final)
		ply:SendChat("NOTICE", "You open the IFAK and treat your wounds.")
		ply:GiveHealth(self.HealthRestore)
	end
	
	function ITEM:OnTargetUse(ply, target, final)
		ply:VisibleMessage(string.format("%s uses an IFAK to treat %s's wounds.", ply:VisibleRPName(), target:VisibleRPName()))
		target:GiveHealth(self.HealthRestore)
	end
end

return ITEM
