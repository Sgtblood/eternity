ITEM = class.Create("base_consumable")

ITEM.Name 				= "Epinephrine Injection"
ITEM.Description 		= "A Adrenaline shot that makes your heart beat faster, makes your lungs breathe more effective, and increases your blood pressure."

ITEM.Model 				= Model("models/bloocobalt/l4d/items/w_eq_adrenaline.mdl")

ITEM.Width 				= 1

ITEM.License 			= LICENSE_MEDICAL
ITEM.UnitPrice			= 250
ITEM.SellPrace			= 100

ITEM.UseTarget 			= true
ITEM.TargetString 		= "Heal Target"

ITEM.UseSelf 			= true
ITEM.SelfString 		= "Heal Self"

function ITEM:IsValidTarget(target)
	return target:IsPlayer() and target:Health() < target:GetMaxHealth()
end

if SERVER then
	function ITEM:OnTargetUse(ply, target)
		ply:VisibleMessage(string.format("%s injects %s with an Adrenaline shot, spiking their heart rate and blood pressure!", ply:VisibleRPName(), target:VisibleRPName()))

		target:SetHealth(math.Clamp(target:Health() + 15, 0, target:GetMaxHealth()))

		GAMEMODE:DeleteItem(self)
	end

	function ITEM:OnSelfUse(ply)
		ply:SendChat("NOTICE", "You inject yourself with an Adrenaline shot, spiking your heart rate and blood pressure!")

		ply:SetHealth(math.Clamp(ply:Health() + 15, 0, ply:GetMaxHealth()))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM
