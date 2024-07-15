ITEM = class.Create("base_consumable")

ITEM.Name                = "Ketamine"
ITEM.Description         = "It'll make you forget, comes with a needle and the bottle, in a nice kit."
ITEM.Model               = Model("models/wick/wrbstalker/anomaly/items/dez_drugskit.mdl")
ITEM.OutlineColor        = Color(238, 238, 145)

ITEM.Width               = 2
ITEM.Height              = 1
ITEM.ItemTags            = { "Drug" }

ITEM.AllowSelf           = true
ITEM.AllowTarget         = false
ITEM.AllowSelfMessage    = "Consume"
ITEM.AllowTargetMessage  = ""

ITEM.License             = LICENSE_GREYMARKET
ITEM.UnitPrice           = 190
ITEM.SellPrice           = 10

ITEM.MaximumCharges      = 1
ITEM.RemainingChargeText = false

if SERVER then
	function ITEM:OnSelfUse(ply, final)
		ply:VisibleMessage(ply:VisibleRPName() .. " prepares a healthy does of ketamine.")

		umsg.Start("DrugEffect_savav_LCD", ply)
		umsg.String( "savav_LCD" )
		umsg.End() 
		
		timer.Create( ply:Name().."_DrugTimer", 110, 1, function() ply:SetNWFloat( "drug", "0" ) end)
	end
	
	function ITEM:OnTargetUse(ply, target, final)
	end
end

return ITEM