AddCSLuaFile()
DEFINE_BASECLASS("eternity_melee_base")

SWEP.Base 				= "eternity_melee_base"

SWEP.PrintName 			= "Machete"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/weapons/viewmodel_dump/machete/v_me_machete.mdl")
SWEP.WorldModel 		= Model("models/weapons/worldfix/w_me_machete.mdl")

SWEP.HoldType 			= "melee"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Damage 			= 55

SWEP.Animations = {
	idle = "idle",
	draw = "draw",
	hit = {"attack_quick"},
	miss = {"shove"}
}
