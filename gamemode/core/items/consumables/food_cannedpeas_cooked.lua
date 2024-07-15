ITEM = class.Create("base_consumable")

ITEM.Name                = "Cooked Peas"
ITEM.Description         = "An open, but cooked can of peas."
ITEM.Model               = Model("models/illusion/eftcontainers/peas.mdl")
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

ITEM.HungerRestore       = 175

if SERVER then
	function ITEM:OnSelfUse(ply, final)
		ply:SendChat("NOTICE", "You eat from the can. It's plenty filling.")
		ply:RestoreHunger(self.HungerRestore)
	end
	
	function ITEM:OnTargetUse(ply, target, final)
	end
end

return ITEM