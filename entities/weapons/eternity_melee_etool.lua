AddCSLuaFile()
DEFINE_BASECLASS("eternity_melee_base")

SWEP.Base 				= "eternity_melee_base"

SWEP.PrintName 			= "E-Tool"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/weapons/viewmodel_dump/etool/v_me_etool.mdl")
SWEP.WorldModel 		= Model("models/weapons/worldfix/w_me_etool.mdl")

SWEP.HoldType 			= "melee"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Damage 			= 40

SWEP.Animations = {
	idle = "idle",
	draw = "draw",
	hit = {"attack_quick"},
	miss = {"shove"}
}
