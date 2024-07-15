AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Walther MPL"
SWEP.Author 			= "August"

SWEP.ViewModel 			= Model("models/weapons/c_remaster_mpl.mdl")

SWEP.WorldModel 		= Model("models/weapons/w_remaster_mpl.mdl")

SWEP.HoldType 			= "smg"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_auto"}
}


SWEP.Animated 			= true
SWEP.AnimatedADS 		= false

SWEP.ClipSize 			= 32
SWEP.Delay 				= 0.109

SWEP.HipCone 			= 0.05 -- Hipfire spread 
SWEP.AimCone 			= 0.025 -- ADS spread

SWEP.Recoil 			= 1.7

SWEP.FireSound 			= Sound("weapons/tfa_cod/mwr/mac10/mac10_fire3.wav")
SWEP.DrySound 			= Sound("weapons/tfa_cod/mwr/mac10/wpn_mac10_reload_empty_04.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(4, 0, 0),
	pos = Vector(-4.3, 0, 0)
}

SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(1, 1, -0.5)
}

SWEP.Animations = {
	draw = "draw",
	fire = "fire",
	reload = "reload_2",
	reload_empty = "reload_empty"
}

SWEP.SoundScripts = { -- Stolen from the TFA version of the weapon
	reload_2 = {
		{time = 5 / 30, snd = "weapons/tfa_ins2/project_immursion/mp5k/handling/mp5k_magout.wav"},
		{time = 30 / 30, snd = "weapons/tfa_ins2/project_immursion/mp5k/handling/mp5k_magin.wav"},
	},
	reload_empty = {
		{time = 5 / 30, snd = "weapons/tfa_ins2/project_immursion/mp5k/handling/mp5k_magout.wav"},
		{time = 40 / 30, snd = "weapons/tfa_ins2/project_immursion/mp5k/handling/mp5k_magin.wav"},
		{time = 60 / 30, snd = "weapons/tfa_ins2/project_immursion/mp5k/handling/mp5k_boltback.wav"},
		{time = 65 / 30, snd = "weapons/tfa_ins2/project_immursion/mp5k/handling/mp5k_boltrelease.wav"},
	}
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
end
