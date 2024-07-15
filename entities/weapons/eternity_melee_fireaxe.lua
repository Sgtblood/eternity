AddCSLuaFile()
DEFINE_BASECLASS("eternity_melee_base")

SWEP.Base 				= "eternity_melee_base"

SWEP.PrintName 			= "Fire Axe"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/weapons/viewmodel_dump/fireaxe/v_me_axe_fire.mdl")
SWEP.WorldModel 		= Model("models/weapons/worldfix/w_me_axe_fire.mdl")

SWEP.HoldType 			= "melee2"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Damage 			= 55

SWEP.Animations = {
	idle = "idle",
	hit = {"attack_quick"},
	miss = {"shove"}
}
