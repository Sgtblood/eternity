AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Nagant M1895 Suppressed"
SWEP.Author 			= "August"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_nagant.mdl")
SWEP.VMBodyGroups		= {[1] = 1}

SWEP.WorldModel 		= Model("models/tnb/weapons/w_nagant.mdl")
SWEP.WMBodyGroups		= {[1] = 1}

SWEP.HoldType 			= "revolver"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 7
SWEP.Delay 				= 2.857

SWEP.HipCone 			= 0.03 -- Hipfire spread 
SWEP.AimCone 			= 0.02 -- ADS spread

SWEP.Recoil 			= 1.6

SWEP.FireSound 			= Sound("weapons/tfa_ins2/project_immursion/m1911/m1911_suppressed_fp.wav")
SWEP.DrySound 			= Sound("weapons/tfa_ins2/project_immursion/revolver/handling/revolver_empty.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(-0.25, 0, 6),
	pos = Vector(-1.95, 1.5, 0.5)
}

SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(1, 2.5, -1.2)
}

SWEP.Animations = {
	fire = {"base_fire", "base_fire2"},
	reload = "base_reload_speed",
	draw = "base_draw"
}

SWEP.SoundScripts = { -- Stolen from the TFA version of the weapon
	base_reload_speed = {
		{time = 15 / 30, snd = "weapons/tfa_ins2/project_immursion/revolver/handling/revolver_open_chamber.wav"},
		{time = 45 / 30, snd = "weapons/tfa_ins2/project_immursion/revolver/handling/revolver_speed_loader_insert_01.wav"},
		{time = 80 / 30, snd = "weapons/tfa_ins2/project_immursion/revolver/handling/revolver_close_chamber.wav"},
	}
}


function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
	if event == 20 then return true end
end
