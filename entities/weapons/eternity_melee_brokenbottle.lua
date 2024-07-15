AddCSLuaFile()
DEFINE_BASECLASS("eternity_melee_base")

SWEP.Base 				= "eternity_melee_base"

SWEP.RenderGroup        = RENDERGROUP_BOTH

SWEP.PrintName 			= "Broken Bottle"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/weapons/tfa_cod/mwr/wpn_h1_melee_broken_bottle_2_vm.mdl")

SWEP.WorldModel 		= Model("models/weapons/tfa_cod/mwr/wpn_h1_melee_broken_bottle_2_wm.mdl")

SWEP.HoldType 			= "knife"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Damage 			= 20

SWEP.Offset = {
    pos = Vector(10, 1, -8),
    ang = Angle(0, 45, 0)
}

SWEP.Animations = {
	idle = "h1_wpn_melee_broken_bottle_idle",
	draw = "h1_wpn_melee_broken_bottle_pullout_first",
	hit = {"h1_wpn_melee_broken_bottle_swipe"},
	miss = {"h1_wpn_melee_broken_bottle_swipe"}
}

function SWEP:DrawWorldModel()
    local ply = self.Owner

    if IsValid(self.Owner) then
        local hand = ply:LookupBone("ValveBiped.Bip01_R_Hand")

        if hand then
            local pos, ang

            local mat = ply:GetBoneMatrix(hand)

            if mat then
                pos, ang = mat:GetTranslation(), mat:GetAngles()
            else
                pos, ang = ply:GetBonePosition(hand)
            end

            pos = pos + (ang:Forward() * self.Offset.pos.x) + (ang:Right() * self.Offset.pos.y) + (ang:Up() * self.Offset.pos.z)

            ang:RotateAroundAxis(ang:Up(), self.Offset.ang.p)
            ang:RotateAroundAxis(ang:Right(), self.Offset.ang.y)
            ang:RotateAroundAxis(ang:Forward(), self.Offset.ang.r)
            
            self:SetRenderOrigin(pos)
            self:SetRenderAngles(ang)
        end
    end
        
    self:SetModelScale(1.1)
    self:SetupBones()
    self:DrawModel()
end
