AddCSLuaFile()
DEFINE_BASECLASS("eternity_melee_base")

SWEP.Base 				= "eternity_melee_base"

SWEP.PrintName 			= "Crowbar Axe"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/weapons/viewmodel_dump/saw crowbar/v_yog_crowbar.mdl")
SWEP.WorldModel 		= Model("models/weapons/worldfix/w_yog_crowbar.mdl")

SWEP.HoldType 			= "melee"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Damage 			= 75

SWEP.Animations = {
	idle = "idle",
	draw = "draw",
	hit = {"misscenter1", "misscenter2"},
	miss = "misscenter1"
}