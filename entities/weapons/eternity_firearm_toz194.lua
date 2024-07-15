AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Toz-194m"
SWEP.Author 			= "August"

SWEP.ViewModel 			= Model("models/weapons/c_inss2_toz_194m.mdl")

SWEP.WorldModel 		= Model("models/weapons/w_inss2_toz_194m.mdl")

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

SWEP.Recoil 			= 1.8

SWEP.FireSound 			= Sound("weapons/toz-194m/toz_194m_fire_1.wav")
SWEP.DrySound 			= Sound("weapons/toz-194m/toz_194m_empty.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0.6, 0, 0),
	pos = Vector(-2.4, 2, 1.1)
}

SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(1, 3.5, -1)
}

SWEP.Animations = {
	draw = "base_draw",
	fire = "base_fire_1",
	pump = "base_fire_cock_1",
	reload = "base_reload_start",
	reload_empty = "base_reload_start_empty",
	reloadinsert = "base_reload_insert",
	reloadfinish = "base_reload_end"
}

SWEP.SoundScripts = { -- Stolen from the TFA version of the weapon
	base_fire_cock_1 = {
		{time = 0 / 30, snd = "weapons/toz-194m/toz_194m_pumpback.wav"},
		{time = 8 / 30, snd = "weapons/toz-194m/toz_194m_pumpforward.wav"},
	},
	base_reload_start_empty = {
		{time = 5 / 30, snd = "weapons/toz194/toz_194m_pumpback.wav"},
		{time = 35 / 30, snd = "weapons/toz-194m/toz_194m_shell_insert_2.wav"},
		{time = 60 / 30, snd = "weapons/toz-194m/toz_194m_pumpforward.wav"},
	},
	base_reload_insert = {
		{time = 0 / 30, snd = "weapons/toz-194m/toz_194m_shell_insert_1.wav"},
	},
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
end
