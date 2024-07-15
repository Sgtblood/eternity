ITEM = class.Create("base_consumable")

ITEM.Name                = "Cool Freeze Water"
ITEM.Description         = "A bottle of water, might be cold."
ITEM.Model               = Model("models/props/cs_office/water_bottle.mdl")
ITEM.OutlineColor        = Color(145, 238, 168)

ITEM.Width               = 1
ITEM.Height              = 1
ITEM.ItemTags            = { "Food" }

ITEM.AllowSelf           = true
ITEM.AllowTarget         = false
ITEM.AllowSelfMessage    = "Drink"
ITEM.AllowTargetMessage  = ""

ITEM.License             = LICENSE_FOOD
ITEM.UnitPrice           = 10
ITEM.SellPrice           = 5

ITEM.MaximumCharges      = 1
ITEM.RemainingChargeText = false

ITEM.HungerRestore       = 75

if SERVER then
	function ITEM:OnSelfUse(ply, final)
		ply:SendChat("NOTICE", "You drink from the can.")
		ply:RestoreHunger(self.HungerRestore)
	end
	
	function ITEM:OnTargetUse(ply, target, final)
	end
end

return ITEM