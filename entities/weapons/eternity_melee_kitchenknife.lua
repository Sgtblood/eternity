AddCSLuaFile()
DEFINE_BASECLASS("eternity_melee_base")

SWEP.Base 				= "eternity_melee_base"

SWEP.PrintName 			= "Kitchen Knife"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/weapons/viewmodel_dump/kitknife/v_me_kitknife.mdl")
SWEP.WorldModel 		= Model("models/weapons/worldfix/w_me_kitknife.mdl")

SWEP.HoldType 			= "knife"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Damage 			= 20

SWEP.Animations = {
	idle = "idle",
	draw = "draw",
	hit = {"attack_quick"},
	miss = {"shove"}
}
