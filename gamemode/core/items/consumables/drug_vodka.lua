ITEM = class.Create("base_consumable")

ITEM.Name                = "Vodka"
ITEM.Description         = "Glorious Russia, may we drink."
ITEM.Model               = Model("models/wick/wrbstalker/anomaly/items/wick_dev_vodka.mdl")
ITEM.OutlineColor        = Color(145, 238, 168)

ITEM.Width               = 1
ITEM.Height              = 1
ITEM.ItemTags            = { "Drug" }

ITEM.AllowSelf           = true
ITEM.AllowTarget         = false
ITEM.AllowSelfMessage    = "Drink"
ITEM.AllowTargetMessage  = ""

ITEM.License             = LICENSE_GREYMARKET
ITEM.UnitPrice           = 50
ITEM.SellPrice           = 20

ITEM.MaximumCharges      = 1
ITEM.RemainingChargeText = false

ITEM.HungerRestore       = -100

if SERVER then
	function ITEM:OnSelfUse(ply, final)
		ply:SendChat("NOTICE", "You drink from the bottle and feel a buzz.")
		ply:RestoreHunger(self.HungerRestore)

		umsg.Start("DrugEffect_savav_beer", ply)
		umsg.String( "savav_beer" )
		umsg.End() 
		
		timer.Create( ply:Name().."_DrugTimer", 110, 1, function() ply:SetNWFloat( "drug", "0" ) end)
	end
	
	function ITEM:OnTargetUse(ply, target, final)
	end
end

return ITEM