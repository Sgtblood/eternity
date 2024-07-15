AddCSLuaFile()
DEFINE_BASECLASS("ent_worldent")

ENT.Base              = "ent_worldent"
ENT.RenderGroup       = RENDERGROUP_BOTH

ENT.PrintName         = "Loot Container"
ENT.Category          = "Common Entities"

ENT.Model             = Model("models/props_borealis/bluebarrel001.mdl")

ENT.SoundFile					= Sound('ambient/materials/footsteps_glass1.wav')
ENT.SoundRate         = 0.6
ENT.SoundVolume				= 0.25
ENT.SoundChannel      = nil

ENT.LootTracker       = {}

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

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "EntityID")
	self:NetworkVar("Int", 1, "LootTable")
	
	self:SetLootTable(1)
end

function ENT:GetContextOptions(ply, interact)
	local tab = BaseClass.GetContextOptions(self, ply, interact)

	if not ply:IsInEditMode() or self:IsReady() or not interact then
		return tab
	end

	table.insert(tab, {
		EditModeOnly = true,
		Name = "Set Model",
		Client = function()
			return GAMEMODE:OpenGUI("Input", "string", "Set Model", { Max = 128 })
		end,
		Callback = function(val)
			if not GAMEMODE:CheckInput("string", { Max = 128 }, val) then
				return
			end

			self:SetModel(val)
			self.CustomModel = val

			self:PhysicsInit(SOLID_VPHYSICS)
			self:SetMoveType(MOVETYPE_VPHYSICS)
			self:SetSolid(SOLID_VPHYSICS)
	
			local phys = self:GetPhysicsObject()
	
			if IsValid(phys) then
				phys:Wake()
				phys:EnableMotion(false)
			end
	
			self:SetUseType(SIMPLE_USE)
		end
	})

	for _, pool in pairs(GAMEMODE:GetSearchableLootPools()) do
		table.insert(tab, {
			EditModeOnly = true,
			Name = string.format("Use Loot Pool: %s", GAMEMODE:GetLootPoolName(pool, "MISSING POOL CONFIGURATION")),
			Callback = function()
				self:SetLootTable(k)
			end
		})
	end

	return tab
end

if CLIENT then
	function ENT:Draw()
		self:DrawModel()

		if LocalPlayer():IsInEditMode() then
			GAMEMODE:DrawWorldText(self:GetPos() + Vector(0, 0, 15), "Lootable: " .. GAMEMODE:GetLootPoolName(self:GetLootTable(), "MISSING POOL CONFIGURATION"), true)
		end
	end

	netstream.Hook("ent_lootcontainer.BeginSound", function(data)
		local ent = data.LootContainer
		
		if ent.SoundChannel then
			ent.SoundChannel:Stop()
		end

		sound.PlayFile('sound/' .. ent.SoundFile, '3d noplay', function(channel)
			if not IsValid(channel) then
				return
			end
			
			channel:SetPos(ent:GetPos())
			channel:SetPlaybackRate(ent.SoundRate)
			channel:SetVolume(ent.SoundVolume)

			channel:Play()

			ent.SoundChannel = channel
		end)
	end)

	netstream.Hook("ent_lootcontainer.StopSound", function(data)
		local ent = data.LootContainer

		if ent.SoundChannel then
			ent.SoundChannel:Stop()
		end
	end)
elseif SERVER then
	function ENT:Use(ply)
		if not self:IsReady() then
			return
		end

		local pool = self:GetLootTable()
		local nextRoll = (self.LootTracker[ply:SteamID()] or 0) + GAMEMODE:GetLootPoolDelay(pool)

		if (nextRoll > os.time()) or not GAMEMODE:IsLootPoolSearchable(pool) then
			ply:SendChat("NOTICE", "It's not even worth digging your hands through this.")
			return
		end

		ply:VisibleMessage(string.format("%s starts searching for materials.", ply:VisibleRPName()), false)
		netstream.Send("ent_lootcontainer.BeginSound", { LootContainer = self }, ply)

		ply:WaitFor(5, "Searching...", {ply}, nil, nil, function(waited)			
			netstream.Send("ent_lootcontainer.StopSound", { LootContainer = self }, ply)
			
			if not waited then
				return
			end

			if ply:RollAgainstLootPool(pool) then
				local lootable = GAMEMODE:GetRandomFromLootPool(pool)

				coroutine.WrapFunc(function()
					ply:GiveItem(lootable.Class, lootable.StackMin == 0 and 1 or math.floor(math.random(lootable.StackMin, lootable.StackMax)), true, function(item)
						ply:SendChat("NOTICE", "You manage to find something amidst the trash and refuse!")
							
						GAMEMODE:WriteLog("item_lootable", {
							Ply = GAMEMODE:LogPlayer(ply),
							Char = GAMEMODE:LogCharacter(ply),
							Item = GAMEMODE:LogItem(item)
						})

						return item
					end)
				end)
			else
				ply:SendChat("NOTICE", "You fail to find anything after a thorough search.")
			end

			self.LootTracker[ply:SteamID()] = os.time()
		end)
	end

	function ENT:OnInitialLoad()
		if self.CustomModel then
			self:SetModel(self.CustomModel)

			self:PhysicsInit(SOLID_VPHYSICS)
			self:SetMoveType(MOVETYPE_VPHYSICS)
			self:SetSolid(SOLID_VPHYSICS)
	
			local phys = self:GetPhysicsObject()
	
			if IsValid(phys) then
				phys:Wake()
				phys:EnableMotion(false)
			end
	
			self:SetUseType(SIMPLE_USE)
		end
	end

	function ENT:GetCustomData()
		return {
			CustomModel = self.CustomModel,
			LootTable = self:GetLootTable()
		}
	end

	function ENT:LoadCustomData(data)
		self.CustomModel = data.CustomModel
		self:SetLootTable(data.LootTable)
	end
end
