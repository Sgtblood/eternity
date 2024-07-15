AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "MAC-10 Special-Operations"
SWEP.Author 			= "August"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_mac10.mdl")
SWEP.VMBodyGroups		= {[1] = 3}

SWEP.WorldModel 		= Model("models/tnb/weapons/w_mac10.mdl")
SWEP.WMBodyGroups		= {[1] = 3}

SWEP.HoldType 			= "pistol"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Firemodes 			= {
	{Mode = "firemode_auto"}
}


SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 32
SWEP.Delay 				= 0.04

SWEP.HipCone 			= 0.06 -- Hipfire spread 
SWEP.AimCone 			= 0.035 -- ADS spread

SWEP.Recoil 			= 1.6

SWEP.FireSound 			= Sound("weapons/tfa_ins2/project_immursion/mp5k/mp5k_suppressed_fp.wav")
SWEP.DrySound 			= Sound("weapons/tfa_ins2/project_immursion/mp5k/handling/mp5k_empty.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0, 0, 5),
	pos = Vector(-3.175, 1, 1.75)
}

SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(1, 2, -0.5)
}

SWEP.Animations = {
	draw = "draw",
	fire = "fire01",
	reload = "reload_tactic",
	reload_empty = "reload_empty"
}

SWEP.SoundScripts = { -- Stolen from the TFA version of the weapon
	reload_tactic = {
		{time = 20 / 30, snd = "weapons/tfa_ins2/project_immursion/mp5k/handling/mp5k_magout.wav"},
		{time = 40 / 30, snd = "weapons/tfa_ins2/project_immursion/mp5k/handling/mp5k_magin.wav"},
	},
	reload_empty = {
		{time = 10 / 30, snd = "weapons/tfa_ins2/project_immursion/mp5k/handling/mp5k_magout.wav"},
		{time = 45 / 30, snd = "weapons/tfa_ins2/project_immursion/mp5k/handling/mp5k_magin.wav"},
		{time = 60 / 30, snd = "weapons/tfa_ins2/project_immursion/mp5k/handling/mp5k_boltlock.wav"},
	}
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
end
