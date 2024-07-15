AddCSLuaFile()
DEFINE_BASECLASS("ent_worldent")

ENT.Base 			= "ent_worldent"
ENT.RenderGroup 	= RENDERGROUP_OPAQUE

ENT.PrintName 		= "Workbench"
ENT.Category = "Common Entities"

ENT.Spawnable 		= false
ENT.AdminOnly 		= true

ENT.Model 			= Model("models/mosi/fallout4/furniture/workstations/workshopbench.mdl")

function ENT:GetContextOptions(ply, interact)
	local tab = BaseClass.GetContextOptions(self, ply, interact)

	if not ply:IsInEditMode() or self:IsReady() or not interact then
		return tab
	end

	return tab
end

function ENT:Initialize()
	self:SetModel(self.Model)

	if SERVER then
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
	end
end

if SERVER then
	function ENT:Use(ply)
		if not self:IsReady() then
			return
		end

		ply:OpenGUI("CraftingMenu", CRAFTING_GENERIC)
	end
end