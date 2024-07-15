
AddCSLuaFile()
DEFINE_BASECLASS("eternity_melee_base")

SWEP.Base 				= "eternity_melee_base"

SWEP.PrintName 			= "Barbed Baseball Bat"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/weapons/viewmodel_dump/barbed bat/c_l4d2_lucille.mdl")
SWEP.WorldModel 		= Model("models/weapons/worldfix/w_l4d2_lucille_wm.mdl")

SWEP.HoldType 			= "melee2"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Damage 			= 65

SWEP.Animations = {
	idle = "idle01",
	draw = "deploy",
	hit = {"swing_ne2sw_02", "swing_w_e_02", "secondary_swing", "swing_e_w_03"},
	miss = {"swing_hard"}
}