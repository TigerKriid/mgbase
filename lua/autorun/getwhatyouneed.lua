
if SERVER then
util.AddNetworkString("bl2_3d2dshield")
util.AddNetworkString("bl2_xpscreen")
--[[hook.Add("PlayerHurt","fuckthisshitpolz",function(victim,attacker,damageTaken,healthRemaining)
if victim:IsPlayer() and victim:Armor() > 0 then
net.Start("bl2_3d2dshield")
net.WriteTable({victim,attacker,healthRemaining})
net.Broadcast()
end
end)]]
hook.Add("OnNPCKilled","fuckshitshigh",function(npc,attacker,inflictor)
if attacker:IsPlayer() and npc:Disposition(attacker) == D_HT then
	net.Start("bl2_xpscreen")
	net.WriteString("12230")
	net.Broadcast()
end
end)

end
if CLIENT then
local s_alpha1 = 0
local s_alpha2 = 0
local sound_1 = false
local BL2HUD_lvl_time = 0
local lvl_textposx = 0
local lvl_textposy = 0
local lvl_string = ""
local xptable = {}
local xptable_i = 0
surface.CreateFont( "BL2Font_1", {
	        font = "Impact",
	        size = 80,
	        weight = 500,
	        blursize = .6,
	        scanlines = 0,
	        antialias = true,
	        underline = false,
	        italic = false,
	        strikeout = false,
	        symbol = false,
	        rotary = false,
	        shadow = false,
	        additive = false,
	        outline = false, 
	} )

surface.CreateFont( "BL2Font_2", {
	        font = "Impact",
	        size = 90,
	        weight = 500,
	        blursize = .6,
	        scanlines = 0,
	        antialias = true,
	        underline = false,
	        italic = false,
	        strikeout = false,
	        symbol = false,
	        rotary = false,
	        shadow = false,
	        additive = false,
	        outline = false, 
	} )

surface.CreateFont( "BL2Font_3", {
	        font = "Impact",
	        size = 40,
	        weight = 500,
	        blursize = .6,
	        scanlines = 0,
	        antialias = true,
	        underline = false,
	        italic = false,
	        strikeout = false,
	        symbol = false,
	        rotary = false,
	        shadow = false,
	        additive = false,
	        outline = false, 
	} )
surface.CreateFont( "BL2Font_4", {
	        font = "Impact",
	        size = 25,
	        weight = 500,
	        blursize = .6,
	        scanlines = 0,
	        antialias = true,
	        underline = false,
	        italic = false,
	        strikeout = false,
	        symbol = false,
	        rotary = false,
	        shadow = false,
	        additive = false,
	        outline = false, 
	} )

function LVLUpScreen(lvl)
BL2HUD_lvl_time = 0
lvl_textposx = ScrW() * 1.5
lvl_textposy = ScrH() * 122500
lvl_string = lvl
LocalPlayer():EmitSound("ui/startup_02_01.wav")
end

hook.Add( "HUDPaint", "BL2_Render3", function()
local hp = LocalPlayer():Health()
local move = math.sin(CurTime() * 1) * 1
s_alpha1 = Lerp(1*FrameTime(),s_alpha1,LocalPlayer():Armor())
BL2HUD_lvl_time = BL2HUD_lvl_time + (.1) * FrameTime()
lvl_textposx = Lerp(5*FrameTime(),lvl_textposx,ScrW() * (.6 - BL2HUD_lvl_time))
lvl_textposy = Lerp(5*FrameTime(),lvl_textposy,ScrH() * (.65 - BL2HUD_lvl_time / 10))

draw.SimpleText("LEVEL UP","BL2Font_2",lvl_textposx,ScrH() * .75,Color(0,200,255,155 - BL2HUD_lvl_time * 600),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
draw.SimpleTextOutlined("LEVEL UP","BL2Font_1",lvl_textposx,ScrH() * .75,Color(255,220,0,255 - BL2HUD_lvl_time * 1000),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER,2,Color(0,0,0,255 - BL2HUD_lvl_time * 1000))

draw.SimpleText(lvl_string,"BL2Font_2",ScrW() * .5,lvl_textposy + 5,Color(0,200,255,155 - BL2HUD_lvl_time * 400),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
draw.SimpleTextOutlined(lvl_string,"BL2Font_1",ScrW() * .5,lvl_textposy,Color(255,220,0,255 - BL2HUD_lvl_time * 600),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER,2,Color(0,0,0,255 - BL2HUD_lvl_time * 600))


--[[surface.SetDrawColor(0,155,255,55)
surface.DrawPoly({
{x	=	ScrW() / 14.693,y	=	ScrH() / 1.097},
{x	=	ScrW() / 15.483,y	=	ScrH() / 1.044},
{x	=	ScrW() / 4.186,y	=	ScrH() / 1.057},
{x	=	ScrW() / 4.705,y	=	ScrH() / 1.119},
})]]
----XPbar
surface.SetDrawColor(0,0,0,255)
surface.DrawPoly({
	{x	=	ScrW() / 1.451 + move,y	=	ScrH() / 1.027+ move},
	{x	=	ScrW() / 3.512+ move,y	=	ScrH() / 1.027+ move},
	{x	=	ScrW() / 3.404+ move ,y	=	ScrH() / 1.05+ move},
	{x	=	ScrW() / 1.448+ move ,y	=	ScrH() / 1.055+ move},
})
surface.SetDrawColor(0,155,255,255)
surface.DrawRect(ScrW() * .296 + move,ScrH() * .956 + move,ScreenScale(250),ScreenScale(5))
---------
----hp
surface.SetDrawColor(0,155,255,155)
surface.DrawPoly({
	{x	=	ScrW() / 4.485+ move,y	=	ScrH() / 1.075+ move},
	{x	=	ScrW() / 4.675+ move,y	=	ScrH() / 1.092+ move},
	{x	=	ScrW() / 14.993 + move,y	=	ScrH() / 1.083+ move},
	{x	=	ScrW() / 13.984+ move ,y	=	ScrH() / 1.053+ move},
})
surface.SetDrawColor(0,0,0,255)
surface.DrawPoly({
{x	=	ScrW() / 13.09+ move,y	=	ScrH() / 1.055+ move},
{x	=	ScrW() / 13.09+ move,y	=	ScrH() / 1.09+ move},
{x	=	ScrW() / 4.615+ move,y	=	ScrH() / 1.097+ move},
{x	=	ScrW() / 4.375+ move,y	=	ScrH() / 1.07+ move},
})

surface.SetDrawColor(255,0,0,255)
surface.DrawPoly({
	{x	=	ScrW() / 12.631+ move,y	=	ScrH() / 1.061+ move},
	{x	=	ScrW() / 12.631+ move,y	=	ScrH() / 1.086+ move},
	{x	=	ScrW() / 4.7+ move ,y	=	ScrH() / 1.093+ move},
	{x	=	ScrW() / 4.5+ move ,y	=	ScrH() / 1.075+ move},
})

------------
------armor
surface.SetDrawColor(0,155,255,155)
surface.DrawPoly({
	{x	=	ScrW() / 4.585+ move,y	=	ScrH() / 1.065+ move},
	{x	=	ScrW() / 14.4+ move,y	=	ScrH() / 1.047+ move},
	{x	=	ScrW() / 14.4+ move ,y	=	ScrH() / 1.02+ move},
	{x	=	ScrW() / 4.458 + move,y	=	ScrH() / 1.044+ move},
})
surface.SetDrawColor(0,0,0,255)
surface.DrawPoly({
{x	=	ScrW() / 13.02+ move,y	=	ScrH() / 1.025+ move},
{x	=	ScrW() / 13.09+ move,y	=	ScrH() / 1.051+ move},
{x	=	ScrW() / 4.55+ move,y	=	ScrH() / 1.067+ move},
{x	=	ScrW() / 4.375+ move,y	=	ScrH() / 1.04+ move},
})

surface.SetDrawColor(0,115,255,255)
surface.DrawPoly({
	{x	=	ScrW() / 12.631+ move,y	=	ScrH() / 1.031+ move},
	{x	=	ScrW() / 12.431+ move,y	=	ScrH() / 1.047+ move},
	{x	=	ScrW() / 4.58+ move ,y	=	ScrH() / 1.061+ move},
	{x	=	ScrW() / 4.5+ move ,y	=	ScrH() / 1.045+ move},
})
surface.SetDrawColor(0,0,0,255)
surface.SetMaterial(Material("sprites/mechshield"))
surface.DrawTexturedRectUV(ScrW() / 12.63+ move,ScrH() / 1.078+ move,ScreenScale(65),ScreenScale(5),2 + (CurTime()/2),0 ,0 + (CurTime()/2),.2)
--------------------
draw.SimpleTextOutlined("+","BL2Font_3",ScrW() * .075+ move,ScrH() * .93+ move,Color(255,255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER,2,Color(0,0,0,255))
draw.SimpleTextOutlined(hp,"BL2Font_4",ScrW() * .085+ move,ScrH() * .915+ move,Color(255,255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT,2,Color(0,0,0,255))

draw.SimpleTextOutlined("-","BL2Font_3",ScrW() * .075+ move,ScrH() * .96+ move,Color(255,255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER,2,Color(0,0,0,255))
draw.SimpleTextOutlined(LocalPlayer():Armor(),"BL2Font_4",ScrW() * .085+ move,ScrH() * .945+ move,Color(255,255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT,2,Color(0,0,0,255))

for i23,exp in pairs(xptable) do
exp.time = exp.time + 2.5
exp.alpha = Lerp(3*FrameTime(),exp.alpha,0)
draw.SimpleTextOutlined(exp.xp.."xp","BL2Font_4",ScrW() * .5,ScrH() * .55 + exp.time,Color(255,255,255,exp.alpha),TEXT_ALIGN_RIGHT,TEXT_ALIGN_RIGHT,2,Color(0,0,0,exp.alpha))
--[[surface.SetDrawColor(255,0,0,exp.alpha)
surface.SetMaterial(Material("hud/killicons/default"))
surface.DrawTexturedRectRotated(ScrW() * .49 + (surface.GetTextSize(exp.xp) * .8),ScrH() * .56 + exp.time,ScreenScale(15),ScreenScale(15),math.sin(exp.time) * 10)]]
end

if LocalPlayer():Armor() > 0 then
surface.SetDrawColor(0,155,255,155 + (LocalPlayer():Armor() - s_alpha1) * 20)
surface.SetMaterial(Material("sprites/mechshield"))
surface.DrawTexturedRectUV(0,ScrH() * .97,ScrW(),ScreenScale(70),2 + (CurTime()/10),0 ,0 + (CurTime()/10),.2)

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

	for i,w in pairs(ents.GetAll()) do
	if w:IsWeapon() and w:GetOwner() == NULL and LocalPlayer():EyePos():Distance(w:GetPos()) < 501 then
	for i = 1,11 do
		if i == 1 then
			cam.Start3D2D(w:GetPos(),Angle(0,EyeAngles().y + 90,270),.5)
				surface.SetDrawColor(255,255,255,155) 
				surface.SetMaterial(Material("sprites/mechshield"))
				surface.DrawTexturedRectRotated(1.5,2 + i * 5,8,8,CurTime() * 60)
				surface.SetDrawColor(255,255,255,255) 
				surface.DrawRect(-1.5,0 + i * 5,4,4)
			cam.End3D2D()
		end
	cam.Start3D2D(w:GetPos(),Angle(0,EyeAngles().y + 90,270),.5)
				surface.SetDrawColor(255,255,255,255 - (i * 30)) 
				surface.DrawRect(0,0 + i * 5,2,5)
			cam.End3D2D()
		end
	end
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

net.Receive("bl2_xpscreen",function(len,ply)
local cl_xp = net.ReadString()
xptable_i = xptable_i + 1 
xptable[xptable_i] = { xp = tonumber(cl_xp),
					   alpha = 255,
					   time = 0,
}
end)
end
