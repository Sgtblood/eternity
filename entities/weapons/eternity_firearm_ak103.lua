AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "AK103"
SWEP.Author 			= "August"

SWEP.ViewModel 			= Model("models/weapons/c_rif_ak103.mdl")

SWEP.WorldModel 		= Model("models/weapons/w_rif_ak103.mdl")

SWEP.HoldType 			= "ar2"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_auto"},
	{Mode = "firemode_semi"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 30
SWEP.Delay 				= 0.1

SWEP.HipCone 			= 0.05 -- Hipfire spread 
SWEP.AimCone 			= 0.035 -- ADS spread

SWEP.Recoil 			= 1.6

SWEP.FireSound 			= Sound("weapons/ak103/fire.wav")
SWEP.DrySound 			= Sound("weapons/ak103/empty.wav")

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
		{time = 10 / 30, snd = "weapons/ak103/magrelease.wav"},
		{time = 15 / 30, snd = "weapons/ak103/magout.wav"},
		{time = 60 / 30, snd = "weapons/ak103/magin.wav"},
		{time = 80 / 30, snd = "weapons/ak103/boltback.wav"},
	},
	base_reloadempty = {
		{time = 10 / 30, snd = "weapons/ak103/magrelease.wav"},
		{time = 15 / 30, snd = "weapons/ak103/magout.wav"},
		{time = 60 / 30, snd = "weapons/ak103/magin.wav"},
		{time = 80 / 30, snd = "weapons/m4a1/m4a1_hit.wav"},
		{time = 105 / 30, snd = "weapons/ak103/boltback.wav"},
	}
}