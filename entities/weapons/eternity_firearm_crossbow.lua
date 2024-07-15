AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Crossbow"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/weapons/c_dmi_crossbow.mdl")

SWEP.WorldModel 		= Model("models/weapons/w_dmi_crossbow.mdl")

SWEP.HoldType 			= "ar2"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 1
SWEP.Delay 				= 0.2

SWEP.HipCone 			= 0.02 -- Hipfire spread 
SWEP.AimCone 			= 0.01 -- ADS spread

SWEP.Recoil 			= 1

SWEP.FireSound 			= Sound("weapons/crossbow/fire1.wav")
SWEP.DrySound 			= Sound("weapons/waltherwa2000/sks_empty.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(2, 0, 0),
	pos = Vector(-8.1, 3, 2.75)
}


SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(1, 2.5, -0.5)
}

SWEP.Animations = {
	fire = "fire",
	idle = "idle",
	idle_empty = "idle_empty",
	reload = "reload",
	draw = "draw"
}

SWEP.SoundScripts = { -- Stolen from the TFA version of the weapon
	reload = {
		{time = 0 / 30, snd = "weapons/crossbow/reload1.wav"},
		{time = 0 / 0, snd = "weapons/waltherwa2000/sks_magout.wav"},
		{time = 0 / 0, snd = "weapons/waltherwa2000/sks_magin.wav"},
	}
}