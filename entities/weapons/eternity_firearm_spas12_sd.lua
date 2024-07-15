AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Franchi SPAS-12 Suppressed"
SWEP.Author 			= "August"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_spas12.mdl")
SWEP.VMBodyGroups		= {[1] = 2}

SWEP.WorldModel 		= Model("models/tnb/weapons/w_spas12.mdl")
SWEP.WMBodyGroups		= {[1] = 2}

SWEP.HoldType 			= "ar2"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.ShotgunReload 		= true

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 8
SWEP.Delay 				= 0.24

SWEP.HipCone 			= 0.05 -- Hipfire spread 
SWEP.AimCone 			= 0.025 -- ADS spread

SWEP.Recoil 			= 1.8

SWEP.FireSound 			= Sound("weapons/tfa_ins2/spas12/m590_suppressed_fp.wav")
SWEP.DrySound 			= Sound("weapons/tfa_ins2/m1014/toz_empty.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0, 0, 6),
	pos = Vector(-4, 1, 1.5)
}

SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(1, 2.5, 0)
}

SWEP.Animations = {
	draw = "pullout",
	fire = {"fire"},
	fire_last = "fire_last",
	reload = "reload_in",
	reloadinsert = "reload_loop",
	reloadfinish = "reload_out"
}

SWEP.SoundScripts = { -- Stolen from the TFA version of the weapon
	reload_in = {
		{time = 5 / 30, snd = "weapons/tfa_ins2/m1014/toz_pumpback.wav"},
	},
	reload_loop = {
		{time = 0 / 30, snd = "weapons/tfa_ins2/m1014/toz_shell_insert_2.wav"},
		{time = 0 / 30, snd = "weapons/tfa_ins2/m1014/toz_shell_insert_1.wav"},
	},
	reload_out = {
		{time = 5 / 30, snd = "weapons/tfa_ins2/m1014/toz_pumpforward.wav"},
	},
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
end
