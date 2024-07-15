ITEM = class.Create("base_consumable")

ITEM.Name 				= "XR-1 Injector"
ITEM.Description 		= "A Combine-produced, single-use needle. Filled with sensory and hormone enhancements."

ITEM.Model 				= Model("models/carlsmei/escapefromtarkov/medical/zagustin.mdl")

ITEM.Width 				= 1


ITEM.UseTarget 			= true
ITEM.TargetString 		= "Heal Target"

ITEM.UseSelf 			= true
ITEM.SelfString 		= "Heal Self"

function ITEM:IsValidTarget(target)
	return target:IsPlayer() and target:Health() < target:GetMaxHealth()
end

if SERVER then
	function ITEM:OnTargetUse(ply, target)
		ply:VisibleMessage(string.format("%s injects %s with fast-acting stimulant.", ply:VisibleRPName(), target:VisibleRPName()))

		target:SetHealth(math.Clamp(target:Health() + 55, 0, target:GetMaxHealth()))

		GAMEMODE:DeleteItem(self)
	end

	function ITEM:OnSelfUse(ply)
		ply:SendChat("NOTICE", "You inject yourself with fast-acting stimulant.")

		ply:SetHealth(math.Clamp(ply:Health() + 55, 0, ply:GetMaxHealth()))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM
