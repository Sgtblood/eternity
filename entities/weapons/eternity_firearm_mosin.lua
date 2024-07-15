AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Mosin Nagant"
SWEP.Author 			= "August"

SWEP.ViewModel 			= Model("models/weapons/c_ins2_mosin_nagant.mdl")

SWEP.WorldModel 		= Model("models/weapons/w_ins2_mosin_nagant.mdl")

SWEP.HoldType 			= "sniper"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.ShotgunReload 		= true
SWEP.PumpAction			= true

SWEP.Animated 			= true
SWEP.AnimatedADS 		= false

SWEP.ClipSize 			= 5
SWEP.Delay 				= 1

SWEP.HipCone 			= 0.5 -- Hipfire spread 
SWEP.AimCone 			= 0.005 -- ADS spread

SWEP.Recoil 			= 1.5

SWEP.FireSound 			= Sound("weapons/tfa_ins2/mosin/mosin_fire.wav")
SWEP.DrySound 			= Sound("weapons/tfa_ins2/mosin/mosin_empty.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0, 0, 0),
	pos = Vector(-3.1, 1, 1.5)
}

SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(1, 2, -0.5)
}

SWEP.Animations = {
	draw = "base_draw",
	fire = "base_fire_start",
	pump = "base_fire_end",
	fire_last = "base_firelast",
	reload = "reload_start",
	reloadinsert = "reload_insert",
	reloadfinish = "reload_end"
}

SWEP.SoundScripts = { -- Stolen from the TFA version of the weapon
	base_fire_end = {
		{time = 0 / 30, snd = "weapons/tfa_ins2/mosin/mosin_boltforward.wav"},
		{time = 5 / 30, snd = "weapons/tfa_ins2/mosin/mosin_boltback.wav"},
		{time = 20 / 30, snd = "weapons/tfa_ins2/mosin/mosin_boltforward.wav"},
		{time = 25 / 30, snd = "weapons/tfa_ins2/mosin/mosin_boltback.wav"},
	},
	reload_start = {
		{time = 0 / 30, snd = "weapons/tfa_ins2/mosin/mosin_boltforward.wav"},
		{time = 5 / 30, snd = "weapons/tfa_ins2/mosin/mosin_boltback.wav"},
	},
	reload_insert = {
		{time = 0 / 30, snd = "weapons/mosin/round-insert01.wav"},
	},
	reload_end = {
		{time = 0 / 30, snd = "weapons/tfa_ins2/mosin/mosin_boltforward.wav"},
		{time = 8 / 30, snd = "weapons/tfa_ins2/mosin/mosin_boltback.wav"},
		{time = 0 / 0, snd = "weapons/tfa_ins2/mosin/mosin_boltforward.wav"},
		{time = 0 / 0, snd = "weapons/tfa_ins2/mosin/mosin_boltback.wav"},
	}
}


function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
end
