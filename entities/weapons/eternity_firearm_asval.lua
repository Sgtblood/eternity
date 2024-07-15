AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "ASVAL"
SWEP.Author 			= "August"

SWEP.ViewModel 			= Model("models/weapons/tfa_ins2/v_asval.mdl")

SWEP.WorldModel 		= Model("models/weapons/tfa_ins2/w_asval.mdl")

SWEP.HoldType 			= "ar2"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_auto"}
}


SWEP.Animated 			= true
SWEP.AnimatedADS 		= false

SWEP.ClipSize 			= 20
SWEP.Delay 				= 0.0667

SWEP.HipCone 			= 0.05 -- Hipfire spread 
SWEP.AimCone 			= 0.025 -- ADS spread

SWEP.Recoil 			= 1.4

SWEP.FireSound 			= Sound("weapons/tfa_ins2/asval/asval_suppressed.wav")
SWEP.DrySound 			= Sound("weapons/inss_mp5a5/inss_mp5k_empty.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0.3, 0, 0),
	pos = Vector(-2.54, 0, 1.5)
}

SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(1, 2, 0)
}

SWEP.Animations = {
	draw = "base_draw",
	fire = "base_fire",
	reload = "base_reload",
	reload_empty = "base_reloadempty"
}

SWEP.SoundScripts = { -- Stolen from the TFA version of the weapon
	base_reload = {
		{time = 20 / 30, snd = "weapons/tfa_ins2/asval/asval_magout.wav"},
		{time = 52 / 30, snd = "weapons/tfa_ins2/asval/asval_magin.wav"},
	},
	base_reloadempty = {
		{time = 15 / 30, snd = "weapons/tfa_ins2/asval/asval_boltback.wav"},
		{time = 30 / 30, snd = "weapons/tfa_ins2/asval/asval_magout.wav"},
		{time = 78 / 30, snd = "weapons/tfa_ins2/asval/asval_magin.wav"},
		{time = 100 / 30, snd = "weapons/tfa_ins2/asval/asval_boltrelease.wav"},
	}
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
end
