AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "USP"
SWEP.Author 			= "August"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_usp.mdl")


SWEP.WorldModel 		= Model("models/tnb/weapons/w_usp.mdl")


SWEP.ModelSkin			= 0

SWEP.HoldType 			= "pistol"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 15
SWEP.Delay 				= 0.080

SWEP.HipCone 			= 0.02 -- Hipfire spread 
SWEP.AimCone 			= 0.01 -- ADS spread

SWEP.Recoil 			= 1.2

SWEP.FireSound 			= Sound("weapons/tfa_cod/mwr/usp/usp_fire1.wav")
SWEP.DrySound 			= Sound("weapons/tfa_ins2/project_immursion/m45/handling/m45_empty.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0.6, 0, 0),
	pos = Vector(-2, 0, 0)
}

SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(1, 2.5, -1.2)
}


SWEP.Animations = {
	fire = {"base_fire", "base_fire2", "base_fire3"},
	fire_last = "base_firelast",
	reload = "base_reload",
	reload_empty = "base_reload_empty",
	draw = "base_draw"
}

SWEP.SoundScripts = { -- Stolen from the TFA version of the weapon
	base_reload = {
		{time = 25 / 30, snd = "weapons/tfa_ins2/project_immursion/m45/handling/m45_boltrelease.wav"},
		{time = 30 / 30, snd = "weapons/tfa_ins2/project_immursion/m45/handling/m45_magout.wav"},
		{time = 40 / 30, snd = "weapons/tfa_ins2/project_immursion/m45/handling/m45_magin.wav"},
	},
	base_reload_empty = {
		{time = 15 / 30, snd = "weapons/tfa_ins2/project_immursion/m45/handling/m45_boltrelease.wav"},
		{time = 20 / 30, snd = "weapons/tfa_ins2/project_immursion/m45/handling/m45_magout.wav"},
		{time = 40 / 30, snd = "weapons/tfa_ins2/project_immursion/m45/handling/m45_magin.wav"},
		{time = 55 / 30, snd = "weapons/tfa_ins2/project_immursion/m45/handling/m45_maghit.wav"},
		{time = 70 / 30, snd = "weapons/tfa_ins2/project_immursion/m45/handling/m45_boltrelease.wav"},
	}
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
	if event == 20 then return true end
end