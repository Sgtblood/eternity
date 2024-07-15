AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "MP7 Suppressed"
SWEP.Author 			= "August"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_mp7.mdl")
SWEP.VMBodyGroups		= {[1] = 1}

SWEP.WorldModel 		= Model("models/tnb/weapons/w_mp7.mdl")
SWEP.WMBodyGroups		= {[1] = 1}

SWEP.HoldType 			= "smg"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_auto"}
}


SWEP.Animated 			= true
SWEP.AnimatedADS 		= true 

SWEP.ClipSize 			= 30
SWEP.Delay 				= 0.0631

SWEP.HipCone 			= 0.05 -- Hipfire spread 
SWEP.AimCone 			= 0.025 -- ADS spread

SWEP.Recoil 			= 1.6

SWEP.FireSound 			= Sound("weapons/tfa_ins2/mp7/fp_suppressed.wav")
SWEP.DrySound 			= Sound("weapons/tfa_ins2/mp7/empty.wav")

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
	base_reloadempty = {
		{time = 15 / 30, snd = "weapons/tfa_ins2/mp5k/mp5k_boltback.wav"},
		{time = 30 / 30, snd = "weapons/tfa_ins2/mp5k/mp5k_magout.wav"},
		{time = 78 / 30, snd = "weapons/tfa_ins2/mp5k/mp5k_magin.wav"},
		{time = 100 / 30, snd = "weapons/tfa_ins2/mp5k/mp5k_boltrelease.wav"},
	}
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
end
