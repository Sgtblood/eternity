AddCSLuaFile()
DEFINE_BASECLASS("eternity_melee_base")

SWEP.Base 				= "eternity_melee_base"

SWEP.PrintName 			= "Fubar"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/weapons/viewmodel_dump/fubar/v_me_fubar.mdl")
SWEP.WorldModel 		= Model("models/weapons/worldfix/w_me_fubar.mdl")

SWEP.HoldType 			= "melee2"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Damage 			= 60

SWEP.Animations = {
	idle = "idle",
	draw = "draw",
	hit = {"attack_quick"},
	miss = {"shove"}
}
