AddCSLuaFile()
DEFINE_BASECLASS("ent_worldent")

ENT.Base 			= "ent_worldent"
ENT.RenderGroup 	= RENDERGROUP_OPAQUE

ENT.PrintName 		= "Cooking Grill"
ENT.Category = "Common Entities"

ENT.Spawnable 		= false
ENT.AdminOnly 		= true

ENT.Model 			= Model("models/props_se/propper/plitka.mdl")

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

		ply:OpenGUI("CookingMenu", CRAFTING_COOKEDFOOD)
	end
end