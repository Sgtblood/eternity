AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Serbu Super-Shorty"
SWEP.Author 			= "August"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_shorty.mdl")
SWEP.WorldModel 		= Model("models/tnb/weapons/w_shorty.mdl")

SWEP.HoldType 			= "smg"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.ShotgunReload 		= true

SWEP.Animated 			= true
SWEP.AnimatedADS 		= false

SWEP.ClipSize 			= 4
SWEP.Delay 				= 1

SWEP.HipCone 			= 0.05 -- Hipfire spread 
SWEP.AimCone 			= 0.025 -- ADS spread

SWEP.Recoil 			= 1.8

SWEP.FireSound 			= Sound("weapons/remington_870/870_shoot_3.wav")
SWEP.DrySound 			= Sound("weapons/remington_870/870_empty.wav")

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
		{time = 5 / 30, snd = "weapons/remington_870/870_pumpback.wav"},
	},
	reload_loop = {
		{time = 0 / 30, snd = "weapons/remington_870/870_insertshell_2.wav"},
		{time = 0 / 30, snd = "weapons/remington_870/870_shell_in_1.wav"},
	},
	reload_out = {
		{time = 5 / 30, snd = "weapons/remington_870/870_pumpforward.wav"},
	},
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
end
