AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Škorpion vz. 61"
SWEP.Author 			= "August"

SWEP.ViewModel 			= Model("models/Weapons/Skorpion/c_skorpion.mdl")

SWEP.WorldModel 		= Model("models/tnb/weapons/w_skorpion.mdl")

SWEP.HoldType 			= "pistol"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Firemodes 			= {
	{Mode = "firemode_auto"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 20
SWEP.Delay 				= 0.10

SWEP.HipCone 			= 0.02 -- Hipfire spread 
SWEP.AimCone 			= 0.01 -- ADS spread

SWEP.Recoil 			= 0.95

SWEP.FireSound 			= Sound("weapons/tfa_l4d2/skorpion/10mmsmg-1.wav")
SWEP.DrySound 			= Sound("weapons/tfa_inss/p226/p226_empty.wav")

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
		{time = 5 / 30, snd = "weapons/tfa_l4d2/skorpion/magout.wav"},
		{time = 25 / 30, snd = "weapons/tfa_l4d2/skorpion/magin.wav"},
		{time = 50 / 30, snd = "weapons/tfa_l4d2/skorpion/boltback.wav"},
		{time = 55 / 30, snd = "weapons/tfa_l4d2/skorpion/boltrelease.wav"},
	}
}
