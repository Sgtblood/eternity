AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "DP27"
SWEP.Author 			= "August"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_dp27.mdl")

SWEP.WorldModel 		= Model("models/tnb/weapons/w_dp27.mdl")

SWEP.HoldType 			= "ar2"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_auto"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 47
SWEP.Delay 				= 0.109

SWEP.HipCone 			= 0.5 -- Hipfire spread 
SWEP.AimCone 			= 0.005 -- ADS spread

SWEP.Recoil 			= 1.7

SWEP.FireSound 			= Sound("weapons/tfa_ins2/l85a2/l85a2_fp.wav")
SWEP.DrySound 			= Sound("weapons/tfa_ins2/l85a2/l85a2_empty.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0, 0, 0),
	pos = Vector(-1.75, 1, 0.5)
}

SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(2.5, 2.5, -0.5)
}

SWEP.Animations = {
	fire = {"base_fire_1","base_fire_2", "base_fire_3"},
	reload = "base_reload",
	reload_empty = "base_reload_empty",
	draw = "base_draw",
}

SWEP.SoundScripts = { -- Stolen from the TFA version of the weapon
	base_reload = {
		{time = 50 / 30, snd = "weapons/tfa_cod/mwr/rpd/wpfoly_rpd_reload_open_v1.wav"},
		{time = 100 / 30, snd = "weapons/tfa_cod/mwr/rpd/wpfoly_rpd_reload_clipout_v1.wav"},
		{time = 120 / 30, snd = "weapons/tfa_cod/mwr/rpd/wpfoly_rpd_reload_hit_v1.wav"},
		{time = 180 / 30, snd = "weapons/tfa_cod/mwr/rpd/wpfoly_rpd_reload_clipin_v1.wav"},
		{time = 200 / 30, snd = "weapons/tfa_cod/mwr/rpd/wpfoly_rpd_reload_hit_v1.wav"},
		{time = 220 / 30, snd = "weapons/tfa_cod/mwr/rpd/wpfoly_rpd_reload_chamber_v1.wav"},
		{time = 250 / 30, snd = "weapons/tfa_cod/mwr/rpd/wpfoly_rpd_reload_close_v1.wav"},
	},
	base_reload_empty = {
		{time = 30 / 30, snd = "weapons/tfa_at_ak_74_eft/ak74_boltback.wav"},
		{time = 40 / 30, snd = "weapons/tfa_at_ak_74_eft/ak74_boltrelease.wav"},
		{time = 95 / 30, snd = "weapons/tfa_cod/mwr/rpd/wpfoly_rpd_reload_open_v1.wav"},
		{time = 150 / 30, snd = "weapons/tfa_cod/mwr/rpd/wpfoly_rpd_reload_clipout_v1.wav"},
		{time = 170 / 30, snd = "weapons/tfa_cod/mwr/rpd/wpfoly_rpd_reload_hit_v1.wav"},
		{time = 240 / 30, snd = "weapons/tfa_cod/mwr/rpd/wpfoly_rpd_reload_clipin_v1.wav"},
		{time = 255 / 30, snd = "weapons/tfa_cod/mwr/rpd/wpfoly_rpd_reload_hit_v1.wav"},
		{time = 270 / 30, snd = "weapons/tfa_cod/mwr/rpd/wpfoly_rpd_reload_chamber_v1.wav"},
		{time = 310 / 30, snd = "weapons/tfa_cod/mwr/rpd/wpfoly_rpd_reload_close_v1.wav"},
	}
}


function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
end
