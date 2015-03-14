
if SERVER then
util.AddNetworkString("bl2_3d2dshield")

hook.Add("PlayerHurt","fuckthisshitpolz",function(victim,attacker,damageTaken,healthRemaining)
if victim:IsPlayer() and victim:Armor() > 0 then
net.Start("bl2_3d2dshield")
net.WriteTable({victim,attacker,healthRemaining})
net.Broadcast()
end
end)

end
if CLIENT then
local s_alpha1 = 0
local s_alpha2 = 0
local sound_1 = false

hook.Add( "HUDPaint", "BL2_Render3", function()
	local Armor = LocalPlayer():GetNWInt("Shield",LocalPlayer():Armor())
	s_alpha1 = Lerp(1*FrameTime(),s_alpha1,Armor)
	surface.SetDrawColor(0,155,255,155 + (Armor - s_alpha1) * 20)
	surface.SetMaterial(Material("sprites/mechshield"))
	surface.DrawTexturedRectUV(0,ScrH() * .97,ScrW(),ScreenScale(70),2 + (CurTime()/10),0 ,0 + (CurTime()/10),.2)
	if Armor > 0 then
		surface.SetDrawColor(0,155,255,0 - (Armor - s_alpha1) * 10)
		surface.SetMaterial(Material("sprites/mechshield"))
		surface.DrawTexturedRect(ScrW() * -.15,ScrH() * -.35,ScreenScale(200),ScreenScale(200))
		surface.DrawTexturedRect(ScrW() * .85,ScrH() * -.35,ScreenScale(200),ScreenScale(200))
		surface.DrawTexturedRect(ScrW() * -.15,ScrH() * .85,ScreenScale(200),ScreenScale(200))
		surface.DrawTexturedRect(ScrW() * .85,ScrH() * .85,ScreenScale(200),ScreenScale(200))

	end
	if Armor <= 0 then
		if sound_1 == true then
			util.ScreenShake( EyePos(), 3, 5, 2, 5000 )
			sound_1 = false
			LocalPlayer():EmitSound("buttons/og_button_down_0"..math.random(1,3)..".wav",100,100)
		end
		s_alpha2 = s_alpha2 + 2
		surface.SetDrawColor(0,155,255,155 - (s_alpha2))
		surface.SetMaterial(Material("combinemechhud/broken"))
		surface.DrawTexturedRect(0,0,ScrW(),ScrH())
	else sound_1 = true 
		s_alpha2 = 0
	end
end )
local received = {}
local tablenum = 0

hook.Add("PostDrawOpaqueRenderables","hllyshit",function()
	for i,d in pairs(received) do
		if d.alpha > 1 then
			d.alpha = Lerp(1*FrameTime(),d.alpha,0)
			local offset = Angle(270,d.faggotang.y,0)

			cam.Start3D2D(d.dmgpos + d.randompos + offset:Up() * 15,Angle(270,d.faggotang.y,0),.5)
				surface.SetDrawColor(0,155,255,d.alpha) 
				surface.SetMaterial(Material("sprites/mechshield"))
				local size = 20 + d.dmgnumber
				surface.DrawTexturedRect(-size/2,-size/2,size,size)
			cam.End3D2D()
		else
			received[i] = nil
		end
		d.alpha = Lerp(5*FrameTime(),d.alpha,0)
	end
end)

net.Receive("bl2_3d2dshield",function(len,ply)
local cltable = net.ReadTable()
tablenum = tablenum + 1
received[tablenum] = {		faggot = cltable[2],
							faggotpos = cltable[2]:GetPos(),
							faggotang = cltable[2]:GetAngles(),
							dmgnumber = cltable[3],
							dmgpos = cltable[1]:EyePos(),
							randompos = Vector(0,0,math.random(-20,2)),
							alpha = 255,
							secondfaggot = cltable[1],
}
end)
end
