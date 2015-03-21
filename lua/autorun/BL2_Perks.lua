-------------------------------------

if SERVER then
game.AddParticles("particles/aurora_sphere2.pcf")
game.AddParticles("particles/hunter_shield_impact.pcf")
PrecacheParticleSystem("aurora_shockwave")
PrecacheParticleSystem("hunter_shield_impactglow")
for i,p in pairs(player.GetAll()) do p.InPerk = false p.PerkEntity = nil p.PerkTime = 3 end

concommand.Add("bl2_perk",function(ply)
if ply.InPerk == true then return end
if ply:GetEyeTrace().Entity:IsNPC() and ply.PerkTime >= 3 then
ply.InPerk = true
ply.PerkEntity = ply:GetEyeTrace().Entity 
ply.PerkEntity.pos = ply.PerkEntity:GetPos() + Vector(0,0,50)
ply.PerkEntity.lerp = ply.PerkEntity:GetPos()
ParticleEffect("aurora_shockwave",ply.PerkEntity:GetPos(),Angle(0,0,0))
ply:EmitSound("vfx/fizzler_shutdown_01.wav")
else
if ply.PerkTime >= 3 then
ParticleEffect("hunter_shield_impactglow",ply:GetEyeTrace().HitPos,Angle(0,0,0))
ply:EmitSound("vfx/sphere_flashlight_on_01.wav")
end
ply.InPerk = false
ply.PerkEntity = nil
if IsValid(ply.PerkEntity) then
ply.PerkEntity.pos = nil
ply.PerkEntity.lerp = nil
end
end
end)

hook.Add("Think","BL2_PERK_MANAGER",function()
for i2,pl in pairs(player.GetAll()) do
if pl.InPerk == false then
 pl.PerkTime = math.Clamp(pl.PerkTime + 0.005,0,3)
elseif pl.InPerk == true then
 pl.PerkTime = pl.PerkTime - .01
end
print(pl.PerkTime)
 if pl.InPerk == true and IsValid(pl.PerkEntity) then
 if not pl.PerkEntity.IsVictim then
 pl.PerkEntity:SetCondition(COND_NPC_FREEZE)
 pl.PerkEntity.IsVictim = true
 end
 if not pl.PerkEntity.LoopSound then
 pl.PerkEntity.LoopSound = CreateSound(pl.PerkEntity,"vfx/fizzler_vortex_lp_01.wav")
 end
 pl.PerkEntity.LoopSound:Play()
 pl.PerkEntity.LoopSound:ChangeVolume(1,0)
 pl.PerkEntity:StopMoving()
 pl.PerkEntity.lerp = LerpVector(.1,pl.PerkEntity.lerp,pl.PerkEntity.pos)
 pl.PerkEntity:SetPos(pl.PerkEntity.lerp)
 end
if pl.PerkTime <= 0 or !IsValid(pl.PerkEntity) or pl.PerkEntity:Health() <= 0 then
 pl.InPerk = false
 if IsValid(pl.PerkEntity) then
  pl.PerkEntity:SetCondition(COND_NPC_UNFREEZE)
  pl.PerkEntity.IsVictim = nil
  pl.PerkEntity.LoopSound:ChangeVolume(0,.5)
  pl.PerkEntity = nil
 end
end
end
end)
end
