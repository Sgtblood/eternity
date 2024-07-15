AddCSLuaFile()
DEFINE_BASECLASS("eternity_melee_base")

SWEP.Base 				= "eternity_melee_base"

SWEP.PrintName 			= "Wrench"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/weapons/viewmodel_dump/wrench/v_me_wrench.mdl")
SWEP.WorldModel 		= Model("models/weapons/worldfix/w_me_wrench.mdl")

SWEP.HoldType 			= "melee"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Damage 			= 20

SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(0, -3, 0)
}

SWEP.Animations = {
	idle = "idle",
	draw = "draw",
	hit = {"attack_quick"},
	miss = {"shove"}
}
