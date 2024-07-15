AddCSLuaFile()
DEFINE_BASECLASS("eternity_melee_base")

SWEP.Base 				= "eternity_melee_base"

SWEP.PrintName 			= "Shovel"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/weapons/viewmodel_dump/spade/v_me_spade.mdl")
SWEP.WorldModel 		= Model("models/weapons/worldfix/w_me_spade.mdl")

SWEP.HoldType 			= "melee2"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Damage 			= 45

SWEP.Animations = {
	idle = "idle",
	draw = "draw",
	hit = {"attack_quick"},
	miss = {"shove"}
}
