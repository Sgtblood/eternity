AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "AK74"
SWEP.Author 			= "August"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_ak74.mdl")

SWEP.WorldModel 		= Model("models/tnb/weapons/w_ak74.mdl")

SWEP.HoldType 			= "smg"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_auto"}
}


SWEP.Animated 			= true
SWEP.AnimatedADS 		= false

SWEP.ClipSize 			= 30
SWEP.Delay 				= 0.0923

SWEP.HipCone 			= 0.05 -- Hipfire spread 
SWEP.AimCone 			= 0.025 -- ADS spread

SWEP.Recoil 			= 1.6

SWEP.FireSound 			= Sound("weapons/tfa_ins2/project_immursion/ak74/ak74_fp.wav")
SWEP.DrySound 			= Sound("weapons/tfa_ins2/project_immursion/aks74u/handling/aks_empty.wav")

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
	{time = 10 / 30, snd = "weapons/tfa_ins2/project_immursion/aks74u/handling/aks_boltrelease.wav"},
	{time = 15 / 30, snd = "weapons/tfa_ins2/project_immursion/aks74u/handling/aks_magout.wav"},
	{time = 60 / 30, snd = "weapons/tfa_ins2/project_immursion/aks74u/handling/aks_magin.wav"},
	{time = 80 / 30, snd = "weapons/tfa_ins2/project_immursion/aks74u/handling/aks_boltback.wav"},
	},
	base_reloadempty = {
		{time = 15 / 30, snd = "weapons/tfa_ins2/project_immursion/aks74u/handling/aks_boltback.wav"},
		{time = 30 / 30, snd = "weapons/tfa_ins2/project_immursion/aks74u/handling/aks_magout.wav"},
		{time = 78 / 30, snd = "weapons/tfa_ins2/project_immursion/aks74u/handling/aks_magin.wav"},
		{time = 100 / 30, snd = "weapons/tfa_ins2/project_immursion/aks74u/handling/aks_boltrelease.wav"},
	}
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
end
