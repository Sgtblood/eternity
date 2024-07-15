ITEM = class.Create("base_consumable")

ITEM.Name                = "Dog Food"
ITEM.Description         = "It's not much, but it's edible. Fishy."
ITEM.Model               = Model("models/illusion/eftcontainers/dogfood.mdl")
ITEM.Skin                = 1
ITEM.OutlineColor        = Color(145, 238, 168)

ITEM.Width               = 1
ITEM.Height              = 1
ITEM.ItemTags            = { "Food" }

ITEM.AllowSelf           = true
ITEM.AllowTarget         = false
ITEM.AllowSelfMessage    = "Eat"
ITEM.AllowTargetMessage  = ""

ITEM.License             = LICENSE_FOOD
ITEM.UnitPrice           = 10
ITEM.SellPrice           = 5

ITEM.MaximumCharges      = 1
ITEM.RemainingChargeText = false

ITEM.HungerRestore       = 25

if SERVER then
	function ITEM:OnSelfUse(ply, final)
		ply:SendChat("NOTICE", "You... eat from the can of dog food.")
		ply:RestoreHunger(self.HungerRestore)
	end
	
	function ITEM:OnTargetUse(ply, target, final)
	end
end

return ITEM