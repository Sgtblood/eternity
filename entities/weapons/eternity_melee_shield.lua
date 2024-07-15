AddCSLuaFile()
DEFINE_BASECLASS("eternity_melee_base")

SWEP.Base 				= "eternity_melee_base"

SWEP.PrintName 			= "Riot Shield"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/weapons/riotshield/v_riotshield.mdl")
SWEP.WorldModel 		= Model("models/weapons/riotshield/w_riotshield.mdl")

SWEP.HoldType 			= "crossbow"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Damage 			= 30

SWEP.Delay 				= 0.7

SWEP.LoweredOffset 	= {
	ang = Angle(0, 0, 0),
	pos = Vector(0, 0, 0)
}

SWEP.DefaultOffset 	= {
	ang = Angle(0, 0, 0),
	pos = Vector(6, 0, 5)
}

SWEP.Animations = {
	idle = "idle01",
	hit = "attackch",
	miss = "attackcm"
}
