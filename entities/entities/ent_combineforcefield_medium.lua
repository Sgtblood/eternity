AddCSLuaFile()
DEFINE_BASECLASS("ent_worldent")

ENT.Base 			= "ent_worldent"
ENT.RenderGroup 	= RENDERGROUP_BOTH

ENT.PrintName 		= "Forcefield (MEDIUM)"
ENT.Category = "Half-Life"

ENT.Spawnable 		= false
ENT.AdminOnly 		= true

ENT.Model  			= Model("models/props_combine/combine_fence01b.mdl")
ENT.FarModel  		= Model("models/props_combine/combine_fence01a.mdl")

function ENT:SpawnFunction(ply, tr, class)
	if not ply:IsInEditMode() then
		ply:SendChat("ERROR", "You have to be in edit mode to do this!")

		return
	end

	local ang = Angle(0, ply:EyeAngles().y + 180, 0) + (self.SpawnAngleOffset or Angle())
	local ent = ents.Create(class)

	ent:SetCreator(ply)
	ent:SetPos(tr.HitPos + Vector(0, 0, 40))
	ent:SetAngles(ang)

	ent:Spawn()
	ent:Activate()

	undo.Create(class)
		undo.AddEntity(ent)
		undo.SetPlayer(ply)
		undo.SetCustomUndoText("Undone " .. ent.PrintName)
	undo.Finish()

	return ent
end

function ENT:Initialize()
	self:SetModel(self.Model)
	self:DrawShadow(false)

	self:SetAngles(self:GetAngles():SnapTo("y", 15))

	local filter = table.MakeAssociative({self, self:GetDummy()})

	local tr = util.TraceLine({
		start = self:GetPos() + self:GetRight() * -16,
		endpos = self:GetPos() + self:GetRight() * -360,
		filter = function(ent) 
			if filter[ent] then
				return false
			end

			if ent.Removing then
				return false
			end
		end
	})

	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)

	if SERVER then
		self:SetUseType(SIMPLE_USE)

		local dummy = ents.Create("ent_dummy")

		dummy:SetModel(self.FarModel)
		dummy:SetPos(tr.HitPos)
		dummy:SetAngles(self:GetAngles())
		dummy:Spawn()
		dummy:Activate()

		dummy:SetSolid(SOLID_NONE)
		dummy:DrawShadow(false)

		self:DeleteOnRemove(dummy)

		self:SetDummy(dummy)
	end

	self:PhysicsFromMesh({
		{pos = Vector(0, 0, -25)},
		{pos = Vector(0, 0, 150)},
		{pos = self:WorldToLocal(tr.HitPos) + Vector(0, 0, 150)},
		{pos = self:WorldToLocal(tr.HitPos) + Vector(0, 0, 150)},
		{pos = self:WorldToLocal(tr.HitPos) - Vector(0, 0, 25)},
		{pos = Vector(0, 0, -25)}
	})

	self:SetCustomCollisionCheck(true)
	self:EnableCustomCollisions(true)

	local phys = self:GetPhysicsObject()

	if IsValid(phys) then
		phys:EnableMotion(false)
		phys:Sleep()
	end

	self:SetMoveType(MOVETYPE_NOCLIP)
	self:SetMoveType(MOVETYPE_PUSH)

	self:MakePhysicsObjectAShadow()

	self:AddEFlags(EFL_DONTBLOCKLOS)
end

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "EntityID")

	self:NetworkVar("Entity", 0, "Dummy")

	self:NetworkVar("Bool", 0, "Powered")
	self:NetworkVar("Bool", 1, "AllowCA")
	self:NetworkVar("Bool", 2, "AllowWorkers")
	self:NetworkVar("Bool", 3, "AllowInfCon")
	self:NetworkVar("Bool", 4, "AllowPolice")
end

function ENT:CanPlayerPower(ent)
	if ent:Team() == TEAM_SCIENTIST or ent:Team() == TEAM_INSPECTORS or ent:Team() == TEAM_OVERWATCH or ent:Team() == TEAM_AIRWATCH or ent:Team() == TEAM_STALKER then
		return ent:HasCombinePermission(COMBINE_TECHNOLOGY_FORCEFIELD)
	end

	if self:GetAllowPolice() and ent:Team() == TEAM_POLICE then
		return ent:HasCombinePermission(COMBINE_TECHNOLOGY_FORCEFIELD)
	end

	if self:GetAllowCA() and (ent:Team() == TEAM_COMBINEADMIN or ent:Team() == TEAM_MIDDLEADMIN or ent:Team() == TEAM_LOWERADMIN) then
		return ent:HasCombinePermission(COMBINE_TECHNOLOGY_FORCEFIELD)
	end

	if self:GetAllowWorkers() and ent:Team() == TEAM_ENGINEERS then
		return ent:HasCombinePermission(COMBINE_TECHNOLOGY_FORCEFIELD)
	end

	if self:GetAllowInfCon() and ent:Team() == TEAM_INFCON then
		return ent:HasCombinePermission(COMBINE_TECHNOLOGY_FORCEFIELD)
	end

	return false
end

function ENT:GetContextOptions(ply, interact)
	local tab = BaseClass.GetContextOptions(self, ply, interact)

	if not self:IsReady() or not interact then
		return tab
	end

	if ply:IsInEditMode() then
		table.insert(tab, {
            EditModeOnly = true,
			Name = self:GetAllowCA() and "Restrict Administration Passage" or "Allow Administration Passage",
			Callback = function()
				self:SetAllowCA(not self:GetAllowCA())
				self:Save()
			end
		})
	
		table.insert(tab, {
            EditModeOnly = true,
			Name = self:GetAllowPolice() and "Restrict Civil Protection Passage" or "Allow Civil Protection Passage",
			Callback = function()
				self:SetAllowPolice(not self:GetAllowPolice())
				self:Save()
			end
		})
	
		table.insert(tab, {
            EditModeOnly = true,
			Name = self:GetAllowWorkers() and "Restrict Engineer Passage" or "Allow Engineer Passage",
			Callback = function()
				self:SetAllowWorkers(not self:GetAllowWorkers())
				self:Save()
			end
		})
	
		table.insert(tab, {
            EditModeOnly = true,
			Name = self:GetAllowInfCon() and "Restrict Infestation Control Passage" or "Allow Infestation Control Passage",
			Callback = function()
				self:SetAllowInfCon(not self:GetAllowInfCon())
				self:Save()
			end
		})
	end

	if self:CanPlayerPower(ply) or ply:IsInEditMode() then
		table.insert(tab, {
			SubMenu = "Forcefield",
			Name = self:GetPowered() and "Power Down" or "Power On",
			Callback = function()
				self:SetPower(not self:GetPowered())
				self:Save()
			end
		})
	end
	
	if ply:HasItem("generic_emp_device") then
		table.insert(tab, {
			SubMenu = "Forcefield",
			Name = "Use EMP Device",
			Callback = function()
				if Cooldown2 == nil or Cooldown2 == 0 then
					self:SetPower(false)
					self:Save()
					ply:VisibleMessage(string.format("%s uses an EMP device to overcharge and deactivate the hardlight.", ply:VisibleRPName()))
					ply:EmitSound("AlyxEMP.Discharge")
					
					Cooldown2 = 1
					
					timer.Create("empcooldown2", 60, 1, function() Cooldown2 = 0 end)
					
					if math.random(0, 100) > 20 then
					GAMEMODE:SendDispatchMessage("Warning. Malignant Viral Interface bypass detected. Polyphasic core reprogramming detected. Sterilizers and containment fields may be compromised. "  , {RADIOGROUP_CCA})
					netstream.Send("PlayDispatchVoiceLine", {
					Index = 22
					})
					end
				else
				ply:SendChat("ERROR", "Please wait ".. math.Round(timer.TimeLeft("empcooldown2"), 0) .." seconds before using an EMP device again.")
				
				end	
			end
		})
	end

	return tab
end

function ENT:CanPass(ent)
	if CLIENT and ent == LocalPlayer() and not self.Loaded then
		self:Initialize()
		self.Loaded = true
	end

	if GAMEMODE.FiringBullet then
		
		return true
	end

	if not self:IsReady() or not self:GetPowered() then
		
		return true
	end

	if ent:IsPlayer() then
		if ent:Team() == TEAM_SCIENTIST or ent:Team() == TEAM_INSPECTORS or ent:Team() == TEAM_OVERWATCH or ent:Team() == TEAM_AIRWATCH or ent:Team() == TEAM_STALKER then
			
			return true
		end

		if self:GetAllowPolice() and string.StartWith(ent:SpeciesState(), "police_") then
			
			return true
		end

		if self:GetAllowCA() and (ent:Team() == TEAM_COMBINEADMIN or ent:Team() == TEAM_MIDDLEADMIN or ent:Team() == TEAM_LOWERADMIN) then
			
			return true
		end

		if self:GetAllowWorkers() and string.StartWith(ent:SpeciesState(), "engineer_") then
			
			return true
		end

		if self:GetAllowInfCon() and string.StartWith(ent:SpeciesState(), "infcon_") then
			
			return true
		end

		
		return false
	end

	if ent:IsNPC() then
		
		return false
	end

	
	return true
end

hook.Add("EntityFireBullets", "forcefield.EntityFireBullets", function(ent, data)
	GAMEMODE.FiringBullet = true

	local cb = data.Callback

	data.Callback = function(attacker, tr, dmg)
		if cb then
			cb(attacker, tr, dmg)
		end

		GAMEMODE.FiringBullet = false
	end

	return true
end)

hook.Add("ShouldCollide", "forcefield.ShouldCollide.Medium", function(a, b)
	local field
	local ent

	if IsValid(a) and a:GetClass() == "ent_combineforcefield_medium" then
		field = a
		ent = b
	elseif IsValid(b) and b:GetClass() == "ent_combineforcefield_medium" then
		field = b
		ent = a
	end

	if field and IsValid(ent) then
		return not field:CanPass(ent)
	end
end)

if CLIENT then
	ENT.Material = Material("effects/com_shield003a")

	function ENT:Draw(studio)
		if self:GetPowered() then
			local mat = Matrix()

			mat:Translate(self:GetPos() + self:GetUp() * -40 + self:GetForward() * -1.5)
			mat:Rotate(self:GetAngles())

			render.SetMaterial(self.Material)

			local dummy = self:GetDummy()

			if IsValid(dummy) then
				local pos = self:WorldToLocal(dummy:GetPos())
				local w = pos:Length() / 190

				local dist = self:WorldSpaceCenter():Distance(EyePos())

				self.Material:SetFloat("$playerdistance", dist * 0.001)
				self.Material:SetFloat("$playerdistance2", dist * 0.1)

				render.SetMaterial(self.Material)

				self:SetRenderBounds(Vector(0, 0, -40), pos + self:GetUp() * 150)

				cam.PushModelMatrix(mat)
					self:DrawShield(pos, w)
				cam.PopModelMatrix()

				mat:Translate(pos)
				mat:Rotate(Angle(0, 180, 0))

				cam.PushModelMatrix(mat)
					self:DrawShield(pos, w)
				cam.PopModelMatrix()
			end
		end

		self:DrawModel()
	end

	function ENT:DrawShield(pos, w)
		local h = 3

		mesh.Begin(MATERIAL_QUADS, 1)
			mesh.Position(Vector(0, 0, 0))
			mesh.TexCoord(0, 0, 0)
			mesh.AdvanceVertex()

			mesh.Position(self:GetUp() * 190)
			mesh.TexCoord(0, 0, h)
			mesh.AdvanceVertex()

			mesh.Position(pos + self:GetUp() * 190)
			mesh.TexCoord(0, w * h, h)
			mesh.AdvanceVertex()

			mesh.Position(pos)
			mesh.TexCoord(0, w * h, 0)
			mesh.AdvanceVertex()
		mesh.End()
	end
end

if SERVER then
	ENT.Sounds = {}

	function ENT:SetPower(bool)
		self:SetPowered(bool)

		self:SetSkin(bool and 0 or 1)

		if IsValid(self:GetDummy()) then
			self:GetDummy():SetSkin(bool and 0 or 1)
		end

		self:Save()
	end

	function ENT:OnRemove()
		for _, v in pairs(self.Sounds) do
			if IsValid(v) and v.ForcefieldSound then
				v.ForcefieldSound:Stop()
				v.ForcefieldSound = nil
			end
		end

		if self.Ambient1 then
			self.Ambient1:Stop()
			self.Ambient1 = nil
		end

		if self.Ambient2 then
			self.Ambient2:Stop()
			self.Ambient2 = nil
		end
	end

	function ENT:StartTouch(ent)
		if not ent.ForcefieldSound then
			ent.ForcefieldSound = CreateSound(ent, "ambient/machines/combine_shield_touch_loop1.wav")
			ent.ForcefieldSound:Play()
			ent.ForcefieldSound:ChangeVolume(0.8, 0)

			table.insert(self.Sounds, ent)
		end
	end

	function ENT:EndTouch(ent)
		if ent.ForcefieldSound then
			ent.ForcefieldSound:Stop()
			ent.ForcefieldSound = nil
		end
	end

	function ENT:Think()
		local filter = RecipientFilter()

		filter:AddAllPlayers()

		if self:GetPowered() then
			if not self.Ambient1 then
				self.Ambient1 = CreateSound(self, "d3_citadel.shield_loop", filter)
				self.Ambient1:Play()
				self.Ambient1:ChangeVolume(1, 0)
			end

			if IsValid(self:GetDummy()) and not self.Ambient2 then
				self.Ambient2 = CreateSound(self:GetDummy(), "d3_citadel.shield_loop", filter)
				self.Ambient2:Play()
				self.Ambient2:ChangeVolume(1, 0)
			end
		else
			if self.Ambient1 then
				self.Ambient1:Stop()
				self.Ambient1 = nil
			end

			if self.Ambient2 then
				self.Ambient2:Stop()
				self.Ambient2 = nil
			end
		end
	end

	function ENT:OnInitialLoad()
		self:SetPower(self:GetPowered())
	end

	function ENT:GetCustomData()
		return {
			Powered = self:GetPowered(),
			AllowCA = self:GetAllowCA(),
			AllowWorkers = self:GetAllowWorkers(),
			AllowInfCon = self:GetAllowInfCon(),
			AllowPolice = self:GetAllowPolice()
		}
	end

	function ENT:LoadCustomData(data)
		self:SetPower(data.Powered)
		self:SetAllowCA(data.AllowCA)
		self:SetAllowWorkers(data.AllowWorkers)
		self:SetAllowInfCon(data.AllowInfCon)
		self:SetAllowPolice(data.AllowPolice)
	end
end
