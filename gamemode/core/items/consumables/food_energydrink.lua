ITEM = class.Create("base_consumable")

ITEM.Name                = "Energy Drink"
ITEM.Description         = "An overflavored drink packed full of sugar."
ITEM.Model               = Model("models/illusion/eftcontainers/hotrod.mdl")
ITEM.OutlineColor        = Color(145, 238, 168)

ITEM.Width               = 1
ITEM.Height              = 1
ITEM.ItemTags            = { "Food" }

ITEM.AllowSelf           = true
ITEM.AllowTarget         = false
ITEM.AllowSelfMessage    = "Drink"
ITEM.AllowTargetMessage  = ""

ITEM.License             = LICENSE_GREYMARKET
ITEM.UnitPrice           = 50
ITEM.SellPrice           = 25

ITEM.MaximumCharges      = 1
ITEM.RemainingChargeText = false

ITEM.HungerRestore       = 200

if SERVER then
	function ITEM:OnSelfUse(ply, final)
		ply:SendChat("NOTICE", "You drink from the can.")
		ply:RestoreHunger(self.HungerRestore)
	end
	
	function ITEM:OnTargetUse(ply, target, final)
	end
end

return ITEM