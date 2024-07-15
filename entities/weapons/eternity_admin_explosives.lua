AddCSLuaFile()

SWEP.PrintName 				= "Eternity: Explosives Spawner"
SWEP.Author 				= "TankNut"

SWEP.RenderGroup 			= RENDERGROUP_OPAQUE



SWEP.ViewModel 				= Model("models/weapons/c_arms.mdl")
SWEP.WorldModel 			= ""

SWEP.UseHands 				= true

SWEP.Primary.ClipSize 		= -1
SWEP.Primary.DefaultClip 	= -1
SWEP.Primary.Automatic 		= false
SWEP.Primary.Ammo 			= "none"

SWEP.Secondary.ClipSize 	= -1
SWEP.Secondary.DefaultClip 	= -1
SWEP.Secondary.Automatic 	= false
SWEP.Secondary.Ammo 		= "none"

SWEP.HoldType 			= "magic"
SWEP.HoldTypeLowered 	= "magic"



local panzer = {
	Close = {
		Sound("gred/doi_panzerschreck_01_close.wav"),
		Sound("gred/doi_panzerschreck_02_close.wav"),
		Sound("gred/doi_panzerschreck_03_close.wav")
	},
	Med = {
		Sound("gred/doi_panzerschreck_01.wav"),
		Sound("gred/doi_panzerschreck_02.wav"),
		Sound("gred/doi_panzerschreck_03.wav")
	},
	Far = {
		Sound("gred/doi_panzerschreck_01_dist.wav"),
		Sound("gred/doi_panzerschreck_02_dist.wav"),
		Sound("gred/doi_panzerschreck_03_dist.wav")
	}
}


SWEP.Bombs = {
	["GBU-57A/B MOP"] = {
		Effect = "mop_explosion",
		Sounds = {
			Far = Sound("dub/mop_explod_s.mp3")
		},
		Angle = function(self, ang)
			return ang + Angle(90, 0, 0)
		end,
		Radius = 1500,
		Damage = 200
	},
	["1000LB GP"] = {
		Effect = "tb_explosion",
		Sounds = {
			Far = Sound("dub/t12_final.mp3")
		},
		Angle = function(self, ang)
			return ang + Angle(90, 0, 0)
		end,
		Radius = 3500,
		Damage = 16000
	},
	
	["JDAM GBU-38"] = {
		Effect = "mk84_air",
		Sounds = {
			Far = Sound("dub/mk84_new_splode.mp3")
		},
		Radius = 1450,
		Damage = 16000
	},
	["Mark 77 Napalm"] = {
		Effect = "mark77_smoke",
		Sounds = {
			Far = Sound("dub/mark77_explod_final.mp3")
		},
		Angle = function(self, ang)
			return Angle(0, self.Owner:EyeAngles().y + 90, 0)
		end,
		Radius = 950,
		Damage = 750
	},
	["Mark 82 500LB"] = {
		Effect = "sdb_explosion",
		Sounds = {
			Far = Sound("streams/disasters/atmospheric/explosion_light1.mp3")
		},
		Radius = 1450,
		Damage = 16000
	},
	
	
	["M388 DavyCrockett"] = {
		Effect = "m388_explosion",
		Sounds = {
			Far = Sound("dub/davy_explosion_final.mp3")
		},
		Radius = 3500,
		Damage = 16000
	},
	["HVAR"] = {
		Effect = "h_500lb_spike",
		Sounds = panzer,
		Angle = function(self, ang)
			return ang + Angle(90, 0, 0)
		end,
		Radius = 500,
		Damage = 500
	},
	["AIM-9"] = {
		Effect = "fab_explosion",
		Sounds = {
			Med = {
				Sound("gbombs_5/explosions/light_bomb/small_explosion_2.mp3"),
				Sound("gbombs_5/explosions/light_bomb/small_explosion_2.mp3"),
				Sound("gbombs_5/explosions/light_bomb/small_explosion_2.mp3"),
				Sound("gbombs_5/explosions/light_bomb/small_explosion_2.mp3"),
				Sound("gbombs_5/explosions/light_bomb/small_explosion_2.mp3")
			}
		},
		Radius = 250,
		Damage = 500
	},
	
	["GBU-57A/B MOP - NO DMG"] = {
		Effect = "mop_explosion",
		Sounds = {
			Far = Sound("dub/mop_explod_s.mp3")
		},
		Angle = function(self, ang)
			return ang + Angle(90, 0, 0)
		end,
		Radius = 1500,
		Damage = 0
	},
	["1000LB GP - NO DMG"] = {
		Effect = "tb_explosion",
		Sounds = {
			Far = Sound("dub/t12_final.mp3")
		},
		Angle = function(self, ang)
			return ang + Angle(90, 0, 0)
		end,
		Radius = 3500,
		Damage = 0
	},
	
	["JDAM GBU-38 - NO DMG"] = {
		Effect = "mk84_air",
		Sounds = {
			Far = Sound("dub/mk84_new_splode.mp3")
		},
		Radius = 1450,
		Damage = 0
	},
	["Mark 77 Napalm - NO DMG"] = {
		Effect = "mark77_smoke",
		Sounds = {
			Far = Sound("dub/mark77_explod_final.mp3")
		},
		Angle = function(self, ang)
			return Angle(0, self.Owner:EyeAngles().y + 90, 0)
		end,
		Radius = 950,
		Damage = 0
	},
	["Mark 82 500LB - NO DMG"] = {
		Effect = "sdb_explosion",
		Sounds = {
			Far = Sound("streams/disasters/atmospheric/explosion_light1.mp3")
		},
		Radius = 1450,
		Damage = 0
	},
	
	
	["M388 DavyCrockett - NO DMG"] = {
		Effect = "m388_explosion",
		Sounds = {
			Far = Sound("dub/davy_explosion_final.mp3")
		},
		Radius = 3500,
		Damage = 0
	},
	["HVAR - NO DMG"] = {
		Effect = "h_500lb_spike",
		Sounds = panzer,
		Angle = function(self, ang)
			return ang + Angle(90, 0, 0)
		end,
		Radius = 500,
		Damage = 0
	},
	["AIM-9 - NO DMG"] = {
		Effect = "fab_explosion",
		Sounds = {
			Med = {
				Sound("gbombs_5/explosions/light_bomb/small_explosion_2.mp3"),
				Sound("gbombs_5/explosions/light_bomb/small_explosion_2.mp3"),
				Sound("gbombs_5/explosions/light_bomb/small_explosion_2.mp3"),
				Sound("gbombs_5/explosions/light_bomb/small_explosion_2.mp3"),
				Sound("gbombs_5/explosions/light_bomb/small_explosion_2.mp3")
			}
		},
		Radius = 250,
		Damage = 0
	},
	
}

for _, v in pairs(SWEP.Bombs) do
	if v.Effect then
		PrecacheParticleSystem(v.Effect)
	end
end

function SWEP:SetupDataTables()
	self:NetworkVar("String", 0, "Selection")
end

function SWEP:Deploy()
	

	local vm = self.Owner:GetViewModel()

	vm:SendViewModelMatchingSequence(vm:LookupSequence("draw"))
	vm:SetPlaybackRate(1)

	self:SetNextPrimaryFire(CurTime() + vm:SequenceDuration())
	self:SetNextSecondaryFire(CurTime() + vm:SequenceDuration())
end

function SWEP:CanPrimaryAttack()
	return true
end

function SWEP:PrimaryAttack()
	self:SetNextPrimaryFire(CurTime() + 0.4)

	local tr = self.Owner:GetEyeTrace()
	local pos = tr.HitPos + (tr.HitNormal * 5)

	local bomb = self.Bombs[self:GetSelection()]

	if not bomb then
		return
	end

	self.Owner:SetAnimation(PLAYER_ATTACK1)
	self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)

	self:FireBomb(bomb, pos, tr.HitNormal:Angle())
end

function SWEP:SecondaryAttack()
	self:SendWeaponAnim(ACT_VM_FIDGET)

	if CLIENT then
		local pnl = EternityDermaMenu()

		pnl:AddOption("None", function() self:SetBomb() end)

		for k in SortedPairs(self.Bombs) do
			pnl:AddOption(k, function() self:SetBomb(k) end)
		end

		pnl:Open(ScrW() * 0.5, ScrH() * 0.5)
	end
end

function SWEP:FireBomb(bomb, target, angle)
	if bomb.Angle then
		angle = bomb.Angle(self, angle)
	end

	if bomb.Effect then
		ParticleEffect(bomb.Effect, target, angle)
	end

	if SERVER then
		if bomb.Sounds then
			local close = istable(bomb.Sounds.Close) and table.Random(bomb.Sounds.Close) or bomb.Sounds.Close
			local med = istable(bomb.Sounds.Med) and table.Random(bomb.Sounds.Med) or bomb.Sounds.Med
			local far = istable(bomb.Sounds.Far) and table.Random(bomb.Sounds.Far) or bomb.Sounds.Far

			netstream.Send("BombSound", {
				Pos = target,
				Close = close,
				Med = med,
				Far = far
			})
		end

		if bomb.Radius and bomb.Damage then
			util.BlastDamage(self, self.Owner, target, bomb.Radius, bomb.Damage)
		end
	end
end

if CLIENT then
	function SWEP:SetBomb(bomb)
		netstream.Send("ExplosivesAdmin.SelectBomb", {
			Ent = self,
			Bomb = bomb
		})
	end

	function SWEP:GetViewModelPosition(pos, ang)
		return LocalToWorld(Vector(-2, -1, -1), Angle(), pos, ang)
	end

	function SWEP:PostDrawViewModel()
		if not GAMEMODE:GetSetting("hud_enabled") then
			return
		end

		local bomb = self.Bombs[self:GetSelection()]

		if not bomb or not bomb.Radius then
			return
		end

		local trace = self.Owner:GetEyeTrace()
		local pos = trace.HitPos + (trace.HitNormal * 5)

		cam.Start3D()
			render.SetColorMaterial()
			render.DrawSphere(pos, bomb.Radius, 50, 50, Color(255, 75, 75, 50))
			render.DrawWireframeSphere(pos, bomb.Radius, 50, 50, Color(255, 75, 75, 255), true)

			render.ClearStencil()
			render.SetStencilEnable(true)
				for _, v in pairs(player.GetAll()) do
					local tab = GAMEMODE:GetVISREntities(v)

					if not tab then
						continue
					end

					if tab[1]:GetPos():Distance(pos) > bomb.Radius then
						continue
					end

					render.SetStencilWriteMask(255)
					render.SetStencilTestMask(255)

					render.SetStencilReferenceValue(15)

					render.SetStencilPassOperation(STENCIL_REPLACE)
					render.SetStencilFailOperation(STENCIL_KEEP)
					render.SetStencilZFailOperation(STENCIL_REPLACE)

					render.SetStencilCompareFunction(STENCIL_ALWAYS)

					render.SetBlend(0)
						for _, ent in pairs(tab) do
							ent:DrawModel()
						end
					render.SetBlend(1)

					render.SetStencilCompareFunction(STENCIL_EQUAL)

					cam.Start2D()
						surface.SetDrawColor(255, 0, 0, 255)
						surface.DrawRect(0, 0, ScrW(), ScrH())
					cam.End2D()

					render.ClearStencil()
				end
			render.SetStencilEnable(false)
		cam.End3D()
	end

	local speed = 13504

	netstream.Hook("BombSound", function(data)
		local pos = data.Pos
		local dist = LocalPlayer():EyePos():Distance(pos)

		local close = data.Close
		local med = data.Med
		local far = data.Far

		local freq = 150
		local amp = math.ClampedRemap(dist, 0, 14000, 14, 0)
		local duration = math.ClampedRemap(dist, 0, 14000, 5, 0)

		local time = dist / speed

		if close and dist <= 5000 then
			local volume = math.Remap(dist, 0, 5000, 1, 0)

			timer.Simple(time, function()
				LocalPlayer():EmitSound(close, 100, 100, volume)
			end)
		end

		if med and dist <= 14000 then
			local volume = math.Remap(dist, 0, 14000, 1, 0)

			timer.Simple(time, function()
				LocalPlayer():EmitSound(med, 100, 100, volume)
			end)
		end

		if far and dist <= 40000 then
			local volume = math.Remap(dist, 5000, 40000, 1, 0)

			timer.Simple(time, function()
				LocalPlayer():EmitSound(far, 100, 100, volume)
			end)
		end

		if duration > 0 then
			timer.Simple(time, function()
				util.ScreenShake(vector_origin, amp, freq, duration, 0)
			end)
		end
	end)
else
	netstream.Hook("ExplosivesAdmin.SelectBomb", function(ply, data)
		local ent = data.Ent

		if not IsValid(ent) or ent:GetClass() != "eternity_admin_explosives" or ent.Owner != ply then
			return
		end

		ent:SetSelection(data.Bomb or "")
	end, {
		Ent = {Type = TYPE_ENTITY},
		Bomb = {Type = TYPE_STRING, Optional = true}
	})
end
