ITEM = class.Create("base_consumable")

ITEM.Name                = "Acid"
ITEM.Description         = "A tablet of acid. You sure about this?"
ITEM.Model               = Model("models/jellik/adderall.mdl")
ITEM.OutlineColor        = Color(238, 238, 145)

ITEM.Width               = 1
ITEM.Height              = 1
ITEM.ItemTags            = { "Drug" }

ITEM.AllowSelf           = true
ITEM.AllowTarget         = false
ITEM.AllowSelfMessage    = "Ingest"
ITEM.AllowTargetMessage  = ""

ITEM.License             = LICENSE_GREYMARKET
ITEM.UnitPrice           = 250
ITEM.SellPrice           = 10

ITEM.MaximumCharges      = 1
ITEM.RemainingChargeText = false

if SERVER then
	function ITEM:OnSelfUse(ply, final)
		ply:SendChat("NOTICE", "You pop a pill of acid.")

		umsg.Start("DrugEffect_savav_acid", ply)
		umsg.String( "savav_acid" )
		umsg.End() 
		
		timer.Create( ply:Name().."_DrugTimer", 80, 1, function() ply:SetNWFloat( "drug", "0" ) end)
	end
	
	function ITEM:OnTargetUse(ply, target, final)
	end
end

return ITEM