ITEM = class.Create("base_consumable")

ITEM.Name                = "Stir Fry"
ITEM.Description         = "A mix of various foods, stirred and fried together."
ITEM.Model               = Model("models/props_junk/garbage_takeoutcarton001a.mdl")
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

ITEM.HungerRestore       = 275

if SERVER then
	function ITEM:OnSelfUse(ply, final)
		ply:SendChat("NOTICE", "You consume the stir fry. It has a pleasant taste.")
		ply:RestoreHunger(self.HungerRestore)
	end
	
	function ITEM:OnTargetUse(ply, target, final)
	end
end

return ITEM