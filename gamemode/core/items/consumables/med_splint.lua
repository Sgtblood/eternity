ITEM = class.Create("base_consumable")

ITEM.Name                = "Splint"
ITEM.Description         = "A sturdy splint for a broken body."

ITEM.Model               = Model("models/carlsmei/escapefromtarkov/medical/alusplint.mdl")
ITEM.OutlineColor        = Color(121, 218, 238)

ITEM.Width               = 1
ITEM.Height              = 1
ITEM.ItemTags            = { "Medical" }

ITEM.AllowSelf           = true
ITEM.AllowTarget         = true
ITEM.AllowSelfMessage    = "Heal Self"
ITEM.AllowTargetMessage  = "Heal %s"

ITEM.License             = LICENSE_MEDICAL
ITEM.UnitPrice           = 300
ITEM.SellPrice           = 100

ITEM.MaximumCharges      = 1
ITEM.RemainingChargeText = false

ITEM.HealthRestore       = 30

if SERVER then
	function ITEM:OnSelfUse(ply, final)
		ply:SendChat("NOTICE", "You use the splint and treat the limb.")
		ply:GiveHealth(self.HealthRestore)
	end
	
	function ITEM:OnTargetUse(ply, target, final)
		ply:VisibleMessage(string.format("%s uses a splint to treat %s.", ply:VisibleRPName(), target:VisibleRPName()))
		target:GiveHealth(self.HealthRestore)
	end
end

return ITEM
