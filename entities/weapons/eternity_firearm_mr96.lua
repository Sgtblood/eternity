AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "MR-96"
SWEP.Author 			= "August"

SWEP.ViewModel 			= Model("models/weapons/c_ins2_revolver_mr96.mdl")


SWEP.WorldModel 		= Model("models/weapons/w_ins2_revolver_mr96.mdl")


SWEP.HoldType 			= "revolver"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 6
SWEP.Delay 				= 0.2222

SWEP.HipCone 			= 0.03 -- Hipfire spread 
SWEP.AimCone 			= 0.02 -- ADS spread

SWEP.Recoil 			= 1.3

SWEP.FireSound 			= Sound("weapons/tfa_ins2/mr96/mr96_short.wav")
SWEP.DrySound 			= Sound("weapons/tfa_ins2/mr96/revolver_empty.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0, 0, 0),
	pos = Vector(-1.85, -1.25, 0.60)
}

SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(1, 2.5, -1.2)
}

SWEP.Animations = {
	fire = "base_fire",
	fire_last = {"base_fire"},
	reload = "base_reload_speed",
	draw = "base_draw"
}

SWEP.SoundScripts = { -- Stolen from the TFA version of the weapon
	base_reload_speed = {
		{time = 20 / 30, snd = "weapons/tfa_ins2/mr96/revolver_open_chamber.wav"},
		{time = 45 / 30, snd = "weapons/tfa_ins2/mr96/revolver_dump_rounds_03.wav"},
		{time = 75 / 30, snd = "weapons/tfa_ins2/mr96/revolver_speed_loader_insert_01.wav"},
		{time = 100 / 30, snd = "weapons/tfa_ins2/mr96/revolver_close_chamber.wav"},
		{time = 0 / 0, snd = "weapons/tfa_ins2/sw1917/sw1917_close_chamber.wav"},
	}
}


function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
	if event == 20 then return true end
end