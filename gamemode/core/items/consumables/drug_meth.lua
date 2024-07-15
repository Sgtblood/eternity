ITEM = class.Create("base_consumable")

ITEM.Name                = "Methamphetamine"
ITEM.Description         = "A heavy stimulant, not even the new-order can stop the white."
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
ITEM.UnitPrice           = 300
ITEM.SellPrice           = 10

ITEM.MaximumCharges      = 1
ITEM.RemainingChargeText = false

if SERVER then
	function ITEM:OnSelfUse(ply, final)
		ply:VisibleMessage(ply:VisibleRPName() .. " chose to fuck their life up pretty good and snorted the meth.")

		umsg.Start("DrugEffect_savav_meth", ply)
		umsg.String( "savav_meth" )
		umsg.End() 
		
		timer.Create( ply:Name().."_DrugTimer", 60, 1, function() 
			ply:SetNWFloat( "drug", "0" )
		end)
	end
	
	function ITEM:OnTargetUse(ply, target, final)
	end
end

return ITEM