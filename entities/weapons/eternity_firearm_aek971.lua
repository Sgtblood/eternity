AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "AEK-971"
SWEP.Author 			= "August"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_aek.mdl")

SWEP.WorldModel 		= Model("models/tnb/weapons/w_aek.mdl")

SWEP.HoldType 			= "ar2"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_auto"},
	{Mode = "firemode_semi"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 30
SWEP.Delay 				= 0.0667

SWEP.HipCone 			= 0.05 -- Hipfire spread 
SWEP.AimCone 			= 0.035 -- ADS spread

SWEP.Recoil 			= 1.6

SWEP.FireSound 			= Sound("weapons/tfa_ins2/aek971/fire-1.wav")
SWEP.DrySound 			= Sound("weapons/tfa_ins2/aek971/handling/ak74_empty.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0, 0, 0),
	pos = Vector(-1.85, 2, 0.3)
}

SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(1.5, 3.5, -0.5)
}

SWEP.Animations = {
	fire = "base_fire",
	reload = "base_reload",
	reload_empty = "base_reloadempty",
	draw = "base_draw",
}

SWEP.SoundScripts = { -- Stolen from the TFA version of the weapon
	base_reload = {
		{time = 10 / 30, snd = "weapons/tfa_ins2/aek971/handling/ak74_magrelease.wav"},
		{time = 15 / 30, snd = "weapons/tfa_ins2/aek971/handling/ak74_magout.wav"},
		{time = 60 / 30, snd = "weapons/tfa_ins2/aek971/handling/ak74_magin.wav"},
		{time = 80 / 30, snd = "weapons/tfa_ins2/aek971/handling/ak74_boltback.wav"},
	},
	base_reloadempty = {
		{time = 10 / 30, snd = "weapons/tfa_ins2/aek971/handling/ak74_magrelease.wav"},
		{time = 15 / 30, snd = "weapons/tfa_ins2/aek971/handling/ak74_magout.wav"},
		{time = 60 / 30, snd = "weapons/tfa_ins2/aek971/handling/ak74_magin.wav"},
		{time = 80 / 30, snd = "weapons/tfa_ins2/aek971/handling/ak74_boltback.wav"},
		{time = 105 / 30, snd = "weapons/tfa_ins2/aek971/handling/ak74_boltrelease.wav"},
	}
}