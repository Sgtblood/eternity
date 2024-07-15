AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "SVU"
SWEP.Author 			= "August"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_svu.mdl")


SWEP.WorldModel 		= Model("models/tnb/weapons/w_svu.mdl")

SWEP.HoldType 			= "sniper"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.Scope 				= {
	Enabled = true,
	Zoom = {10}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 10
SWEP.Delay 				= 0.0923

SWEP.HipCone 			= 0.05 -- Hipfire spread 
SWEP.AimCone 			= 0.035 -- ADS spread

SWEP.Recoil 			= 1.7

SWEP.FireSound 			= Sound("weapons/tfa_ins2/svu/svu-2.wav")
SWEP.DrySound 			= Sound("weapons/tfa_ins2/svu/m1a1_empty.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(-0.5, 0, 0),
	pos = Vector(-2.71, 1, 1.25)
}


SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(1, 2.5, -0.2)
}

SWEP.Animations = {
	fire = {"base_fire_1", "base_fire_2"},
	fire_last = "base_fire_last",
	reload = "base_reload",
	reload_empty = "base_reload_empty",
	draw = "base_draw"
}

SWEP.SoundScripts = { -- Stolen from the TFA version of the weapon
	base_fire_last = {
		{time = 5 / 30, snd = "weapons/tfa_ins2/svu/m1a1_magrelease.wav"},
	},
	base_reload = {
		{time = 30 / 30, snd = "weapons/tfa_ins2/svu/m1a1_boltback.wav"},
		{time = 95 / 30, snd = "weapons/tfa_ins2/svu/m1a1_magin.wav"},
		{time = 110 / 30, snd = "weapons/tfa_ins2/svu/m1a1_boltrelease.wav"},
	},
	base_reload_empty = {
		{time = 55 / 30, snd = "weapons/tfa_ins2/svu/m1a1_magin.wav"},
		{time = 65 / 30, snd = "weapons/tfa_ins2/svu/m1a1_boltrelease.wav"},
	}
}