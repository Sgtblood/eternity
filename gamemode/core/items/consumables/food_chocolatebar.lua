ITEM = class.Create("base_consumable")

ITEM.Name                = "Flour"
ITEM.Description         = "A bag of Russian Flour. Can be cooked into some bread."
ITEM.Model               = Model("models/hls/hawke/bag_flour_1.mdl")
ITEM.OutlineColor        = Color(145, 238, 168)

ITEM.Width               = 2
ITEM.Height              = 2
ITEM.ItemTags            = { "Food" }

ITEM.AllowSelf           = true
ITEM.AllowTarget         = false
ITEM.AllowSelfMessage    = "Eat"
ITEM.AllowTargetMessage  = ""

ITEM.License             = LICENSE_FOOD
ITEM.UnitPrice           = 5
ITEM.SellPrice           = 3

ITEM.MaximumCharges      = 1
ITEM.RemainingChargeText = false

ITEM.HungerRestore       = 25

if SERVER then
	function ITEM:OnSelfUse(ply, final)
		ply:SendChat("NOTICE", "You open the package and eat from it.")
		ply:RestoreHunger(self.HungerRestore)
	end
	
	function ITEM:OnTargetUse(ply, target, final)
	end
end

return ITEM