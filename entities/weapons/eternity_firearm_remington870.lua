AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Remington M870"
SWEP.Author 			= "August"

SWEP.ViewModel 			= Model("models/weapons/smc/r870/c_remington_m870.mdl")

SWEP.WorldModel 		= Model("models/weapons/smc/r870/w_remington_m870.mdl")

SWEP.HoldType 			= "ar2"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.ShotgunReload 		= true
SWEP.PumpAction 		= true

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 7
SWEP.Delay 				= 0.5

SWEP.HipCone 			= 0.05 -- Hipfire spread 
SWEP.AimCone 			= 0.025 -- ADS spread

SWEP.Recoil 			= 2.8

SWEP.FireSound 			= Sound("weapons/tfa_cod/mwr/m1014/m1014_fire1.wav")
SWEP.DrySound 			= Sound("weapons/tfa_ins2/m1014/toz_empty.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0, 0, 0),
	pos = Vector(-2.4, 2, 1.4)
}

SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(1, 2.5, 0)
}

SWEP.Animations = {
	draw = "base_draw",
	fire = "base_fire_1",
	firelast = "base_firelast",
	pump = "base_fire_cock_1",
	reload = "base_reload_start",
	reload_empty = "base_reload_start_empty",
	reloadinsert = "base_reload_insert",
	reloadfinish = "base_reload_end"
}

SWEP.SoundScripts = { -- Stolen from the TFA version of the weapon
	base_reload_start_empty = {
		{time = 10 / 30, snd = "weapons/tfa_ins2/m1014/toz_pumpback.wav"},
		{time = 40 / 30, snd = "weapons/tfa_ins2/m1014/toz_shell_insert_1.wav"},
		{time = 60 / 30, snd = "weapons/tfa_ins2/m1014/toz_pumpforward.wav"},
	},
	base_reload_insert = {
		{time = 5 / 30, snd = "weapons/tfa_ins2/m1014/toz_shell_insert_1.wav"},
	},
	base_fire_cock_1 = {
		{time = 0 / 30, snd = "weapons/tfa_ins2/m1014/toz_pumpback.wav"},
		{time = 8 / 30, snd = "weapons/tfa_ins2/m1014/toz_pumpforward.wav"},
	}
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
end
