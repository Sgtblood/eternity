AddCSLuaFile()
DEFINE_BASECLASS("eternity_melee_base")

SWEP.Base 				= "eternity_melee_base"

SWEP.PrintName 			= "Hatchet"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/weapons/viewmodel_dump/hatchet/v_me_hatchet.mdl")
SWEP.WorldModel 		= Model("models/weapons/worldfix/w_me_hatchet.mdl")

SWEP.HoldType 			= "melee"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Damage 			= 45

SWEP.Animations = {
	idle = "idle",
	draw = "draw",
	hit = {"attack_quick", "attack_quick2"},
	miss = {"shove"}
}
