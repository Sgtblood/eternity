ITEM = class.Create("base_consumable")

ITEM.Name                = "Large Bread Loaf"
ITEM.Description         = "A large loaf of freshly cooked bread."
ITEM.Model               = Model("models/props_hla/food/bread.mdl")
ITEM.OutlineColor        = Color(145, 238, 168)

ITEM.Width               = 1
ITEM.Height              = 1
ITEM.ItemTags            = { "Food" }

ITEM.AllowSelf           = true
ITEM.AllowTarget         = false
ITEM.AllowSelfMessage    = "Eat"
ITEM.AllowTargetMessage  = ""

ITEM.License             = LICENSE_FOOD
ITEM.UnitPrice           = 200
ITEM.SellPrice           = 50

ITEM.MaximumCharges      = 1
ITEM.RemainingChargeText = false

ITEM.HungerRestore       = 200

if SERVER then
	function ITEM:OnSelfUse(ply, final)
		ply:SendChat("NOTICE", "You munch on the loaf of bread. It's delicious.")
		ply:RestoreHunger(self.HungerRestore)
	end
	
	function ITEM:OnTargetUse(ply, target, final)
	end
end

return ITEM