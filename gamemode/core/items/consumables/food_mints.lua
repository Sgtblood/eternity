ITEM = class.Create("base_consumable")

ITEM.Name                = "Mints"
ITEM.Description         = "A can of mints."
ITEM.Model               = Model("models/wick/wrbstalker/anomaly/items/wick_dev_mint.mdl")
ITEM.OutlineColor        = Color(145, 238, 168)

ITEM.Width               = 1
ITEM.Height              = 1
ITEM.ItemTags            = { "Food" }

ITEM.AllowSelf           = true
ITEM.AllowTarget         = false
ITEM.AllowSelfMessage    = "Eat"
ITEM.AllowTargetMessage  = ""

ITEM.License             = LICENSE_FOOD
ITEM.UnitPrice           = 35
ITEM.SellPrice           = 10

ITEM.MaximumCharges      = 5
ITEM.RemainingCharges    = 5
ITEM.RemainingChargeText = {
	One = "There is only %s remaining in the tin.",
	Other = "There are %s remaining in the tin."
}

ITEM.HungerRestore       = 10

if SERVER then
	function ITEM:OnSelfUse(ply, final)
		ply:RestoreHunger(self.HungerRestore)

		if final then
			ply:SendChat("NOTICE", "You enjoy the last mint from the tin.")
		else
			ply:SendChat("NOTICE", "You enjoy a mint from the tin.")
		end
	end
	
	function ITEM:OnTargetUse(ply, target, final)
	end
end

return ITEM