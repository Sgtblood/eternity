ITEM = class.Create("base_consumable")

ITEM.Name                = "Heroin"
ITEM.Description         = "The good stuff, fresh from the lab."
ITEM.Model               = Model("models/jellik/heroin.mdl")
ITEM.OutlineColor        = Color(238, 238, 145)

ITEM.Width               = 1
ITEM.Height              = 1
ITEM.ItemTags            = { "Drug" }

ITEM.AllowSelf           = true
ITEM.AllowTarget         = false
ITEM.AllowSelfMessage    = "Consume"
ITEM.AllowTargetMessage  = ""

ITEM.License             = LICENSE_GREYMARKET
ITEM.UnitPrice           = 300
ITEM.SellPrice           = 10

ITEM.MaximumCharges      = 1
ITEM.RemainingChargeText = false

if SERVER then
	function ITEM:OnSelfUse(ply, final)
		ply:VisibleMessage(ply:VisibleRPName() .. " injects something into their bloodstream.")

		umsg.Start("DrugEffect_savav_Psilocybin", ply)
		umsg.String( "savav_Psilocybin" )
		umsg.End() 
		
		timer.Create( ply:Name().."_DrugTimer", 110, 1, function() 
			ply:SetNWFloat( "drug", "0" )
			ply:VisibleMessage(ply:VisibleRPName() .. " gets knocked out by the effects of the drug.")
			ply:SetConsciousness(0)
		end)
	
		ply:SetHungerBar(math.Clamp(ply:HungerBar() + math.random(1, 1000), 0, GAMEMODE:GetConfig("HungerMax")))
	end
	
	function ITEM:OnTargetUse(ply, target, final)
	end
end

return ITEM