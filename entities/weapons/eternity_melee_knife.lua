AddCSLuaFile()
DEFINE_BASECLASS("eternity_melee_base")

SWEP.Base 				= "eternity_melee_base"

SWEP.RenderGroup        = RENDERGROUP_BOTH

SWEP.PrintName 			= "Knife"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/weapons/arc9/darsu_eft/c_melee_bars_a2607.mdl")

SWEP.WorldModel 		= Model("models/weapons/arc9/darsu_eft/w_melee_bars_a2607.mdl")

SWEP.HoldType 			= "knife"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Damage 			= 25

SWEP.Offset = {
    pos = Vector(3.25, 1, 0),
    ang = Angle(180, 180, 0)
}

SWEP.Animations = {
	idle = "idle",
	draw = "draw_wycc",
	hit = {"fire_quick"},
	miss = {"fire_quick"}
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
