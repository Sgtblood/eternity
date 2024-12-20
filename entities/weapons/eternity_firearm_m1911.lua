AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "M1911"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/weapons/tfa_ins2/v_m1911.mdl")

SWEP.WorldModel 		= Model("models/weapons/tfa_ins2/w_m1911.mdl")

SWEP.ModelSkin			= 0

SWEP.HoldType 			= "pistol"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 8
SWEP.Delay 				= 0.185

SWEP.HipCone 			= 0.02 -- Hipfire spread 
SWEP.AimCone 			= 0.01 -- ADS spread

SWEP.Recoil 			= 1.0

SWEP.FireSound 			= Sound("weapons/tfa_cod/mwr/m1911/m1911_fire1.wav")
SWEP.DrySound 			= Sound("weapons/m1911/handling/m1911_empty2.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0, 0, 0),
	pos = Vector(-2.05, 0, 0)
}

SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(1, 2.5, -1.2)
}


SWEP.Animations = {
	fire = {"base_fire", "base_fire2", "base_fire3"},
	fire_last = "base_firelast",
	reload = "base_reload",
	reload_empty = "base_reloadempty",
	draw = "base_draw"
}

SWEP.SoundScripts = { -- Stolen from the TFA version of the weapon
	base_reload = {
		{time = 10 / 30, snd = "weapons/m1911/handling/m1911_magout.wav"},
		{time = 50 / 30, snd = "weapons/m1911/handling/m1911_magin.wav"},
		{time = 62 / 30, snd = "weapons/m1911/handling/m1911_maghit.wav"},
	},
	base_reload_empty = {
		{time = 10 / 30, snd = "weapons/m1911/handling/m1911_magout.wav"},
		{time = 50 / 30, snd = "weapons/m1911/handling/m1911_magin.wav"},
		{time = 62 / 30, snd = "weapons/m1911/handling/m1911_maghit.wav"},
		{time = 75 / 30, snd = "weapons/m1911/handling/m1911_boltrelease.wav"},
	}
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
	if event == 20 then return true end
end
