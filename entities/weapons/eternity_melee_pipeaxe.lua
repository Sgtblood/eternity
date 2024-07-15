AddCSLuaFile()
DEFINE_BASECLASS("eternity_melee_base")

SWEP.Base 				= "eternity_melee_base"

SWEP.PrintName 			= "Pipe Axe"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/weapons/viewmodel_dump/pipe axe/c_pipeaxe.mdl")
SWEP.WorldModel 		= Model("models/weapons/worldfix/w_pipeaxe.mdl")

SWEP.HoldType 			= "melee"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Damage 			= 80

SWEP.Animations = {
	idle = "idle",
	draw = "deploy",
	hit = {"attack_01", "attack_02", "attack_03"},
	miss = {"attack_01"}
}