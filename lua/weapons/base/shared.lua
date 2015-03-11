AddCSLuaFile("shared.lua")
local cvardir = CreateConVar("basedebug_bulletdir","0",{FCVAR_CHEAT,FCVAR_REPLICATED})
local cvarlaser = CreateClientConVar("basedebug_laser","0",false,false)
local cvarweaponcam = CreateClientConVar("basedebug_weaponcam","0",false,false)
local cvarcrg = CreateClientConVar("basedebug_crosshair_g","255",true,false)
local cvarcrr = CreateClientConVar("basedebug_crosshair_r","255",true,false)
local cvarcrb = CreateClientConVar("basedebug_crosshair_b","255",true,false)
local cvarblurs = CreateClientConVar("basedebug_enableblurs","1",true,false)
local cvarhud = CreateClientConVar("basedebug_enablehud","1",true,false)
local cvarcrosshair = CreateClientConVar("basedebug_enablecrosshair","1",true,false)
local cvardmg = CreateConVar("basedebug_printhits","0",{FCVAR_REPLICATED})

if SERVER then
	local target = ""
	local damage = ""
	local attacker = ""
	local hitgroup = ""
	local distance = ""
	local pos = Vector(0,0,0)
	util.AddNetworkString("m_clT")
	util.AddNetworkString("m_clS")
	util.AddNetworkString("m_svS")
	util.AddNetworkString("m_Anim")
	util.AddNetworkString("m_State")
	net.Receive("m_clT",function(len,ply)
	target = net.ReadString() 
	damage = net.ReadString()
	inflictor = net.ReadString()
	local endt = ents.GetByIndex(tonumber(target))
	local weapon = ents.GetByIndex(inflictor)
	if IsValid(endt) and endt:GetClass() != "worldspawn" then
	local damageInfo = DamageInfo()
	damageInfo:SetAttacker(ply)
	damageInfo:SetInflictor(weapon)
	damageInfo:SetDamagePosition(ply:GetPos())
	damageInfo:SetDamageType(DMG_BULLET)
	damageInfo:SetDamage(tonumber(damage))
	damageInfo:SetDamageForce(ply:EyeAngles():Forward() * tonumber(damage))
	endt:TakeDamage(tonumber(damage),ply,weapon)
    end
end)

end
if CLIENT then
local pent = ""
net.Receive("m_svS",function(len,ply)
pent = net.ReadString()
Entity(tonumber(pent)).sounding = net.ReadString()
Entity(tonumber(pent)):EmitSound(Entity(tonumber(pent)).sounding,75,100)
end)
end
game.AddParticles("particles/muzzleflashes_test.pcf")
game.AddParticles("particles/muzzle_flash.pcf")
game.AddParticles("particles/muzzleflashes_test_b.pcf")
game.AddParticles("particles/buu_particles.pcf")
game.AddParticles("particles/devtest.pcf")
game.AddParticles("particles/antlion_gib_02.pcf")
game.AddParticles("particles/choreo_dog_v_strider.pcf")
PrecacheParticleSystem("antlion_gib_02_juice")
PrecacheParticleSystem("muzzleflash_g3")
PrecacheParticleSystem("muzzleflash_m14")
PrecacheParticleSystem("muzzleflash_ak47")
PrecacheParticleSystem("muzzleflash_ak74")
PrecacheParticleSystem("muzzleflash_6")
PrecacheParticleSystem("muzzleflash_pistol_rbull")
PrecacheParticleSystem("muzzleflash_pistol")
PrecacheParticleSystem("muzzleflash_suppressed")
PrecacheParticleSystem("muzzleflash_pistol_deagle")
PrecacheParticleSystem("muzzleflash_OTS")
PrecacheParticleSystem("muzzleflash_M3")
PrecacheParticleSystem("muzzleflash_smg")
PrecacheParticleSystem("muzzleflash_SR25")
PrecacheParticleSystem("muzzleflash_shotgun")
PrecacheParticleSystem("muzzle_center_M82")
PrecacheParticleSystem("muzzleflash_m79")
PrecacheParticleSystem("weapon_muzzle_flash_assaultrifle")
PrecacheParticleSystem("weapon_muzzle_smoke")
PrecacheParticleSystem("strider_headbeating_01c")

local Shells = {
["9mm"] = "models/shells/shell_9mm.mdl",
["7.62"] = "models/shells/shell_762nato.mdl",
["5.7"] = "models/shells/shell_57.mdl",
["5.56"] = "models/shells/shell_556.mdl",
[".338"] = "models/shells/shell_338mag.mdl",
[".12G"] = "models/shells/shell_12gauge.mdl",
["m_SMG"] = "models/weapons/shell.mdl",
["m_RIFLE"] = "models/weapons/rifleshell.mdl",
["m_SHOTGUN"] = "models/weapons/Shotgun_shell.mdl",
}

local Muzzles = {
["G3"] = "muzzleflash_g3",
["M14"] = "muzzleflash_m14",
["AK-47"] = "muzzleflash_ak47",
["AK-74"] = "muzzleflash_ak74",
[".6"] = "muzzleflash_6",
["RBull"] = "muzzleflash_pistol_rbull",
["m_zPISTOL"] = "muzzleflash_pistol",
["DEagle"] = "muzzleflash_pistol_deagle",
["m_zSUPPRESSED"] = "muzzleflash_suppressed",
["OTS"] = "muzzleflash_OTS",
["M3"] = "muzzleflash_M3",
["m_zSMG"] = "muzzleflash_smg",
["SR25"] = "muzzleflash_SR25",
["m_zSHOTGUN"] = "muzzleflash_shotgun",
["M82"] = "muzzle_center_M82",
["M79"] = "muzzleflash_m79",
["m_zRIFLE"] = "weapon_muzzle_flash_assaultrifle",
}

local Debris = {
["67"] = {mdl = {"models/props_debris/concrete_chunk05g.mdl"},
		  size = {.3,.6},
		  effect = "bullet_bignasty_tracer01_red",},
["84"] = {mdl = {"models/props_debris/concrete_chunk05g.mdl"},
		  size = {.3,.6},
		  effect = "bullet_bignasty_tracer01_red",},
["68"] = {mdl = {"models/props_debris/concrete_chunk05g.mdl"},
		  size = {.3,.6},
		  effect = "bullet_bignasty_tracer01_red",},
["65"] = {mdl = {"models/gibs/antlion_gib_small_2.mdl","models/gibs/antlion_gib_small_1.mdl"},
		  size = {.3,.6},
		  effect = "antlion_gib_02_juice",},
["87"] = {mdl = {"models/props_debris/wood_splinters01e.mdl","models/props_debris/wood_splinters01a.mdl","models/props_debris/wood_splinters01b.mdl"},
		  size = {.3,.5},},
["77"] = {mdl = {"models/gibs/metal_gib1.mdl","models/gibs/metal_gib2.mdl","models/gibs/metal_gib3.mdl","models/gibs/metal_gib4.mdl","models/gibs/metal_gib5.mdl"},
          size = {.15,.3},
      	  effect = "strider_headbeating_01c",},
}

if ( CLIENT ) then
	SWEP.DrawAmmo			= true
	SWEP.DrawCrosshair		= false
	SWEP.ViewModelFOV		= 70
	SWEP.ViewModelFlip		= true
	SWEP.CSMuzzleFlashes	= true

end

SWEP.Author			= "Counter-Strike"
SWEP.Contact		= ""
SWEP.Purpose		= ""
SWEP.Instructions	= ""

// Note: This is how it should have worked. The base weapon would set the category
// then all of the children would have inherited that.
// But a lot of SWEPS have based themselves on this base (probably not on purpose)
// So the category name is now defined in all of the child SWEPS.
//SWEP.Category			= "Counter-Strike"

SWEP.Spawnable			= false
SWEP.AdminSpawnable		= false
SWEP.m_WeaponDeploySpeed = 1
SWEP.ReloadSpeed = 1
SWEP.Primary.Sound			= Sound( "Weapon_AK47.Single" )
SWEP.Primary.Recoil			= 1.5
SWEP.Primary.Damage			= 40
SWEP.Primary.NumShots		= 1
SWEP.Primary.Cone			= 0.001
SWEP.Primary.Delay			= 0.15
SWEP.m_BL2Value = 1

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "none"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false 
SWEP.Secondary.Ammo			= "none"

SWEP.BobScale = 0
SWEP.SwayScale = 0

function SWEP:SetDeploySpeed(speed)
	self.m_WeaponSetDeploySpeed = tonumber(speed)
end

function SWEP:Initialize()
	if ( SERVER ) then
		self:SetNPCMinBurst( 30 )
		self:SetNPCMaxBurst( 30 )
		self:SetNPCFireRate( 0.01 )
	end

	self:SetWeaponHoldType( self.HoldType )
end

function SWEP:MergeThinkFunction()
end

function SWEP:MergeHUDFunction()
end

function SWEP:MergePrimaryAttackFunction()
end

function SWEP:MergeReloadFunction()
end

local m_FireSpread = 0
local cl_Recoil = 0
local cl_Shake = 0
local m_HasFired = 0
local SApp = 0
local FOV = 0
local FOV_t = 0
local sv_Shake = 0
local sv_Recoil = 0
local SvApp = 0
local sv_Spread = 0
local cl_lastshoottime = 0
local MGTime = 0
local BlandVert = 0
local BlandHoriz = 0
local e_BlandHoriz = 0
local svblandv = 0
local svblandh = 0
local s_vmRandomize = 0
local m_vmRandomize = 0
---- Vector
local CLVec = {}
CLVec.SpeedX = 16
CLVec.SpeedY = 14
CLVec.SpeedZ = 16
CLVec.VectorX = 0
CLVec.VectorY = 0
CLVec.VectorZ = 0
CLVec.Target = Vector(0,0,0)
CLVec.Trace = Vector(0,0,0)
----- Angle
local CLAng = {}
CLAng.SpeedYaw = 12
CLAng.SpeedP = 12
CLAng.SpeedR = 12
CLAng.AngleYaw = 0
CLAng.AngleP = 0
CLAng.AngleR = 0
CLAng.Target = Vector(0,0,0)
---- Camera Movement
local SAng = {}
SAng.SmoothP = 0
SAng.SmoothYaw = 0
SAng.SmoothR = 0
SAng.ViewPunch = Angle(0,0,0)
---- Sway
local SwayInput = {}
SwayInput.cmdX = 0
SwayInput.cmdY = 0
SwayInput.e_cmdX = 0
SwayInput.e_cmdY = 0
SwayInput.VecX = 0
SwayInput.VecY = 0
--vm punch
local VMPunch = {}
VMPunch.AngleP = 0
VMPunch.AngleY = 0
VMPunch.AngleR = 0
VMPunch.EffectiveP = 0
VMPunch.EffectiveY = 0
VMPunch.EffectiveR = 0
VMPunch.Force = 0
VMPunch.Time = 0

function SWEP:CSShootBullet( dmg, recoil, numbul, cone )
	numbul 	= numbul 	or 1
	cone 	= cone 		or 0.01
	local owner = self.Owner
	local a = self.Owner:EyeAngles()
    local dir = owner:GetAimVector()
	local bullet = {}
	bullet.Num 		= numbul
	bullet.Src 		= self.Owner:GetShootPos()	
	if CLIENT then	
	if cl_ironsights == false then
	bullet.Dir 		= (self.Owner:EyeAngles() + Angle(0 -SAng.ViewPunch.p - BlandVert * 100 - VMPunch.EffectiveP * .5,0 + e_BlandHoriz * 2.5 + VMPunch.EffectiveY*.5,0)):Forward()
	else
	bullet.Dir 		= (self.Owner:EyeAngles() + Angle(0 -cl_Shake - BlandVert * 100 - VMPunch.EffectiveP,0 + e_BlandHoriz + VMPunch.EffectiveY ,0)):Forward()
	end
	end
	if SERVER then	
	bullet.Dir 		= (self.Owner:EyeAngles() + Angle(0 -cl_Shake - cl_Recoil * 100,0 + m_vmRandomize * 2.5,0)):Forward()
	end
	if owner.aiming == true  then	
	bullet.Spread 	= Vector( cone/2, cone/2, 0 ) 
	else
	bullet.Spread 	= Vector( cone, cone, 0 ) 
	end

	bullet.Tracer	= self.TracerPerShot or 1								
	bullet.Force	= self.Primary.Damage
	bullet.Damage	= 0				
	bullet.Hull = HULL_LARGE_CENTERED
	bullet.Attacker = self.Owner
	bullet.Callback = function(ply,tr,dmgInfo)
	if not IsFirstTimePredicted() then return end
	if CLIENT  then
	tr.dmg = LocalPlayer():GetActiveWeapon().Primary.Damage
	tr.e_dmg = 0
	if tr.HitGroup != 0 then
	tr.e_dmg = tostring(math.Clamp(dmg/tr.HitGroup * 3.5 - math.Round(LocalPlayer():GetPos():Distance(tr.Entity:GetPos()))/200,dmg * .25,9999))
	else
	tr.e_dmg = tostring(dmg)
	end
	if tr.MatType == MAT_FLESH then ParticleEffect("blood_impact_red_01",tr.HitPos,tr.Entity:GetAngles()) 
	if tr.HitGroup == 1 then
	LocalPlayer():EmitSound("player/headshot"..math.random(1,2)..".wav",100,math.random(90,102))
	else
    LocalPlayer():EmitSound("physics/flesh/flesh_impact_bullet"..math.random(1,5)..".wav",100,math.random(90,102))
	end
	end
	net.Start("m_clT")
	net.WriteString(tostring(tr.Entity:EntIndex()))
	net.WriteString(tr.e_dmg)
	net.WriteString(tostring(self:EntIndex()))
	net.SendToServer()
	if cvardmg:GetInt() == 1 and tr.Entity != Entity(0) then
	print(tr.e_dmg)
	end
	end
	end
	self:FireBullets( bullet )
	self.Owner:MuzzleFlash()								
	self.Owner:SetAnimation( PLAYER_ATTACK1 )
	if cvardir:GetInt() == 1 and IsFirstTimePredicted() then
	Msg("!ONLY READ THE FIRST 3 DECIMALS!!! ONLY THOSE COUNT!")
	Msg("("..tostring(bullet.Dir)..")\n")
	end				
	if ( self.Owner:IsNPC() ) then return end

end
local clampfire = 0
local lastfired = 0

function SWEP:PrimaryAttack()
local owner = self.Owner
if self:Clip1() <= 0 then return end
if owner:GetNWBool("owner_sprinting") == true then return end
if owner:GetNWBool("owner_reloading") == true then return end
 /* SERVER STUFF*/
 self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
 self:EmitSound(self.Primary.Sound,100,math.random(97,102))
 self:TakePrimaryAmmo(1)
 self.Owner:GetViewModel():SetPlaybackRate(1)
 self:CSShootBullet( self.Primary.Damage, self.Primary.Recoil, self.Primary.NumShots, self.Primary.Cone + m_FireSpread  + m_MoveSpread)
 self:MergePrimaryAttackFunction()
 if SERVER then
 s_vmRandomize = math.random(-sv_Shake,sv_Shake)
 lastfired = CurTime()
 sv_Spread = self.Primary.Cone + clampfire + m_MoveSpread
 clampfire = math.Clamp(clampfire + (self.AddConeSpread/100),self.Primary.Cone,(self.MaxConeSpread/100))
end
 /*CLIENT OR UNPREDICTED STUFF*/
 if not IsFirstTimePredicted() then return end
 m_vmRandomize = math.random(-cl_Shake,cl_Shake)
 m_FireSpread = math.Clamp(m_FireSpread + (self.AddConeSpread/100),0,(self.MaxConeSpread/100))
if CLIENT then
if cl_ironsights == true then
cl_Shake = cl_Shake + (self.AddShakeSpread / 1.6) * self.m_BL2Value
cl_Recoil = math.Clamp(cl_Recoil + (self.AddUpRecoilSpread/85),cl_Recoil,self.MaxUpRecoilSpread / 100) * self.m_BL2Value
else
cl_Shake = cl_Shake + self.AddShakeSpread * self.m_BL2Value
cl_Recoil = math.Clamp(cl_Recoil + (self.AddUpRecoilSpread/50),cl_Recoil,self.MaxUpRecoilSpread / 100) * self.m_BL2Value
end
end
--- Simulation stuff.
if CLIENT then
if cl_ironsights == false or self.IronSightsSim == (nil or true) then
	self:SendVMAnim("fire")
end
cl_lastshoottime = MGTime
m_HasFired = 1
if self.MuzzleName then
ParticleEffect(Muzzles[self.MuzzleName],LocalPlayer().ViewModel:GetAttachment(self.MuzzleAttachment).Pos + LocalPlayer():GetVelocity() * .03,self.Owner:EyeAngles(),self.Owner:GetViewModel())
end
if !self.ShellEjectTime then
self:CreateShell()
else
timer.Simple(self.ShellEjectTime - self.Owner:Ping()/1000,function() if IsValid(self.Owner) and not owner:GetNWBool("owner_reloading") == true then self:CreateShell() end end)
end
end
end

function SWEP:SecondaryAttack()
	return 
end

function SWEP:Reload()
/* SERVER STUFF */
if self.Owner:GetNWBool("owner_reloading") == true then return end
if self:LastShootTime() + self.Primary.Delay > CurTime() then return end
-----------------
if self:Clip1() == self.Primary.ClipSize or self:Ammo1() == 0 then return end
 self.Owner:SetNWString("reloadtimedef",CurTime())
 if (!self.IsShotgun or self.IsShotgun == false) then
 self.Owner:SetNWString("reloadsequence_time",self.Owner:GetViewModel():SequenceDuration(self.Owner:GetViewModel():LookupSequence(table.Random(self.Animations["reload"]))))
 end
 print(self.Owner:GetNWString("reloadsequence_time"))
 if self.IsShotgun == true then
 self.Owner:SetNWString("reloadtimedef",CurTime() + self.Owner:GetViewModel():SequenceDuration(self.Owner:GetViewModel():LookupSequence(table.Random(self.Animations["start_reload"]))))
 self.Owner:SetNWString("reloadsequence_time",self.Owner:GetViewModel():SequenceDuration(self.Owner:GetViewModel():LookupSequence(table.Random(self.Animations["mid_reload"]))))
 end
 self.Owner:GetViewModel():SetPlaybackRate(self.ReloadSpeed)
 self.Owner:SetNWBool("owner_reloading",true)
 self.Owner:SetAnimation( PLAYER_RELOAD )
/* CLIENT OR UNPREDICTED STUFF*/ 
 if not IsFirstTimePredicted() then return end
 if CLIENT and (!self.IsShotgun or self.IsShotgun == false) then
 self:SendVMAnim("reload")
 end
 if CLIENT and self.IsShotgun == true then
 self:SendVMAnim("start_reload")
 end
 self:MergeReloadFunction()
 m_FireSpread = 0
 cl_Recoil = 0
end

function SWEP:Deploy()
/* SERVER STUFF */
 self:SetNoDraw(true)
 self.Owner:SetNWBool("owner_drawing",true)
 self.Owner:SetNWBool("owner_reloading",false)
 --if SERVER then self:SetEvent({"reloading","drawing"},{"false","true"}) end
 self.Owner:SetNWString("drawtime",CurTime())
/* CLIENT STUFF*/   
 if not IsFirstTimePredicted() then return end
end

function SWEP:Holster()
self.Owner:SetNWBool("owner_drawing",false)
self.Owner:SetNWBool("owner_reloading",false)
self.Owner:GetNWString("reloadtimedef",nil)
if CLIENT then LocalPlayer().ViewModel:SetSubMaterial("") end
--if SERVER then self:SetEvent({"reloading","drawing"},{"false","false"}) end
return true
end

if CLIENT then local m_clAnim = 1 end

function SWEP:Think()
local ifyouworkikillyou = self.Primary.ClipSize - self:Clip1()
local owner = self.Owner
if lastfired + self.CoolDown < CurTime() and SERVER then
clampfire = math.Clamp(clampfire - (self.ReduceConeSpread/1000),0,clampfire)
end
s_vmRandomize = Lerp(6*FrameTime(),s_vmRandomize,0)
sv_Recoil = Lerp(6*FrameTime(),sv_Recoil,0)
svblandv = Lerp(3*FrameTime(),svblandv,sv_Recoil)
svblandh = Lerp(3*FrameTime(),svblandh,s_vmRandomize)
if self:LastShootTime() + self.Primary.Delay < CurTime() and lastfired + self.Primary.Delay < CurTime() then owner.firing = false else owner.firing = true end
----RELOAD CODE
if owner:GetNWBool("owner_reloading") == true and ( !self.IsShotgun or self.IsShotgun == false) then
if self.ReloadTime then
if self.Owner:GetNWString("reloadtimedef") != nil and CurTime() > self.Owner:GetNWString("reloadtimedef") + (self.ReloadTime/self.Owner:GetViewModel():GetPlaybackRate()) then
self:SetClip1(math.Clamp(self.Owner:GetAmmoCount(self:GetPrimaryAmmoType()) + self:Clip1(),0,self.Primary.ClipSize)) self.Owner:SetAmmo(math.Clamp(self.Owner:GetAmmoCount(self:GetPrimaryAmmoType()) - ifyouworkikillyou,0,9999),self:GetPrimaryAmmoType())
end
end
if self.Owner:GetNWString("reloadtimedef") != nil and CurTime() > self.Owner:GetNWString("reloadtimedef") + (owner:GetNWString("reloadsequence_time")/self.Owner:GetViewModel():GetPlaybackRate()) then
if !self.ReloadTime then
self:SetClip1(math.Clamp(self.Owner:GetAmmoCount(self:GetPrimaryAmmoType()) + self:Clip1(),0,self.Primary.ClipSize)) self.Owner:SetAmmo(math.Clamp(self.Owner:GetAmmoCount(self:GetPrimaryAmmoType()) - ifyouworkikillyou,0,9999),self:GetPrimaryAmmoType())
end
owner:SetNWBool("owner_reloading",false)
--if SERVER then self:SetEvent({"reloading"},{"false"}) end
end
end

------DRAW
if self.Owner:GetNWBool("owner_drawing") == true then
self.Owner:SetNWBool("owner_drawing",false)
--if SERVER then self:SetEvent({"drawing"},{"false"}) end
end
---- STUFF.
if owner:KeyDown(IN_ATTACK2) and owner:IsOnGround() and owner:GetNWBool("owner_sprinting") == false and self.Owner:GetNWBool("owner_reloading") == false and self.Owner:GetNWBool("owner_drawing") == false and owner:GetActiveWeapon().CanAIDS != false  then 
if owner.aiming == false and self.Owner:GetNWBool("owner_reloading") == false then
owner.aiming = true
end
else
if owner.aiming == true and self.Owner:GetNWBool("owner_reloading") == false  then
owner.aiming = false
end
end
if owner:KeyDown(IN_SPEED) and owner:IsOnGround() and owner:GetVelocity():Length() >  owner:GetWalkSpeed() * 1.3 and not owner:Crouching() and self.Owner:GetNWBool("owner_reloading") == false then
if owner:GetNWBool("owner_sprinting") == false then
owner:SetNWBool("owner_sprinting",true)
end
else
if owner:GetNWBool("owner_sprinting") == true then
owner:SetNWBool("owner_sprinting",false)
end
end
if owner:GetMoveType() == MOVETYPE_LADDER then
owner.climbing = true
elseif owner:GetMoveType() != MOVETYPE_LADDER then
owner.climbing = false
end
if self:LastShootTime() + self.CoolDown < CurTime() then
m_FireSpread = math.Clamp(m_FireSpread - (self.ReduceConeSpread/1000),0,m_FireSpread)
end
if SERVER then
sv_Shake = Lerp(6*FrameTime(),sv_Shake,0)
SvApp = Lerp(6*FrameTime(),SvApp,sv_Shake)
end
if IsValid(owner:GetGroundEntity()) then
m_MoveSpread = (owner:GetVelocity():Length() + owner:GetGroundEntity():GetVelocity():Length()) / (self.MoveSensitivityDivisor * 100) or 4000
else
m_MoveSpread = (owner:GetVelocity():Length()) / (self.MoveSensitivityDivisor * 100) or 4000
end
self:MergeThinkFunction()

if not IsFirstTimePredicted() then return end

if owner:GetNWBool("owner_reloading") == true and self.IsShotgun == true then
if self.Owner:GetNWString("reloadtimedef") != nil and CurTime() > self.Owner:GetNWString("reloadtimedef") + self.Owner:GetNWString("reloadsequence_time")/self.Owner:GetViewModel():GetPlaybackRate() then
self:SetClip1(math.Clamp(self:Clip1() + 1,0,self.Primary.ClipSize))
self.Owner:SetAmmo(math.Clamp(self:Ammo1() - 1,0,self:Ammo1()),self:GetPrimaryAmmoType())
self.Owner:SetNWString("reloadtimedef",CurTime())
if CLIENT then self:SendVMAnim("mid_reload") end
elseif (self.Owner:KeyDown(IN_ATTACK) or self:Ammo1() == 0 or self:Clip1() == self.Primary.ClipSize) then
owner:SetNWBool("owner_reloading",false)
--if SERVER then self:SetEvent({"reloading"},{"false"}) end
if CLIENT then self:SendVMAnim("end_reload") end
end
end

if self.PrimaryAttackSounds then
for i, pas in pairs(self.PrimaryAttackSounds) do
if SERVER then
if pas.played == false and CurTime() > (self:LastShootTime() + pas.time) - self.Owner:Ping()/1000 then
pas.played = true
self.Owner:EmitSound(pas.soundfile,75,100)
elseif CurTime() < (self:LastShootTime() + pas.time) - self.Owner:Ping()/1000 then
pas.played = false
end
end
end
end
if self.ReloadSounds then
for i, s in pairs(self.ReloadSounds) do
if SERVER then
if s.svsound == true and s.played == false and owner:GetNWBool("owner_reloading") == true and CurTime() > self.Owner:GetNWString("reloadtimedef") + (s.time/self.Owner:GetViewModel():GetPlaybackRate()) - self.Owner:Ping() / 1000 then
s.played = true
owner:EmitSound(s.soundfile,75,100)
elseif owner:GetNWBool("owner_reloading") == false or owner:GetNWString("reloadtimedef")  == CurTime() then
s.played = false
end
end
if CLIENT then
if s.svsound == false and s.played == false and owner:GetNWBool("owner_reloading") == true and CurTime() > self.Owner:GetNWString("reloadtimedef") + (s.time/self.Owner:GetViewModel():GetPlaybackRate()) then
s.played = true 
LocalPlayer():EmitSound(s.soundfile,75,100)
elseif owner:GetNWBool("owner_reloading") == false or owner:GetNWString("reloadtimedef")  == CurTime() then
s.played = false
end
end
end
end
cl_Shake = Lerp(6*FrameTime(),cl_Shake,0)
cl_Recoil = Lerp(6*FrameTime(),cl_Recoil,0)
m_vmRandomize = Lerp(6*FrameTime(),m_vmRandomize,0)
end

----- Vector
local VMVec = {}
VMVec.SpeedX = 0
VMVec.SpeedY = 0
VMVec.SpeedZ = 0
VMVec.VectorX = 0
VMVec.VectorY = 0
VMVec.VectorZ = 0
VMVec.FX = 0
VMVec.FZ = 0
----- Angle
local VMAng = {}
VMAng.SpeedYaw = 0
VMAng.SpeedP = 0
VMAng.SpeedR = 0
VMAng.AngleYaw = 0
VMAng.AngleP = 0
VMAng.AngleR = 0

----- Misc
local Divisor = 0


function SWEP:GetViewModelPosition(pos,ang)
if not pos or not ang then return end
local owner = self.Owner
if !IsValid(owner) then return end 

pos = pos + math.sin(CurTime() * (VMVec.SpeedX) - VMVec.FX) * (VMVec.VectorX) *  ang:Right()
pos = pos + math.sin(CurTime() * (VMVec.SpeedZ) - VMVec.FZ)  * (VMVec.VectorZ) * ang:Up()
pos = pos + math.sin(CurTime() * (VMVec.SpeedY)) * (VMVec.VectorY) * ang:Forward() 

ang:RotateAroundAxis(ang:Right(), math.sin(CurTime() * (VMAng.SpeedP)) * (VMAng.AngleP))
ang:RotateAroundAxis(ang:Up(), math.sin(CurTime() * (VMAng.SpeedYaw)) * (VMAng.AngleYaw))
ang:RotateAroundAxis(ang:Forward(), math.sin(CurTime() * (VMAng.SpeedR)) * (VMAng.AngleR))



if self.Owner:GetVelocity():Length() > -1 and self.Owner:IsOnGround() == true then
VMVec.FX = 1
VMVec.FZ = 1
Divisor = self.WalkBob or 100
VMAng.SpeedP = 17
VMAng.SpeedYaw =  8.5
VMAng.SpeedR =  8.5
VMAng.AngleP = .7 * owner:GetVelocity():Length()/Divisor 
VMAng.AngleYaw = .6 * owner:GetVelocity():Length()/Divisor
VMAng.AngleR = -.9 * owner:GetVelocity():Length()/Divisor
VMVec.SpeedX = 8.5
VMVec.SpeedY = 0
VMVec.SpeedZ = 17
VMVec.VectorX = -.07* owner:GetVelocity():Length()/Divisor
VMVec.VectorY = .1* owner:GetVelocity():Length()/Divisor
VMVec.VectorZ = -.07* owner:GetVelocity():Length()/Divisor
if cl_ironsights == true then
VMVec.FX = 1 
VMVec.FZ = 1
Divisor = self.WalkBob or 100
VMAng.SpeedP = 17
VMAng.SpeedYaw =  8.5
VMAng.SpeedR =  8.5
VMAng.AngleP = .15 * owner:GetVelocity():Length()/Divisor
VMAng.AngleYaw = .1 * owner:GetVelocity():Length()/Divisor
VMAng.AngleR = -.05 * owner:GetVelocity():Length()/Divisor
VMVec.SpeedX = 8.5
VMVec.SpeedY = 0
VMVec.SpeedZ = 17
VMVec.VectorX = -.015* owner:GetVelocity():Length()/Divisor
VMVec.VectorY = .5* owner:GetVelocity():Length()/Divisor
VMVec.VectorZ = -.015* owner:GetVelocity():Length()/Divisor
end
if cl_sprinting == true then
VMVec.FX = 1
VMVec.FZ = 1
Divisor = self.SprintBob or 100
VMAng.SpeedYaw = 11.5--11.5
VMAng.SpeedP =  23--23
VMAng.SpeedR =  11.5--11.5
VMAng.AngleYaw = 4 * owner:GetVelocity():Length()/Divisor--2 * owner:GetVelocity():Length()/Divisor
VMAng.AngleP = .5 * owner:GetVelocity():Length()/Divisor--.4 * owner:GetVelocity():Length()/Divisor
VMAng.AngleR = 0 * owner:GetVelocity():Length()/Divisor---1 * owner:GetVelocity():Length()/Divisor
VMVec.SpeedX = 11.5 --11.5
VMVec.SpeedY = 11.5 --0
VMVec.SpeedZ = 23 --23
VMVec.VectorX = .2 * owner:GetVelocity():Length()/Divisor---.2* owner:GetVelocity():Length()/Divisor
VMVec.VectorY = 0 * owner:GetVelocity():Length()/Divisor--.1* owner:GetVelocity():Length()/Divisor
VMVec.VectorZ = -.1 * owner:GetVelocity():Length()/Divisor--.0* owner:GetVelocity():Length()/Divisor 
--[[VMVec.FX = 1
VMVec.FZ = 1
Divisor = self.SprintBob or 100
VMAng.SpeedYaw = 11.5--11.5
VMAng.SpeedP =  23--23
VMAng.SpeedR =  11.5--11.5
VMAng.AngleYaw = 2 * owner:GetVelocity():Length()/Divisor--2 * owner:GetVelocity():Length()/Divisor
VMAng.AngleP = .5 * owner:GetVelocity():Length()/Divisor--.4 * owner:GetVelocity():Length()/Divisor
VMAng.AngleR = 1 * owner:GetVelocity():Length()/Divisor---1 * owner:GetVelocity():Length()/Divisor
VMVec.SpeedX = 11.5 --11.5
VMVec.SpeedY = 11.5 --0
VMVec.SpeedZ = 23 --23
VMVec.VectorX = .2 * owner:GetVelocity():Length()/Divisor---.2* owner:GetVelocity():Length()/Divisor
VMVec.VectorY = .1 * owner:GetVelocity():Length()/Divisor--.1* owner:GetVelocity():Length()/Divisor
VMVec.VectorZ = -.04 * owner:GetVelocity():Length()/Divisor--.0* owner:GetVelocity():Length()/Divisor ]]
end 
end
--[[pos = pos + math.sin(CurTime() * (IdleVec.SpeedX - IdleVec.FX )) * (IdleVec.VectorX) *  ang:Right()
pos = pos + math.sin(CurTime() * (IdleVec.SpeedZ - IdleVec.FZ ))  * (IdleVec.VectorZ) * ang:Up()
pos = pos + math.sin(CurTime() * (IdleVec.SpeedY)) * (IdleVec.VectorY) * ang:Forward() 

ang:RotateAroundAxis(ang:Right(), math.sin(CurTime() * (IdleAng.SpeedP)) * (IdleAng.AngleP))
ang:RotateAroundAxis(ang:Up(), math.sin(CurTime() * (IdleAng.SpeedYaw)) * (IdleAng.AngleYaw))
ang:RotateAroundAxis(ang:Forward(), math.sin(CurTime() * (IdleAng.SpeedR)) * (IdleAng.AngleR))
IdleVec.FX = 1
IdleVec.FZ = 1
IdleAng.SpeedP = 1
IdleAng.SpeedYaw = 1
IdleAng.SpeedR =  0
IdleAng.AngleP = .15
IdleAng.AngleYaw = .5
IdleAng.AngleR = .5
IdleVec.SpeedX = .5
IdleVec.SpeedY = 0
IdleVec.SpeedZ = .25
IdleVec.VectorX = .25
IdleVec.VectorY = .5
IdleVec.VectorZ = .2
]]
return pos,ang
end

function SWEP:ViewModelDrawn()
local lp = self.Owner
local vm = lp:GetViewModel()
if not lp.ViewModel then lp.ViewModel = ClientsideModel(self.ViewModel,RENDERGROUP_VIEWMODEL) end
if lp.ViewModel:GetParent() != vm then
lp.ViewModel:SetParent(vm)
end
if lp.ViewModel:GetModel() != self.ViewModel then 
lp.ViewModel:SetModel(self.ViewModel)
self:SendVMAnim("draw")
end
lp.ViewModel:SetRenderOrigin(vm:GetPos())
lp.ViewModel:SetRenderAngles(vm:GetAngles())
lp.ViewModel:SetupBones()
lp.ViewModel:SetSkin(lp:GetViewModel():GetSkin())
lp.ViewModel:FrameAdvance(FrameTime())
lp.ViewModel:SetNoDraw(true)
lp.ViewModel:DrawModel()
lp.ViewModel:SetPlaybackRate(vm:GetPlaybackRate())
self.Owner:GetViewModel():SetMaterial("engine/occlusionproxy")

--if cl_ironsights == true then
-----
--[[if self.LadderBone  then
for i = 0,vm:GetBoneCount() do
if vm:GetBoneName(i) == self.LadderBone and self.Owner.climbing == true and cl_reloading == false then
vm:ManipulateBonePosition(i,Vector(-15,0,15))
else
vm:ManipulateBonePosition(i,Vector(0,0,0))
end
end
end]]
------ laserz
if cvarlaser:GetInt() == 1 then
local attachmenttrace = util.TraceLine({
 start = self.Owner:GetViewModel():GetAttachment(1).Pos,
 endpos = self.Owner:GetViewModel():GetAttachment(1).Pos + self.Owner:GetViewModel():GetAttachment(1).Ang:Forward() * 1500,
})
render.SetMaterial(Material("models/farcry3/fc3laser"))
render.DrawBeam(attachmenttrace.StartPos,attachmenttrace.HitPos,.1,0,10,Color(255,0,0,255))
render.SetMaterial(Material("models/farcry3/fc3_sight_dot"))
render.DrawSprite(attachmenttrace.HitPos,math.Rand(1,1.2),math.Rand(1,1.2),white)
end
------
if self.SubMaterials then
for i,m in pairs(self.SubMaterials) do
LocalPlayer().ViewModel:SetSubMaterial(m.index - 1,m.material)
end
else
LocalPlayer().ViewModel:SetSubMaterial()
end
----
local lp = self.Owner
cam.Start3D2D(LocalPlayer().ViewModel:GetAttachment(1).Pos,Angle(EyeAngles().p - 90,EyeAngles().y,180),.1)

cam.End3D2D()
cam.Start3D2D(LocalPlayer().ViewModel:GetAttachment(1).Pos + EyeAngles():Forward() * .8,LocalPlayer().ViewModel:GetAngles(),.01)

cam.End3D2D()
end

function SWEP:PreDrawViewModel()
end

--[[function SWEP:DrawWorldModelTranslucent()
local wm = self.WModel
if not IsValid(self.Owner) then
self:DrawModel() return
end
local bone = self.Owner:LookupBone("ValveBiped.Bip01_R_Hand")
if not IsValid(wm) then
self.WModel = ClientsideModel(self.WorldModel, RENDERGROUP_OPAQUE)
self.WModel:SetNoDraw(true)
self.WModel:SetModelScale(self.Owner:GetModelScale()+(self.WorldModelScale or 0),0)
end
if IsValid(wm) then
if not wm:GetModelScale() != self.Owner:GetModelScale() then
wm:SetModelScale(self.Owner:GetModelScale()+(self.WorldModelScale or 0),0)
end
if bone then
if not self.WorldModelAng.p then
self.WorldModelAng = Angle(0,0,0)
end
if not self.WorldModelPos.x then
self.WorldModelPos = Vector(0,0,0)
end
local pos, ang = self.Owner:GetBonePosition(bone)
ang:RotateAroundAxis(ang:Right(), self.WorldModelAng.p)
ang:RotateAroundAxis(ang:Forward(), self.WorldModelAng.y)
ang:RotateAroundAxis(ang:Up(), self.WorldModelAng.r)
wm:SetRenderOrigin(pos + ang:Right() * self.WorldModelPos.x + ang:Forward() * self.WorldModelPos.y + ang:Up() * self.WorldModelPos.z)
wm:SetRenderAngles(ang)
wm:SetBodygroup(1, 1)
wm:DrawModel()
else
self:DrawModel()
end
end
end]]

local tab = 0
local attachment = 0
local BlurLerp = 0
local m_vmShake = 0
local FakeTime = 0
local m_BoneShake = 0
function SWEP:PostDrawViewModel(vm,ply,weapon)
local lp = LocalPlayer()
local tr = util.TraceLine( {
	start = EyePos(),
	endpos = EyePos() + EyeAngles():Forward() * 10000,
	mask = CONTENTS_SOLID + CONTENTS_OPAQUE + CONTENTS_DEBRIS + CONTENTS_HITBOX + CONTENTS_MONSTER,
	} )
--- BLURS AND OTHER THINGIES
if cvarblurs:GetInt() == 1 then
if lp:GetNWBool("owner_reloading") == true then
BlurLerp = Lerp(5*FrameTime(),BlurLerp,2)
else BlurLerp = Lerp(5*FrameTime(),BlurLerp,0) end
for i = 1,BlurLerp,0.5 do
cam.Start3D2D(LocalPlayer():EyePos() + LocalPlayer():EyeAngles():Forward() * 100,LocalPlayer():EyeAngles() + Angle(90,0,0) ,1)
	surface.SetDrawColor(255,255,255,255)
	render.UpdateScreenEffectTexture() 
	surface.SetMaterial(Material("pp/toytown-top"))
	surface.DrawTexturedRect(-ScrW(),-ScrH(),ScrW()*2,ScrH()*2)
cam.End3D2D()
end
local Mat1 = Material("pp/toytown-top")
--Mat1:SetTexture("$fbtexture", render.GetScreenEffectTexture())
--[[for i = 0,4 do
if IsValid(lp.ViewModel) and cl_ironsights == true then
		render.ClearStencil()
		render.SetStencilEnable(true)
			render.SetStencilWriteMask(255) 
			render.SetStencilTestMask(255)
			render.SetStencilReferenceValue(15)
			render.SetStencilFailOperation(STENCILOPERATION_REPLACE)
			render.SetStencilZFailOperation(STENCILOPERATION_REPLACE)
			render.SetStencilPassOperation(STENCILOPERATION_REPLACE)
			render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_LESS)
			render.SetStencilCompareFunction(STENCILCOMPARISONFUNCTION_EQUAL)
			--lp.ViewModel:SetMaterial("models/effects/vol_light001")
			lp.ViewModel:DrawModel()
			render.UpdateScreenEffectTexture()
			render.SetMaterial(Mat1)
			render.DrawQuadEasy( lp:EyePos() + lp:EyeAngles():Forward() * 20 + lp:EyeAngles():Up() * -5, -lp:EyeAngles():Forward(), 64, 12, Color( 255, 255, 255 ), 0 )
			--render.DrawScreenQuad()
			render.SetStencilEnable(false)
end	
end]]
	end
--cam.End3D2D()
--end
------
if self.SimBone then
for b = 0,vm:GetBoneCount() do
for i,e in pairs(self.SimBone) do
if vm:GetBoneName(b) == e.bone then
if cl_ironsights == true  then
lp.ViewModel:ManipulateBonePosition(b,Vector(math.sin(m_BoneShake) * e.pos.x,math.sin(m_BoneShake) * e.pos.y,math.sin(m_BoneShake) * e.pos.z))
lp.ViewModel:ManipulateBoneAngles(b,Angle(math.sin(m_BoneShake) * e.ang.p,math.sin(m_BoneShake) * e.ang.y,math.sin(m_BoneShake) * e.ang.r))
else
lp.ViewModel:ManipulateBonePosition(b,LerpVector(20*FrameTime(),lp.ViewModel:GetManipulateBonePosition(b),Vector(0,0,0)))
lp.ViewModel:ManipulateBoneAngles(b,LerpAngle(20*FrameTime(),lp.ViewModel:GetManipulateBoneAngles(b),Angle(0,0,0)))
end
end
end
end
end
return
end


function SWEP:DrawHUD()
	if cl_ironsights == false and self.Owner:GetNWBool("owner_reloading") == false and cl_sprinting == false and cvarcrosshair:GetInt() == 1 then
	surface.SetDrawColor(cvarcrr:GetInt(),cvarcrg:GetInt(),cvarcrb:GetInt(),255)
	surface.DrawRect(ScrW() / 2,ScrH() / 1.95 + self.Primary.Cone * 100 + m_FireSpread * 400 + m_MoveSpread * 300,ScreenScale(.5),ScreenScale(5))
	surface.DrawRect(ScrW() / 2,ScrH() / 2.10 - self.Primary.Cone * 100 - m_FireSpread * 400 - m_MoveSpread * 300,ScreenScale(.5),ScreenScale(5))
	surface.DrawRect(ScrW() / 1.97 + self.Primary.Cone * 100 + m_FireSpread * 400 + m_MoveSpread * 300 ,ScrH() / 2,ScreenScale(5),ScreenScale(.5))
	surface.DrawRect(ScrW() / 2.055 - self.Primary.Cone * 100 - m_FireSpread * 400 - m_MoveSpread * 300 ,ScrH() / 2,ScreenScale(5),ScreenScale(.5))
	end
	if cvarhud:GetInt() == 1 then
	surface.SetMaterial(Material("cw2/gui/gradient"))
	surface.SetDrawColor(0,0,0,255)
	surface.DrawTexturedRectRotated(ScrW() * .965,ScrH() * .925,ScreenScale(50),ScreenScale(30),180)
	local w = LocalPlayer():GetActiveWeapon()
	local clamp = math.Clamp(w:Clip1(),0,50)
	local clamp2 = math.Clamp(self.Primary.ClipSize,0,50)
	local ammo = LocalPlayer():GetAmmoCount(w:GetPrimaryAmmoType())
	if ammo > 0 then
	draw.SimpleText(ammo,"Default",ScrW() * .995,ScrH() * .94,Color(255,255,255,255),TEXT_ALIGN_RIGHT,TEXT_ALIGN_RIGHT)
	end
	for blank1 = 1,clamp2 do
	surface.SetDrawColor(100,100,100,150)
	surface.DrawRect(ScrW() * .995 - (blank1 * (6 - math.Round(clamp / 100,0))) ,ScrH() * .915,ScreenScale(3),ScreenScale(8))
	end
	for i = 1,clamp do 
	surface.SetDrawColor(255,255,255,255)
	surface.DrawRect(ScrW() * .995 - (i * (6 - math.Round(clamp / 100,0))) ,ScrH() * .915,ScreenScale(3),ScreenScale(8))
	if i == clamp then 
	draw.SimpleText(w:Clip1(),"Default",ScrW() * .99 - (i * (6 - math.Round(clamp / 100,0))),ScrH() * .9,Color(255,255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
	end
	end
	for blank2 = 1,clamp2 do
	surface.SetDrawColor(0,0,0,255)
	surface.DrawOutlinedRect(ScrW() * .995 - (blank2 * (6 - math.Round(clamp / 100,0))) ,ScrH() * .915,ScreenScale(3),ScreenScale(8))
	end
	--[[draw.RoundedBox(6,LocalPlayer().ViewModel:GetAttachment(1).Pos:ToScreen().x -60,LocalPlayer().ViewModel:GetAttachment(1).Pos:ToScreen().y +40,ScreenScale(30),ScreenScale(30),Color(0,0,0,150))
	draw.RoundedBox(0,LocalPlayer().ViewModel:GetAttachment(1).Pos:ToScreen().x -60,LocalPlayer().ViewModel:GetAttachment(1).Pos:ToScreen().y+ 40,ScreenScale(1),ScreenScale(1),Color(0,100,255,255))
	draw.RoundedBox(0,LocalPlayer().ViewModel:GetAttachment(1).Pos:ToScreen().x +6,LocalPlayer().ViewModel:GetAttachment(1).Pos:ToScreen().y + 40,ScreenScale(1),ScreenScale(1),Color(0,100,255,255))
	draw.RoundedBox(0,LocalPlayer().ViewModel:GetAttachment(1).Pos:ToScreen().x +6,LocalPlayer().ViewModel:GetAttachment(1).Pos:ToScreen().y +106,ScreenScale(1),ScreenScale(1),Color(0,100,255,255))
	draw.RoundedBox(0,LocalPlayer().ViewModel:GetAttachment(1).Pos:ToScreen().x -60,LocalPlayer().ViewModel:GetAttachment(1).Pos:ToScreen().y +106,ScreenScale(1),ScreenScale(1),Color(0,100,255,255))
	draw.SimpleText("hi","BaseFont",LocalPlayer().ViewModel:GetAttachment(1).Pos:ToScreen().x -60,LocalPlayer().ViewModel:GetAttachment(1).Pos:ToScreen().y +40,Color(255,255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)]]
	end
self:MergeHUDFunction()
end

function HideHUDlements( name )
if !LocalPlayer():GetActiveWeapon():IsValid() then return end
	if LocalPlayer():GetActiveWeapon().Base == "base" then
    if (name == "CHudDamageIndicator") then
        return false
    end
end
end
hook.Add("HUDShouldDraw","HUDResmove",HideHUDlements)

function m_PlayerCam(cmd)
if LocalPlayer():GetActiveWeapon().Base == "base" then
local self = LocalPlayer():GetActiveWeapon()
local cmd_ang = cmd:GetViewAngles()
attachment = LocalPlayer():GetViewModel():GetAttachment(LocalPlayer():GetActiveWeapon().CamAttachTo or 1)
cmd:SetViewAngles(Angle(cmd_ang.p, cmd_ang.y, cmd_ang.r))
--- Misc.
if self.ShellAttachment then
tab = self.Owner.ViewModel:GetAttachment(self.ShellAttachment)--- This updates the shell ejection's position more often.
end
end
end
hook.Add("CreateMove","BaseCam111",m_PlayerCam)

local xlerp = 0
local ylerp = 0
local SwayTimeX = 0
local SwayTimeY = 0
local mousex = 0
local mousey = 0
function m_Sway(cmd,x,y,angle)
mousex = x
mousey = y
end
hook.Add("InputMouseApply","m_WeaponSway",m_Sway)

--- misc
//
--------
--- weapon states -|
cl_ironsights = false
cl_sprinting = false
cl_climbing = false
cl_reloading = false -- it's back babyyyyyy
cl_drawing = false  -- oh ye.
cl_firing = false
cl_crouching = false
-------------------|
local PosTracker = Vector(0,0,0)

function m_PlayerView(ply,origin,angles,fov,vm_origin,vm_angles)
if ply:GetActiveWeapon().Base == "base" then
local self = ply:GetActiveWeapon()
local owner = ply
FOV = Lerp(15*FrameTime(),FOV,FOV_t)
SApp = Lerp(6*FrameTime(),SApp,cl_Shake)
local m_PlayerCam = GAMEMODE:CalcView(ply,origin,angles,fov,vm_origin,vm_angles)
if cvarweaponcam:GetInt() == 1 then
m_PlayerCam.origin =  ply:GetViewModel():GetAttachment(1).Pos
m_PlayerCam.angles = ply:GetViewModel():GetAttachment(1).Ang
else
m_PlayerCam.angles = Angle(angles.p - BlandVert * 100 - SAng.ViewPunch.p - VMPunch.EffectiveP * .5 ,angles.y + e_BlandHoriz * 1.5 + VMPunch.EffectiveY * .5,angles.r + m_vmRandomize/1.5 + VMPunch.EffectiveR * .5) + Angle(math.sin(CurTime() * (VMAng.SpeedP)) * VMAng.AngleP/12,math.sin(CurTime() * (VMAng.SpeedYaw)) * VMAng.AngleYaw/12,math.sin(CurTime() * (VMAng.SpeedR)) * VMAng.AngleR/12) + Angle(0+SAng.SmoothP,0+SAng.SmoothYaw,0)
m_PlayerCam.origin = origin
end
m_PlayerCam.fov = FOV--math.Clamp(90 + SApp,90,100)
CLVec.VectorX = math.Approach(CLVec.VectorX,CLVec.Target.x,(CLVec.VectorX-CLVec.Target.x)*CLVec.SpeedX*FrameTime())   -- * ply:GetViewModel():GetModelBounds():Length() / 90
CLVec.VectorY = math.Approach(CLVec.VectorY,CLVec.Target.y,(CLVec.VectorY-CLVec.Target.y)*CLVec.SpeedY*FrameTime())
CLVec.VectorZ = math.Approach(CLVec.VectorZ,CLVec.Target.z,(CLVec.VectorZ-CLVec.Target.z)*CLVec.SpeedZ*FrameTime())   -- * ply:GetViewModel():GetModelBounds():Length() / 60
CLAng.AngleP = math.Approach(CLAng.AngleP,CLAng.Target.y,(CLAng.AngleP-CLAng.Target.y)*CLAng.SpeedYaw*FrameTime()) 
CLAng.AngleYaw = math.Approach(CLAng.AngleYaw,CLAng.Target.x,(CLAng.AngleYaw-CLAng.Target.x)*CLAng.SpeedP*FrameTime())--+ easyland 
CLAng.AngleR = math.Approach(CLAng.AngleR,CLAng.Target.z,(CLAng.AngleR-CLAng.Target.z)*CLAng.SpeedR*FrameTime()) 
BlandVert = Lerp(3*FrameTime(),BlandVert,cl_Recoil)
BlandHoriz = Lerp(3*FrameTime(),BlandHoriz,SAng.ViewPunch.y)
e_BlandHoriz = Lerp(6*FrameTime(),e_BlandHoriz,m_vmRandomize)
angles:RotateAroundAxis(angles:Right(),CLAng.AngleYaw)
angles:RotateAroundAxis(angles:Up(),CLAng.AngleP)
angles:RotateAroundAxis(angles:Forward(),CLAng.AngleR)

origin = origin + CLVec.VectorZ * angles:Up()
origin = origin + CLVec.VectorY * angles:Forward()
origin = origin + CLVec.VectorX * angles:Right()

m_PlayerCam.vm_origin = origin
m_PlayerCam.vm_angles = angles

--- VMODEL MOVING OPERATIONS
---PUNCH
VMPunch.Time = VMPunch.Time + 10*FrameTime()
VMPunch.AngleP = Lerp(VMPunch.Force*FrameTime(),VMPunch.AngleP,0)
VMPunch.AngleY = Lerp(VMPunch.Force*FrameTime(),VMPunch.AngleY,0)
VMPunch.AngleR = Lerp(VMPunch.Force*FrameTime(),VMPunch.AngleR,0)
VMPunch.EffectiveP = math.sin(VMPunch.Time * 1) * VMPunch.AngleP
VMPunch.EffectiveY = math.sin(VMPunch.Time * 1) * VMPunch.AngleY
VMPunch.EffectiveR = math.sin(VMPunch.Time * 1) * VMPunch.AngleR
-------
---SWAY
xlerp = Lerp(5*FrameTime(),xlerp,mousex)
ylerp = Lerp(5*FrameTime(),ylerp,mousey)
if mousex != 0 then
SwayInput.e_cmdX = Lerp(25*FrameTime(),SwayInput.e_cmdX,mousex)
SwayTimeX = -2
else
SwayTimeX = SwayTimeX + (10) * FrameTime()
SwayInput.e_cmdX = math.sin(SwayTimeX) * xlerp
end
if mousey != 0  then
SwayInput.e_cmdY = Lerp(25*RealFrameTime(),SwayInput.e_cmdY,mousey)
SwayTimeY = -2
else
SwayTimeY = SwayTimeY + (10) * FrameTime()
SwayInput.e_cmdY = math.sin(SwayTimeY) * ylerp
end
----
if cl_lastshoottime < MGTime then
FakeTime = FakeTime +  (10) * FrameTime()
SAng.ViewPunch.p = Lerp(6*FrameTime(),SAng.ViewPunch.p,math.sin(FakeTime * 1) * cl_Shake * 3.5 )
SAng.ViewPunch.y = Lerp(6*FrameTime(),SAng.ViewPunch.y,math.sin(FakeTime * 1) * m_vmRandomize *1 )
cl_firing = false
if self.SimBone then
m_BoneShake = Lerp(20*FrameTime(),m_BoneShake,0)
end
else
cl_firing = true
FakeTime = 1
if self.SimBone then
m_BoneShake = 1
end
SAng.ViewPunch.p = cl_Shake
SAng.ViewPunch.y = m_vmRandomize
end
m_vmShake = math.sin(FakeTime * 1.5) * cl_Shake
MGTime = MGTime +  (10) * FrameTime()
CLVec.Trace = util.TraceLine({
start = self.Owner:GetViewModel():GetPos() + self.Owner:GetViewModel():GetAngles():Right() * 2.5,
endpos = self.Owner:GetViewModel():GetPos() + self.Owner:GetViewModel():GetAngles():Forward() * 1000,
filter = function(ent) if !ent:GetClass() == ("worldspawn" or "prop_physics") then return false end end,
})
--print("sprinting: "..tostring(cl_sprinting).." | ironsights: "..tostring(cl_ironsights))

CLVec.Target = (self.OriginPos or Vector(0,0,0)) + Vector(m_vmRandomize/3,-m_vmShake/2,-m_vmShake/2) + Vector(0,math.Clamp((CLVec.Trace.HitPos:Distance(CLVec.Trace.StartPos)-24),-5,0),0) + Vector(SwayInput.e_cmdX/200,SwayInput.e_cmdY/200,-SwayInput.e_cmdY/200 + SwayInput.e_cmdX/400) + Vector(VMPunch.EffectiveY/10,0,-VMPunch.EffectiveP/10 + VMPunch.EffectiveR/10) + Vector(0,ply:EyeAngles().p/70,0)
CLAng.Target = (self.OriginAng or Vector(0,0,0)) + Vector(m_vmShake*4 + BlandVert * 100 ,m_vmRandomize*3,0) + Vector(SwayInput.e_cmdY/15,SwayInput.e_cmdX/25,SwayInput.e_cmdX/15) + Vector(VMPunch.EffectiveP,VMPunch.EffectiveY,VMPunch.EffectiveR)

if owner:KeyDown(IN_ATTACK2) and owner:IsOnGround() and cl_sprinting  == false and owner:GetNWBool("owner_reloading") == false and owner:GetNWBool("owner_drawing") == false and owner:GetActiveWeapon().CanAIDS != false then
if cl_ironsights == false then 
cl_ironsights = true
owner:EmitSound(table.Random({"cw/sightraise2.wav","cw/sightraise1.wav"}),80,math.random(100,120))
PunchViewmodel(Angle(0,-1,.5),5)
end
cl_ironsights = true
CLVec.Target = self.IronSightsPos + Vector(0,-m_vmShake*.85,0) + Vector(SwayInput.e_cmdX/800,0,-SwayInput.e_cmdY/800) + Vector(VMPunch.EffectiveY/10,0,-VMPunch.EffectiveP/10 + VMPunch.EffectiveR/10)
CLAng.Target = self.IronSightsAng + Vector(m_vmShake + BlandVert * 100,0 + BlandHoriz, 0 +m_vmRandomize*2) + Vector(SwayInput.e_cmdY/60,SwayInput.e_cmdX/100,SwayInput.e_cmdX/40) + Vector(VMPunch.EffectiveP,VMPunch.EffectiveY,VMPunch.EffectiveR)
else 
if cl_ironsights == true then
cl_ironsights = false
owner:EmitSound(table.Random({"cw/sightlower2.wav","cw/sightlower1.wav"}),80,math.random(150,160))
PunchViewmodel(Angle(0,1,-.3),5)
end
end

--[[if ply:GetMoveType() == MOVETYPE_LADDER and not cl_reloading == true then 
CLVec.Target = CLVec.Target + Vector(0,0,0) + Vector(0,-cl_Shake,0) + Vector(math.abs(ply:EyeAngles().p/60),0,ply:EyeAngles().p/40)
CLAng.Target = CLAng.Target + Vector(0,0,-10) + Vector(cl_Shake*3,0,-cl_Shake*4) + Vector((ply:GetAngles().p-ply:EyeAngles().p)/2,0,-ply:EyeAngles().p/3)
end]]

if owner:KeyDown(IN_SPEED) and owner:IsOnGround() and owner:GetVelocity():Length() >  owner:GetWalkSpeed() * 1.3 and not owner:Crouching() then
if cl_sprinting == false then
cl_sprinting = true
end
if owner:GetNWBool("owner_reloading") == false then
CLVec.Target = self.SprintPos
CLAng.Target = self.SprintAng
end
CLVec.SpeedX = 2
CLVec.SpeedY = 1
CLVec.SpeedZ = 2
CLAng.SpeedYaw = 2
CLAng.SpeedP = 2
CLAng.SpeedR = 2
else 
CLVec.SpeedX = 25
CLVec.SpeedY = 23
CLVec.SpeedZ = 25
CLAng.SpeedYaw = 16
CLAng.SpeedP = 16
CLAng.SpeedR = 16
if cl_sprinting == true then
cl_sprinting = false
end
end

---- MORE CAMERA MOVEMENT
if ( owner:GetNWBool("owner_reloading") == true or owner:GetNWBool("owner_drawing") == true) and !self.CamIgnore == true then
	SAng.SmoothP = 0
	SAng.SmoothYaw = 0
	SAng.SmoothR = 0
else
	SAng.SmoothP = Lerp(10*FrameTime(),SAng.SmoothP,0)
	SAng.SmoothYaw = Lerp(10*FrameTime(),SAng.SmoothYaw,0)
	SAng.SmoothR = Lerp(10*FrameTime(),SAng.SmoothR,0)
end
if cl_ironsights == true and not owner:GetNWBool("owner_reloading") == true and not cl_sprinting == true and not owner:GetNWBool("owner_drawing") == true then
FOV_t = (self.IronSightsFOV or 80) - SApp * 3
else
FOV_t = math.Clamp(LocalPlayer():GetInfoNum("fov_desired",90) + SApp * 2,90,100)
end

return m_PlayerCam,GAMEMODE:CalcView(ply,origin,angles,fov,vm_origin,vm_angles)
end
end
hook.Add("CalcView","BasePView",m_PlayerView)


function CalcViewFixUp(  wep,  vm,  oldPos,  oldAng,  origin,  angles )
if LocalPlayer():GetActiveWeapon().Base == "base" and !LocalPlayer():InVehicle() then
local owner = LocalPlayer()
local b = owner:EyeAngles()
if not owner or not IsValid(owner) then return end
local self = owner:GetActiveWeapon()
angles:RotateAroundAxis(angles:Right(),CLAng.AngleYaw)
angles:RotateAroundAxis(angles:Up(),CLAng.AngleP)
angles:RotateAroundAxis(angles:Forward(),CLAng.AngleR)

origin = origin + CLVec.VectorZ * angles:Up()
origin = origin + CLVec.VectorY * angles:Forward()
origin = origin + CLVec.VectorX * angles:Right()
origin,angles = self:GetViewModelPosition(origin,angles)

return origin,angles
end
end
hook.Add("CalcViewModelView","Fixit",CalcViewFixUp)

----CUSTOM

function PunchViewmodel(angle,force)
VMPunch.Time = 0
VMPunch.AngleP = angle.p
VMPunch.AngleY = angle.y
VMPunch.AngleR = angle.r
VMPunch.Force = force
end

if CLIENT then
LocalPlayer().landtime = 0
hook.Add("OnPlayerHitGround","gr-gr-gr-ground!",function(ply,inWater, onFloater, speed)
if not IsFirstTimePredicted() then return end
if ply:GetActiveWeapon().Base == "base" then
ply.landtime = CurTime()
PunchViewmodel(Angle(-speed/20,0,speed/40),9)
if speed > 100 then
ply:EmitSound("player/jumplanding"..math.random(2,4)..".wav",40)
end
end
end)

end

function SWEP:CreateShell()
if CLIENT then
		if !self.ShellAttachment then return end
		local ent = ClientsideModel(Shells[self.ShellModel] or self.ShellModel, RENDERGROUP_BOTH)
		ent:SetPos(tab.Pos)
		ent:PhysicsInitBox(Vector(-0.5, -0.15, -0.5), Vector(0.5, 0.15, 0.5))
		ent:SetAngles(self.Owner:EyeAngles())
		ent:SetMoveType(MOVETYPE_VPHYSICS) 
		ent:SetSolid(SOLID_VPHYSICS) 
		ent:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
		local phys = ent:GetPhysicsObject()
		phys:SetMaterial("gmod_silent")
		phys:SetMass(10)
		phys:SetVelocity(tab.Ang:Forward()*math.random(self.ShellEjectSpeed,self.ShellEjectSpeed+100)+self.Owner:GetVelocity())
		timer.Simple(10,function() ent:Remove(ent) end)
end
end


function SWEP:FireAnimationEvent(event)
	return true
end

if CLIENT then
function CLThink()
local owner = LocalPlayer()
local self = owner:GetActiveWeapon()
if self.DrawSounds then
for i,ds in pairs(self.DrawSounds) do
if owner:GetNWBool("owner_drawing") == true and ds.played == false  and CurTime() > tonumber(self.Owner:GetNWString("drawtime")) + ((ds.time - self.Owner:Ping() / 1000) / self.Owner:GetViewModel():GetPlaybackRate()) then
ds.played = true 
LocalPlayer():EmitSound(ds.soundfile,75,100)
elseif owner:GetNWBool("owner_drawing") == false or CurTime() < tonumber(self.Owner:GetNWString("drawtime")) + ((ds.time - self.Owner:Ping() / 1000) / self.Owner:GetViewModel():GetPlaybackRate()) then
ds.played = false
end
end
end
----
------
end
hook.Add("Think","secondthink",CLThink)
end

function SWEP:SendVMAnim(anim)
if SERVER then 
net.Start("m_Anim")
net.WriteString(table.Random(self.Animations[anim]))
net.WriteString(anim)
net.Send(self.Owner)
end
if CLIENT then
local clvm = LocalPlayer().ViewModel
clvm:ResetSequence(table.Random(self.Animations[anim]))
clvm:SetCycle(0)
end
end

function SWEP:SetEvent(states,bools)
if CLIENT then print("Why are you using this on client?!") return end
if SERVER then
net.Start("m_State")
net.WriteTable(states)
net.WriteTable(bools)
net.Send(self.Owner)
end
end


---VARIOUS NET RECEIVES---
if CLIENT then
	net.Receive("m_Anim",function(len,ply)
	local sequence = net.ReadString()
	local actuals = net.ReadString()
	LocalPlayer().ViewModel:ResetSequence(sequence)
	LocalPlayer().ViewModel:SetCycle(0)
	end)

	net.Receive("m_State",function(len,ply)
	local cl_states = net.ReadTable()
	local cl_bools = net.ReadTable()
	for i, states in pairs (cl_states) do
	if states == "reloading" then
	cl_reloading = tobool(cl_bools[i])
	elseif states == "drawing" then
	cl_drawing = tobool(cl_bools[i])
	end
	end
	end)
end
