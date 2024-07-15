ITEM = class.Create("base_item")

ITEM.Name        = "base_deployable"
ITEM.Model       = Model("models/dav0r/hoverball.mdl")
ITEM.ItemGroup   = "Deployable"

ITEM.DeployText  = "Deploy"
ITEM.ReturnText  = "Return"
ITEM.ClassName   = ""

function ITEM:IsEquipped()
	local inventory = self:GetInventory()

	if not inventory then
		return false
	end

	return inventory.GridName == "Main"
end

function ITEM:IsDeployed()
	if self.ActiveEntityRef == nil then
		return false
	end

	if not IsValid(self.ActiveEntityRef) then
		return false
	end

	if not IsEntity(self.ActiveEntityRef) then
		return false
	end

	if self.ActiveEntityRef:GetNW2Int("EternityDeployableNetworkId", 0) ~= self.NetworkID then
		return false
	end

	return true
end

function ITEM:Destroy(deleting)
	if SERVER and self:IsDeployed() then
		self.ActiveEntityRef:Remove()
	end

	self.ActiveEntityRef = nil
	self:ParentCall("Destroy")
end

function ITEM:GetContextOptions(ply)
	local tab = {}

		table.insert(tab, {
			Name = self.DeployText,
			Callback = function()
				if SERVER then
					if self:IsDeployed() then
						ply:SendChat("ERROR", "That deployable has already been spawned in the world!")
						return
					end

					self.ActiveEntityRef = self:Deploy(ply)
					self.ActiveEntityRef:SetNW2Int("EternityDeployableNetworkId", self.NetworkID)
					print(self.ActiveEntityRef:GetNW2Int("EternityDeployableNetworkId", 0))
				end
			end
		})
		table.insert(tab, {
			Name = self.ReturnText,
			Callback = function()
				if SERVER then
					if not self:IsDeployed() then
						ply:SendChat("ERROR", "That deployable is not present in the world!")
						return
					end

					self.ActiveEntityRef:Remove()
					self.ActiveEntityRef = nil
				end
			end
		})

	for _, v in pairs(self:ParentCall("GetContextOptions",ply)) do
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

if SERVER then
	function ITEM:Deploy(ply)
		local tr = util.TraceLine({ start = ply:EyePos(), endpos = ply:EyePos() + (ply:GetAimVector() * 1024), filter = ply })

		-- Attempt to spawn a Simphys vehicle first.
		local vehicle = list.Get("simfphys_vehicles")[self.ClassName]
		if vehicle then
			local ang = ply:EyeAngles()
			local pos = tr.HitPos + Vector(0,0,25) + (vehicle.SpawnOffset or Vector(0,0,0))

			ang.pitch = 0
			ang.roll = 0
			ang.yaw = ang.yaw + 180 + (vehicle.SpawnAngleOffset and vehicle.SpawnAngleOffset or 0)

			return simfphys.SpawnVehicle(ply, pos, ang, vehicle.Model, vehicle.Class, self.ClassName, vehicle, true)
		end

		-- Attempt to spawn a scripted entity after that.
		local scripted = scripted_ents.GetStored(self.ClassName)
		if scripted then
			local sent = scripted.t
			local func = scripted.t.SpawnFunction

			if not func then
				return
			end

			return func(sent, ply, tr, self.ClassName)
		end

		-- As a final resort, attempt to spawn a base game entity.
		local ent = ents.Create(self.ClassName)

		local ang = ply:EyeAngles()
		ang.pitch = 0
		ang.roll = 0

		ent:SetPos(tr.HitPos)
		ent:SetAngles(ang)
		ent:Spawn()
		ent:Activate()

		return ent
	end
end


return ITEM 