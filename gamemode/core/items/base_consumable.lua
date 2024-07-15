ITEM = class.Create("base_item")

ITEM.ItemGroup          = "Consumable"
ITEM.OutlineColor       = Color(144, 238, 238)

ITEM.AllowSelf          = false
ITEM.AllowSelfMessage   = "Use on Self"
ITEM.AllowTarget        = false
ITEM.AllowTargetMessage = "Use on %s"

ITEM.MaximumCharges      = 1
ITEM.RemainingCharges    = 1
ITEM.RemainingChargeText = {
	One = "There is %s use left.",
	Other = "There are %s uses left"
}

function ITEM:IsEquipped()
	local inventory = self:GetInventory()

	if not inventory then
		return false
	end

	return inventory.GridName == "Main"
end

function ITEM:GetDescription()
	if self.MaximumCharges == 1 or not self.RemainingChargeText then
		return self.Description
	end

	return string.format("%s\n\n%s", self.Description, string.format(self.RemainingCharges == 1 and self.RemainingChargeText.One or self.RemainingChargeText.Other, self.RemainingCharges))
end

function ITEM:GetContextOptions(ply)
	local tab = {}

	if self.AllowSelf then
		table.insert(tab, {
			Name = self.AllowSelfMessage,
			Callback = function()
				self:OnSelfUse(ply, self.RemainingCharges == 1)
				
				self.RemainingCharges = self.RemainingCharges - 1
				if self.RemainingCharges == 0 then
					GAMEMODE:DeleteItem(self)
				end
			end
		})
	end

	if self.AllowTarget then
		table.insert(tab, {
			Name = "Use on Target",
			ContextTarget = function(target)
				if not self:CanTarget(ply, target) then
					return false, nil
				end

				return true, string.format(self.AllowTargetMessage, target:VisibleRPName())
			end,
			Callback = function(target)
				if not self:CanTarget(ply, target) then
					return
				end

				self:OnTargetUse(ply, target, self.RemainingCharges == 1)

				self.RemainingCharges = self.RemainingCharges - 1
				if self.RemainingCharges == 0 then
					GAMEMODE:DeleteItem(self)
				end
			end
		})
	end

	for _, v in pairs(self:ParentCall("GetContextOptions", ply)) do
		table.insert(tab, v)
	end

	return tab
end

function ITEM:GetOptions(ply)
	local tab = self:GetContextOptions(ply)

	for _, v in pairs(self:ParentCall("GetOptions", ply)) do
		table.insert(tab, v)
	end

	return tab
end

function ITEM:CanTarget(ply, target)
	return IsValid(target) and IsEntity(target) and target:IsPlayer() and target:WithinInteractRange(ply) and target:HasCharacter()
end

if SERVER then
	function ITEM:OnSelfUse(ply, final)
	end

	function ITEM:OnTargetUse(ply, target, final)
	end
end

return ITEM