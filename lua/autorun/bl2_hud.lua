--fucking finally, 3 hours of this bullshit. -.-
if SERVER then

util.AddNetworkString("bl2_3d2dshield")
local sv_sending = {}
local tablenum = 0
function SendDamageInfo(attacker,pos,damage,victim)
tablenum = tablenum + 1
sv_sending[tablenum] = {faggot = attacker,
						faggotpos = attacker:GetPos(),
						faggotang = attacker:GetAngles(),
						dmgpos = pos,
						dmgnumber = damage,
						alpha = 255,
						secondfaggot = victim,
					}
net.Start("bl2_3d2dshield")
net.WriteTable(sv_sending)
net.Broadcast()
end
hook.Add("EntityTakeDamage","bl2takedamageplz",function(target,dmg)
if target:IsPlayer() and target:Armor() > 0 then
SendDamageInfo(dmg:GetAttacker(),dmg:GetDamagePosition(),dmg:GetDamage(),target)
end
end)

hook.Add("Think","mmmmmmhhhhh",function()
for i, t in pairs(sv_sending) do
t.alpha = Lerp(5*FrameTime(),t.alpha,0)
if t.alpha <= 0 then table.remove(sv_sending,i) end
end
end)

end




if CLIENT then
local received = {}
net.Receive("bl2_3d2dshield",function(len,ply)
received = net.ReadTable()
end)

hook.Add("PostDrawOpaqueRenderables","hllyshit",function()
for i,d in pairs(received) do
	if d.alpha > 1 then
	d.alpha = Lerp(5*FrameTime(),d.alpha,0)
	cam.Start3D2D(d.dmgpos + d.secondfaggot:GetAngles():Forward()* -5,Angle(270,d.faggotang.y,0),.5)
	surface.SetDrawColor(0,155,255,d.alpha) 
	surface.SetMaterial(Material("sprites/mechshield"))
	surface.DrawTexturedRect(0,0,d.dmgnumber * 2,d.dmgnumber * 2)
	cam.End3D2D()
end
end
end)

local s_alpha1 = 0
local s_alpha2 = 0
local sound_1 = false

hook.Add( "HUDPaint", "BL2_Render3", function()
s_alpha1 = Lerp(1*FrameTime(),s_alpha1,LocalPlayer():Armor())
if LocalPlayer():Armor() > 0 then
surface.SetDrawColor(0,155,255,0 - (LocalPlayer():Armor() - s_alpha1) * 10)
surface.SetMaterial(Material("sprites/mechshield"))
surface.DrawTexturedRect(ScrW() * -.15,ScrH() * -.35,ScreenScale(200),ScreenScale(200))
surface.DrawTexturedRect(ScrW() * .85,ScrH() * -.35,ScreenScale(200),ScreenScale(200))
surface.DrawTexturedRect(ScrW() * -.15,ScrH() * .85,ScreenScale(200),ScreenScale(200))
surface.DrawTexturedRect(ScrW() * .85,ScrH() * .85,ScreenScale(200),ScreenScale(200))
end
if LocalPlayer():Armor() <= 0 then
if sound_1 == true then
util.ScreenShake( EyePos(), 3, 5, 2, 5000 )
sound_1 = false
LocalPlayer():EmitSound("plats/crane/vertical_stop.wav",50,100)
end
s_alpha2 = s_alpha2 + 2
surface.SetDrawColor(0,155,255,155 - (s_alpha2))
surface.SetMaterial(Material("combinemechhud/broken"))
surface.DrawTexturedRect(0,0,ScrW(),ScrH())
else sound_1 = true s_alpha2 = 0 end
end )

hook.Add("PostDrawOpaqueRenderables","BL2_Render4",function()

end)

end