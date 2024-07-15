AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Spectre M4"
SWEP.Author 			= "August"

SWEP.ViewModel 			= Model("models/weapons/tfa_ins2/c_spectre.mdl")

SWEP.WorldModel 		= Model("models/weapons/tfa_ins2/w_spectre.mdl")

SWEP.HoldType 			= "smg"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Firemodes 			= {
	{Mode = "firemode_auto"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 30
SWEP.Delay 				= 0.0706

SWEP.HipCone 			= 0.02 -- Hipfire spread 
SWEP.AimCone 			= 0.01 -- ADS spread

SWEP.Recoil 			= 0.95

SWEP.FireSound 			= Sound("weapons/tfa_ins2/spectre/mp5k_fp.wav")
SWEP.DrySound 			= Sound("weapons/tfa_ins2/spectre/mp5k_empty.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0, 0, 0),
	pos = Vector(-3.5, 0, 1.75)
}

SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(1, 2.5, -1)
}


SWEP.Animations = {
	fire = {"fire", "fire2", "fire3"},
	fire_last = {"fire1", "fire2"},
	reload = "reload",
	draw = "deploy"
}

SWEP.SoundScripts = { -- Plays noises
	reload = {
		{time = 5 / 30, snd = "weapons/tfa_ins2/spectre/mp5k_magout.wav"},
		{time = 25 / 30, snd = "weapons/tfa_ins2/spectre/mp5k_magin.wav"},
		{time = 50 / 30, snd = "weapons/tfa_ins2/spectre/mp5k_boltback.wav"},
		{time = 55 / 30, snd = "weapons/tfa_ins2/spectre/mp5k_boltrelease.wav"},
	}
}
