AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "SR-2 Veresk"
SWEP.Author 			= "August"

SWEP.ViewModel 			= Model("models/weapons/c_ins2_sr2m_veresk.mdl")

SWEP.WorldModel 		= Model("models/weapons/w_ins2_sr2m_veresk.mdl")

SWEP.HoldType 			= "smg"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_auto"}
}


SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 30
SWEP.Delay 				= 0.1445

SWEP.HipCone 			= 0.05 -- Hipfire spread 
SWEP.AimCone 			= 0.025 -- ADS spread

SWEP.Recoil 			= 1.6

SWEP.FireSound 			= Sound("weapons/sr2m_veresk/sr2m_fire.wav")
SWEP.DrySound 			= Sound("weapons/sr2m_veresk/sr2m_empty.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0.3, 0, 0),
	pos = Vector(-2.54, 0, 1.5)
}
 
SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(1, 2, 0)
}

SWEP.Animations = {
	draw = "base_draw",
	fire = "base_fire",
	reload = "base_reload",
	reload_empty = "base_reloadempty"
}

SWEP.SoundScripts = { -- Stolen from the TFA version of the weapon
	base_reloadempty = {
		{time = 15 / 30, snd = "weapons/sr2m_veresk/sr2m_boltback.wav"},
		{time = 30 / 30, snd = "weapons/sr2m_veresk/sr2m_magout.wav"},
		{time = 78 / 30, snd = "weapons/sr2m_veresk/sr2m_magin.wav"},
		{time = 100 / 30, snd = "weapons/sr2m_veresk/sr2m_boltrelease.wav"},
	}
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
end
