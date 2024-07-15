AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "P90 Special Operations"
SWEP.Author 			= "August"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_p90.mdl")
SWEP.VMBodyGroups		= {[1] = 2}

SWEP.WorldModel 		= Model("models/tnb/weapons/w_p90.mdl")
SWEP.WMBodyGroups		= {[1] = 2}

SWEP.HoldType 			= "ar2"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_auto"}
}


SWEP.Animated 			= true
SWEP.AnimatedADS 		= false

SWEP.ClipSize 			= 50
SWEP.Delay 				= 0.0545

SWEP.HipCone 			= 0.05 -- Hipfire spread 
SWEP.AimCone 			= 0.025 -- ADS spread

SWEP.Recoil 			= 1.4

SWEP.FireSound 			= Sound("weapons/tfa_cod/mwr/p90/p90_sil1.wav")
SWEP.DrySound 			= Sound("weapons/tfa_ins2/project_immursion/mp5k/handling/mp5k_empty.wav")

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
		{time = 20 / 30, snd = "weapons/tfa_ins2/project_immursion/mp5k/handling/mp5k_magout.wav"},
		{time = 52 / 30, snd = "weapons/tfa_ins2/project_immursion/mp5k/handling/mp5k_magin.wav"},
	},
	base_reloadempty = {
		{time = 15 / 30, snd = "weapons/tfa_ins2/project_immursion/mp5k/handling/mp5k_boltback.wav"},
		{time = 30 / 30, snd = "weapons/tfa_ins2/project_immursion/mp5k/handling/mp5k_magout.wav"},
		{time = 78 / 30, snd = "weapons/tfa_ins2/project_immursion/mp5k/handling/mp5k_magin.wav"},
		{time = 100 / 30, snd = "weapons/tfa_ins2/project_immursion/mp5k/handling/mp5k_boltrelease.wav"},
	}
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
end
