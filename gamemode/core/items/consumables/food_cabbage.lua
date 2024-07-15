ITEM = class.Create("base_consumable")

ITEM.Name                = "Cabbage"
ITEM.Description         = "A naturally grown bundle of vegetation."
ITEM.Model               = Model("models/props_hla/food/cabbage.mdl")
ITEM.OutlineColor        = Color(145, 238, 168)

ITEM.Width               = 1
ITEM.Height              = 1
ITEM.ItemTags            = { "Food" }

ITEM.AllowSelf           = true
ITEM.AllowTarget         = false
ITEM.AllowSelfMessage    = "Eat"
ITEM.AllowTargetMessage  = ""

ITEM.License             = LICENSE_FOOD
ITEM.UnitPrice           = 25
ITEM.SellPrice           = 10

ITEM.MaximumCharges      = 1
ITEM.RemainingChargeText = false

ITEM.HungerRestore       = 150

if SERVER then
	function ITEM:OnSelfUse(ply, final)
		ply:SendChat("NOTICE", "You break the plastic seal around the cabbage and eat it.")
		ply:RestoreHunger(self.HungerRestore)
	end
	
	function ITEM:OnTargetUse(ply, target, final)
	end
end

return ITEM