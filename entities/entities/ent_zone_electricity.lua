AddCSLuaFile()
DEFINE_BASECLASS("ent_zone")

ENT.Base 			= "ent_zone"

ENT.PrintName 		= "Skyfog: Electricity"
ENT.Category = "Zone Tools"

ENT.Spawnable 		= false
ENT.AdminOnly 		= true

ENT.Color 			= Color(225, 255, 0)

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "EntityID")

	self:NetworkVar("String", 0, "ZoneGroup")
	self:NetworkVar("String", 1, "ZoneName")

	self:NetworkVar("Vector", 0, "ZoneMins")
	self:NetworkVar("Vector", 1, "ZoneMaxs")
end

function ENT:Enter(ply, transition)
	if CLIENT and ply == LocalPlayer() then
		if not transition then -- Don't reset fog timer if transitioning from another cloud
			ply.FogStart = CurTime()
		end

		hook.Add("PreDrawSkyBox", self, function()
			return true
		end)

		hook.Add("RenderScreenspaceEffects", self, function()
			local time = CurTime() - ply.FogStart
			local frac = math.Clamp(time * 2, 0, 1)

			DrawBloom(0.3, 1.4 * frac, 0, 0, 1, 0, 1, 1, 1)
		end)

		hook.Add("SetupWorldFog", self, function()
			local time = CurTime() - ply.FogStart
			local frac = math.Clamp(time * 2, 0, 0.999)

			render.FogMode(MATERIAL_FOG_LINEAR)
			render.FogStart(-4000)
			render.FogEnd(400)
			render.FogMaxDensity(frac)
			render.FogColor(0, 0, 0)

			return true
		end)
	end

	if SERVER and not transition then
		ply:SendChat("NOTICE", "The path ahead darkens. It's hard to see more than few feet ahead.")
		end
	end

function ENT:Exit(ply, transition)
	if CLIENT and ply == LocalPlayer() then
		hook.Remove("PreDrawSkyBox", self)
		hook.Remove("RenderScreenspaceEffects", self)
		hook.Remove("SetupWorldFog", self) -- Always remove entry fog hook, replaced by new zone if transitioning

		if not transition then -- Only setup exit fog if we're not transitioning for good
			ply.FogEnd = CurTime() + math.min(0.5, CurTime() - ply.FogStart)

			hook.Add("RenderScreenspaceEffects", self, function()
				local time = ply.FogEnd - CurTime()
				local frac = math.Clamp(time * 2, 0, 0.999)

				if frac == 0 then
					hook.Remove("RenderScreenspaceEffects", self)
				end

				DrawBloom(0.3, 1.4 * frac, 0, 0, 1, 0, 1, 1, 1)
			end)

			hook.Add("SetupWorldFog", self, function()
				local time = ply.FogEnd - CurTime()
				local frac = math.Clamp(time * 2, 0, 1)

				if frac == 0 then
					hook.Remove("SetupWorldFog", self)
				end

				render.FogMode(MATERIAL_FOG_LINEAR)
				render.FogStart(-4000)
				render.FogEnd(400)
				render.FogMaxDensity(frac)
				render.FogColor(0, 0, 0)

				return true
			end)
		end
	end

	if SERVER and not transition then
		ply:SendChat("NOTICE", "Your eyes take a moment to adjust to the light. You can see again.")
	end
end

function ENT:GetContextOptions(ply, interact)
	local tab = BaseClass.GetContextOptions(self, ply, interact)

	if not interact or not ply:IsInEditMode() then
		return tab
	end

	if self:CanSave() then
		table.insert(tab, {
			EditModeOnly = true,
			Name = "Set Zone Group",
			Client = function()
				return GAMEMODE:OpenGUI("Input", "string", "Set Zone Group", {
					Default = self:GetZoneGroup(),
					Max = 30
				})
			end,
			Callback = function(val)
				if not GAMEMODE:CheckInput("string", {
					Max = 30
				}, val) then
					return
				end

				self:SetZoneGroup(val)
			end
		})

		table.insert(tab, {
			EditModeOnly = true,
			Name = "Set Zone Name",
			Client = function()
				return GAMEMODE:OpenGUI("Input", "string", "Set Zone Name", {
					Default = self:GetZoneName(),
					Max = 30
				})
			end,
			Callback = function(val)
				if not GAMEMODE:CheckInput("string", {
					Max = 30
				}, val) then
					return
				end

				self:SetZoneName(val)
			end
		})
end

	return tab
end

if CLIENT then
	function ENT:Draw()
		local edit = LocalPlayer():IsInEditMode()
		local ready = self:IsReady()

		if edit or not ready then
			self:DrawModel()

			local mins = self:OBBMins() - Vector(0.1, 0.1, 0.1)
			local maxs = self:OBBMaxs() + Vector(0.1, 0.1, 0.1)

			render.SetColorMaterial()
			render.DrawBox(self:GetPos(), self:GetAngles(), mins, maxs, ColorAlpha(self.Color, 50), true)

			local weapon = LocalPlayer():GetActiveWeapon()

			if edit and IsValid(weapon) and weapon:GetClass() == "eternity_admin_zonemarker" then
				mins = self:GetZoneMins()
				maxs = self:GetZoneMaxs()

				local center = LerpVector(0.5, mins, maxs)

				mins = mins - center
				maxs = maxs - center

				render.SetColorMaterial()
				render.DrawBox(center, Angle(), mins, maxs, ColorAlpha(self.Color, 50))
				render.DrawWireframeBox(center, Angle(), mins, maxs, ColorAlpha(self.Color, 50))
				render.DrawLine(self:WorldSpaceCenter(), center, self.Color)
			end
		end

		if edit and ready then
			GAMEMODE:DrawWorldText(self:GetPos()+ Vector(0, 0, 2), self:GetZoneGroup(), self:GetZOrder())
			GAMEMODE:DrawWorldText(self:GetPos()+ Vector(0, 0, -2), self:GetZoneName(), self:GetZOrder())
				
		end
	end
end


if SERVER then
	function ENT:GetCustomData()
		return {
			ZoneGroup = self:GetZoneGroup(),
			ZoneName = self:GetZoneName(),

			ZoneMins = self:GetZoneMins(),
			ZoneMaxs = self:GetZoneMaxs()
		}
	end

	function ENT:LoadCustomData(data)
		self:SetZoneGroup(data.ZoneGroup)
		self:SetZoneName(data.ZoneName)

		self:SetZoneMins(data.ZoneMins)
		self:SetZoneMaxs(data.ZoneMaxs)
	end
end

