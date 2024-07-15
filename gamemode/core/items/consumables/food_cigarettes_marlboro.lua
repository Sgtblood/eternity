ITEM = class.Create("base_consumable")

ITEM.Name                = "Malboro Red Shorts"
ITEM.Description         = "A little, branded box of cigarettes."
ITEM.Model               = Model("models/wick/wrbstalker/anomaly/items/wick_drink_cigar0.mdl")
ITEM.OutlineColor        = Color(145, 238, 168)

ITEM.Width               = 1
ITEM.Height              = 1
ITEM.ItemTags            = { "Food" }

ITEM.AllowSelf           = true
ITEM.AllowTarget         = false
ITEM.AllowSelfMessage    = "Smoke"
ITEM.AllowTargetMessage  = ""

ITEM.License             = LICENSE_MISCGOODS
ITEM.UnitPrice           = 75
ITEM.SellPrice           = 15

ITEM.MaximumCharges      = 12
ITEM.RemainingCharges    = 12
ITEM.RemainingChargeText = {
	One = "There's %s left in the box.",
	Other = "There are %s left in the box."
}

ITEM.HungerRestore       = 5

if SERVER then
	function ITEM:OnSelfUse(ply, final)
		ply:RestoreHunger(self.HungerRestore)

		if final then
			ply:SendChat("NOTICE", "You light up and take long drag. It was the last in the box.")
		else
			ply:SendChat("NOTICE", "You light up and take long drag.")
		end
	end
	
	function ITEM:OnTargetUse(ply, target, final)
	end
end

return ITEM