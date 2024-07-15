ITEM = class.Create("base_consumable")

ITEM.Name                = "Uncooked Rat Meat"
ITEM.Description         = "A stringy, fatty piece of rat meat."
ITEM.Model               = Model("models/gibs/antlion_gib_small_2.mdl")
ITEM.Skin                = 1
ITEM.OutlineColor        = Color(145, 238, 168)

ITEM.Width               = 1
ITEM.Height              = 1
ITEM.ItemTags            = { "Food" }

ITEM.AllowSelf           = true
ITEM.AllowTarget         = false
ITEM.AllowSelfMessage    = "Eat"
ITEM.AllowTargetMessage  = ""

ITEM.License             = LICENSE_GREYMARKET
ITEM.UnitPrice           = 75
ITEM.SellPrice           = 0

ITEM.MaximumCharges      = 1
ITEM.RemainingChargeText = false

ITEM.HungerRestore       = 125

if SERVER then
	function ITEM:OnSelfUse(ply, final)
		ply:SendChat("NOTICE", "You consume the vile piece of uncooked Rat.")
		ply:RestoreHunger(self.HungerRestore)
	end
	
	function ITEM:OnTargetUse(ply, target, final)
	end
end

return ITEM