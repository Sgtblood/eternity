AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "AKM"
SWEP.Author 			= "August"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_akm.mdl")
SWEP.VMBodyGroups		= {[1] = 0}

SWEP.WorldModel 		= Model("models/tnb/weapons/w_akm.mdl")
SWEP.WMBodyGroups		= {[1] = 0}

SWEP.HoldType 			= "ar2"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_auto"},
	{Mode = "firemode_semi"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 30
SWEP.Delay 				= 0.10

SWEP.HipCone 			= 0.02 -- Hipfire spread 
SWEP.AimCone 			= 0.01 -- ADS spread

SWEP.Recoil 			= 1.6

SWEP.FireSound 			= Sound("weapons/tfa_ins2/project_immursion/ak47/ak47_fp.wav")
SWEP.DrySound 			= Sound("weapons/tfa_ins2/akm_bw/empty.wav")

SWEP.RecoilMult 		= 0

SWEP.Offset = {
    pos = Vector(-1, 4, -6),
    ang = Angle(180, 185, 0)
}

SWEP.AimOffset = {
	ang = Angle(0.5, 0, 0),
	pos = Vector(-2.45, 1, 1.25)
}


SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(1, 2.5, 0)
}

SWEP.Animations = {
	fire = "base_fire",
	reload = "base_reload",
	reload_empty = "base_reloadempty",
	draw = "base_draw"
}

SWEP.SoundScripts = { -- Stolen from the TFA version of the weapon
	base_reload = {
		{time = 5 / 30, snd = "wweapons/tfa_ins2/akm_bw/magrelease.wav"},
		{time = 20 / 30, snd = "weapons/tfa_ins2/akm_bw/magout.wav"},
		{time = 60 / 30, snd = "weapons/tfa_ins2/akm_bw/magout.wav"},
	},
	base_reloadempty = {
		{time = 5 / 30, snd = "weapons/tfa_ins2/akm_bw/magrelease.wav"},
		{time = 20 / 30, snd = "weapons/tfa_ins2/akm_bw/magout.wav"},
		{time = 60 / 30, snd = "weapons/tfa_ins2/akm_bw/magout.wav"},
		{time = 90 / 30, snd = "weapons/tfa_ins2/akm_bw/boltback.wav"},
		{time = 98 / 30, snd = "weapons/tfa_ins2/akm_bw/boltrelease.wav"},
	}
}

function SWEP:DrawWorldModel()
    local ply = self.Owner

    if IsValid(self.Owner) then
        local hand = ply:LookupBone("ValveBiped.Bip01_R_Hand")

        if hand then
            local pos, ang

            local mat = ply:GetBoneMatrix(hand)

            if mat then
                pos, ang = mat:GetTranslation(), mat:GetAngles()
            else
                pos, ang = ply:GetBonePosition(hand)
            end

            pos = pos + (ang:Forward() * self.Offset.pos.x) + (ang:Right() * self.Offset.pos.y) + (ang:Up() * self.Offset.pos.z)

            ang:RotateAroundAxis(ang:Up(), self.Offset.ang.p)
            ang:RotateAroundAxis(ang:Right(), self.Offset.ang.y)
            ang:RotateAroundAxis(ang:Forward(), self.Offset.ang.r)
            
            self:SetRenderOrigin(pos)
            self:SetRenderAngles(ang)
        end
    end
        
    self:SetModelScale(1)
    self:SetSequence("wm")
    self:SetupBones()
    self:DrawModel()
end

function SWEP:FireAnimationEvent(pos, ang, event, options)
    if event == 5001 then return true end
    if event == 20 then return true end
end