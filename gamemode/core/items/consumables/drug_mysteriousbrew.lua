ITEM = class.Create("base_consumable")

ITEM.Name                = "Mysterious Bottle"
ITEM.Description         = "It looks like sewage."
ITEM.Model               = Model("models/mark2580/gtav/garage_stuff/oilbot03.mdl")
ITEM.OutlineColor        = Color(238, 238, 145)

ITEM.Width               = 1
ITEM.Height              = 3
ITEM.ItemTags            = { "Drug" }

ITEM.AllowSelf           = true
ITEM.AllowTarget         = true
ITEM.AllowSelfMessage    = "Drink"
ITEM.AllowTargetMessage  = "Force Feed %s"

ITEM.MaximumCharges      = 1
ITEM.RemainingChargeText = false

if SERVER then
	function ITEM:OnSelfUse(ply, final)
		ply:VisibleMessage(ply:VisibleRPName() .. " drinks from a foul smelling mug. They pass out shortly after.")
		ply:TakeCDamage(100)
	end
	
	function ITEM:OnTargetUse(ply, target, final)
		ply:VisibleMessage(ply:VisibleRPName() .. " forces something down " .. target:VisibleRPName() .. "'s throat.")
		target:TakeCDamage(100)
	end
end

return ITEM