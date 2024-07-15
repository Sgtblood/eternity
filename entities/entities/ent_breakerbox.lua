AddCSLuaFile()
DEFINE_BASECLASS("ent_worldent")

ENT.Base 			= "ent_worldent"
ENT.RenderGroup 	= RENDERGROUP_OPAQUE

ENT.PrintName 		= "Breaker Box"
ENT.Category = "Half-Life"

ENT.Spawnable 		= false
ENT.AdminOnly 		= true

ENT.Model 			= Model("models/tnb/props/electrical6.mdl")

function ENT:Initialize()
	self:SetModel(self.Model)

	if SERVER then
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)

		local phys = self:GetPhysicsObject()

		if IsValid(phys) then
			phys:Wake()
		end

		self:SetUseType(SIMPLE_USE)
	end
end

function ENT:GetContextOptions(ply, interact)
	local tab = BaseClass.GetContextOptions(self, ply, interact)

	if not ply:IsInEditMode() or self:IsReady() or not interact then
		return tab
	end

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

	return tab
end

function ENT:CanSave()
	return self:GetZoneGroup() != ""
end

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "EntityID")

	self:NetworkVar("String", 0, "ZoneGroup")
end

if SERVER then
	function ENT:Use(ply)
		if not self:IsReady() then
			return
		end

		local zone = self:GetZoneGroup()

		if ply:ZoneGroup() == zone then
			ply:SetZoneGroup("")
			ply:SendChat("NOTICE", "The flip has been switched on.")
		else
			ply:SetZoneGroup(zone)
			ply:SendChat("NOTICE", "The flip has been switched off.")
		end
	end

	function ENT:GetCustomData()
		return {
			ZoneGroup = self:GetZoneGroup()
		}
	end

	function ENT:LoadCustomData(data)
		self:SetZoneGroup(data.ZoneGroup)
	end
end

