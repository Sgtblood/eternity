AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Sawn Off Double Barrel"
SWEP.Author 			= "August"

SWEP.ViewModel 			= Model("models/weapons/tfa_custom/c_custom_ranger.mdl")

SWEP.WorldModel 		= Model("models/weapons/tfa_custom/w_custom_ranger.mdl")

SWEP.HoldType 			= "revolver"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}


SWEP.Animated 			= true
SWEP.AnimatedADS 		= false

SWEP.ClipSize 			= 2
SWEP.Delay 				= 0.75

SWEP.HipCone 			= 0.05 -- Hipfire spread 
SWEP.AimCone 			= 0.025 -- ADS spread

SWEP.Recoil 			= 2.8

SWEP.FireSound 			= Sound("weapons/tfa_custom/ranger/12g-1.wav")
SWEP.DrySound 			= Sound("weapons/tfa_doublebarrel/empty.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0.75, 0, 0),
	pos = Vector(-3, 2, 2.5)
}

SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(1, 2.5, -1.2)
}

SWEP.Animations = {
	draw = "pullout",
	fire = "fire",
	reload = "reload"
}

SWEP.SoundScripts = { -- Stolen from the TFA version of the weapon
	reload = {
		{time = 10 / 30, snd = "weapons/tfa_custom/ranger/700n-open.wav"},
		{time = 15 / 30, snd = "weapons/tfa_custom/ranger/700n-eject.wav"},
		{time = 25 / 30, snd = "weapons/tfa_custom/ranger/700n-shell1.wav"},
		{time = 35 / 30, snd = "weapons/tfa_custom/ranger/700n-shell2.wav"},
		{time = 60 / 30, snd = "weapons/tfa_custom/ranger/700n-close.wav"},
	}
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
end