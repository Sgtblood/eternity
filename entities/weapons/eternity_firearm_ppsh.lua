AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "PPSH-41"
SWEP.Author 			= "August"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_ppsh.mdl")

SWEP.WorldModel 		= Model("models/tnb/weapons/w_ppsh.mdl")

SWEP.HoldType 			= "smg"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_auto"}
}


SWEP.Animated 			= true
SWEP.AnimatedADS 		= false

SWEP.ClipSize 			= 71
SWEP.Delay 				= 0.06

SWEP.HipCone 			= 0.05 -- Hipfire spread 
SWEP.AimCone 			= 0.025 -- ADS spread

SWEP.Recoil 			= 1.6

SWEP.FireSound 			= Sound("weapons/tfa_ppsh41/mp5k_fp.wav")
SWEP.DrySound 			= Sound("weapons/tfa_ppsh41/mp5k_empty.wav")

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
		{time = 15 / 30, snd = "weapons/tfa_ppsh41/mp5k_boltrelease.wav"},
		{time = 30 / 30, snd = "weapons/tfa_ppsh41/galil_drum_magout.wav"},
		{time = 78 / 30, snd = "weapons/tfa_ppsh41/mp5k_magin.wav"},
		{time = 100 / 30, snd = "weapons/tfa_ppsh41/mp5k_boltrelease.wav"},
	}
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
end
