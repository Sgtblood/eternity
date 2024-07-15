AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "M1918 Browning Automatic Rifle"
SWEP.Author 			= "August"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_bar.mdl")

SWEP.WorldModel 		= Model("models/tnb/weapons/w_bar.mdl")

SWEP.HoldType 			= "ar2"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_auto"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 20
SWEP.Delay 				= 0.12

SWEP.HipCone 			= 0.5 -- Hipfire spread 
SWEP.AimCone 			= 0.005 -- ADS spread

SWEP.Recoil 			= 1.7

SWEP.FireSound 			= Sound("weapons/tfa_cod/mwr/kam12/kamchatka_fire1.wav")
SWEP.DrySound 			= Sound("weapons/m249/m249_empty.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0, 0, 0),
	pos = Vector(-1.75, 1, 0.5)
}

SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(2.5, 2.5, -0.5)
}

SWEP.Animations = {
	fire = {"base_fire_1","base_fire_2", "base_fire_3"},
	reload = "base_reload",
	reload_empty = "base_reload_empty",
	draw = "base_draw",
}

SWEP.SoundScripts = { -- Stolen from the TFA version of the weapon
	base_reload = {
		{time = 50 / 30, snd = "weapons/m249/m249_coveropen.wav"},
		{time = 100 / 30, snd = "weapons/m249/m249_magout.wav"},
		{time = 120 / 30, snd = "weapons/tfa_cod/mwr/m60e4/wpfoly_m60_reload_lift_v1.wav"},
		{time = 180 / 30, snd = "weapons/tfa_cod/mwr/m60e4/wpfoly_m60_reload_clipin_v1.wav"},
		{time = 200 / 30, snd = "wweapons/tfa_cod/mwr/m60e4/wpfoly_m60_reload_hit_v1.wav"},
		{time = 220 / 30, snd = "weapons/m249/m249_beltalign.wav"},
		{time = 250 / 30, snd = "weapons/m249/m249_coverclose.wav"},
	},
	base_reload_empty = {
		{time = 30 / 30, snd = "weapons/m249/m249_coveropen.wav"},
		{time = 40 / 30, snd = "weapons/m249/m249_boltrelease.wav"},
		{time = 95 / 30, snd = "weapons/m249/m249_coveropen.wav"},
		{time = 150 / 30, snd = "weapons/m249/m249_magout.wav"},
		{time = 170 / 30, snd = "weapons/tfa_cod/mwr/m60e4/wpfoly_m60_reload_lift_v1.wav"},
		{time = 240 / 30, snd = "weapons/tfa_cod/mwr/m60e4/wpfoly_m60_reload_clipin_v1.wav"},
		{time = 255 / 30, snd = "weapons/tfa_cod/mwr/m60e4/wpfoly_m60_reload_hit_v1.wav"},
		{time = 270 / 30, snd = "weapons/m249/m249_beltalign.wav"},
		{time = 310 / 30, snd = "weapons/m249/m249_coverclose.wav"},
	}
}


function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
end
