AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "SKS"
SWEP.Author 			= "August"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_sks.mdl")

SWEP.WorldModel 		= Model("models/tnb/weapons/w_sks.mdl")

SWEP.HoldType 			= "ar2"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 20
SWEP.Delay 				= 0.2

SWEP.HipCone 			= 0.02 -- Hipfire spread 
SWEP.AimCone 			= 0.01 -- ADS spread

SWEP.Recoil 			= 1

SWEP.FireSound 			= Sound("weapons/tfa_ins2/project_immursion/sks/sks_fp.wav")
SWEP.DrySound 			= Sound("weapons/tfa_ins2/project_immursion/sks/handling/sks_empty.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0, 0, 0),
	pos = Vector(-2.35, 1.5, 1.3)
}

SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(2, 3, -1.5)
}


SWEP.Animations = {
	fire = {"base_fire"},
	fire_last = {"base_firelast"},
	reload = "base_reload",
	reload_empty = "base_reloadempty",
	draw = "base_draw"
}

SWEP.SoundScripts = { -- Stolen from the TFA version of the weapon
	base_reload = {
		{time = 10 / 30, snd = "weapons/tfa_ins2/project_immursion/sks/handling/sks_magout.wav"},
		{time = 60 / 30, snd = "weapons/tfa_ins2/project_immursion/sks/handling/sks_magin.wav"},
	},
	base_reloadempty = {
		{time = 35 / 30, snd = "weapons/tfa_ins2/project_immursion/sks/handling/sks_magout.wav"},
		{time = 60 / 30, snd = "weapons/tfa_ins2/project_immursion/sks/handling/sks_magin.wav"},
		{time = 95 / 30, snd = "weapons/tfa_ins2/project_immursion/sks/handling/sks_boltback.wav"},
		{time = 105 / 30, snd = "weapons/tfa_ins2/project_immursion/sks/handling/sks_boltrelease.wav"},
	}
}