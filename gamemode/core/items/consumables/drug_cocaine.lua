ITEM = class.Create("base_consumable")

ITEM.Name                = "Cocaine"
ITEM.Description         = "The good stuff, fresh from the lab."
ITEM.Model               = Model("models/jellik/cocaine.mdl")
ITEM.OutlineColor        = Color(238, 238, 145)

ITEM.Width               = 1
ITEM.Height              = 1
ITEM.ItemTags            = { "Drug" }

ITEM.AllowSelf           = true
ITEM.AllowTarget         = false
ITEM.AllowSelfMessage    = "Snort"
ITEM.AllowTargetMessage  = ""

ITEM.License             = LICENSE_GREYMARKET
ITEM.UnitPrice           = 295
ITEM.SellPrice           = 10

ITEM.MaximumCharges      = 1
ITEM.RemainingChargeText = false

if SERVER then
	function ITEM:OnSelfUse(ply, final)
		ply:VisibleMessage(ply:VisibleRPName() .. " snorts up the cocaine.")

		umsg.Start("DrugEffect_savav_cocaine", ply)
		umsg.String( "savav_cocaine" )
		umsg.End() 
		
		timer.Create( ply:Name().."_DrugTimer", 110, 1, function() ply:SetNWFloat( "drug", "0" ) end)
	end
	
	function ITEM:OnTargetUse(ply, target, final)
	end
end

return ITEM