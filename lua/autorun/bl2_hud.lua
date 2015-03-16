
if SERVER then
util.AddNetworkString("bl2_3d2dshield")

hook.Add("EntityTakeDamage","fuckthisshitpolz",function(victim,dmginfo)
	if IsValid(victim) and victim:IsPlayer() or victim:IsNPC() then
		local Armor = victim:GetNWInt("Shield",victim.Armor and victim:Armor() or 0)
		if Armor > 0 then
			net.Start("bl2_3d2dshield")
			net.WriteTable({victim,dmginfo:GetAttacker(),dmginfo:GetDamage()})
			net.Broadcast()
		end
	end
end)

end
if CLIENT then
local s_alpha1 = 0
local s_alpha2 = 0
local sound_1 = false
local BL2HUD_lvl_time = 10000
local lvl_textposx = 0
local lvl_textposy = 0
local lvl_string = ""
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

function LVLUpScreen(lvl)
BL2HUD_lvl_time = 0
lvl_textposx = ScrW() * 1.5
lvl_textposy = ScrH() * 122500
lvl_string = lvl
LocalPlayer():EmitSound("ui/startup_02_01.wav")
end

if CLIENT then
	net.Receive("client_LevelUP",function(len,ply)
		LVLUpScreen(net.ReadInt(32))
	end)
end
hook.Add( "HUDPaint", "BL2_Render3", function()
	local Armor = LocalPlayer():GetNWInt("Shield",LocalPlayer():Armor())
	s_alpha1 = Lerp(1*FrameTime(),s_alpha1,Armor)

	s_alpha1 = Lerp(1*FrameTime(),s_alpha1,Armor)
	BL2HUD_lvl_time = BL2HUD_lvl_time + (.1) * FrameTime()
	lvl_textposx = Lerp(5*FrameTime(),lvl_textposx,ScrW() * (.6 - BL2HUD_lvl_time))
	lvl_textposy = Lerp(5*FrameTime(),lvl_textposy,ScrH() * (.65 - BL2HUD_lvl_time / 10))

	draw.SimpleText("LEVEL UP","BL2Font_2",lvl_textposx,ScrH() * .75,Color(0,200,255,155 - BL2HUD_lvl_time * 600),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
	draw.SimpleTextOutlined("LEVEL UP","BL2Font_1",lvl_textposx,ScrH() * .75,Color(255,220,0,255 - BL2HUD_lvl_time * 1000),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER,2,Color(0,0,0,255 - BL2HUD_lvl_time * 1000))

	draw.SimpleText(lvl_string,"BL2Font_2",ScrW() * .5,lvl_textposy + 5,Color(0,200,255,155 - BL2HUD_lvl_time * 400),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)


	draw.SimpleTextOutlined(lvl_string,"BL2Font_1",ScrW() * .5,lvl_textposy,Color(255,220,0,255 - BL2HUD_lvl_time * 600),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER,2,Color(0,0,0,255 - BL2HUD_lvl_time * 600))



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
	for i,w in pairs(ents.GetAll()) do
if w:IsWeapon() and not IsValid(w:GetOwner()) and LocalPlayer():EyePos():Distance(w:GetPos()) < 501 or w:GetClass() == "ent_shield" then
local Weapon = w
	local DrawColor = Color(255,255,255,150)
		if Weapon:GetNWInt("Rarity",0) == 0 then
			DrawColor = Color(255, 255, 255,150)
		elseif Weapon:GetNWInt("Rarity",0) == 5 then
			DrawColor = Color(100, 255, 8,150)
		elseif Weapon:GetNWInt("Rarity",0) == 10 then
			DrawColor = Color(100, 0, 80,150)
		elseif Weapon:GetNWInt("Rarity",0) == 15 then
			DrawColor = Color(213, 131, 0,150)
		elseif Weapon:GetNWInt("Rarity",0) == 20 then
			DrawColor = Color(35, 164, 255,150)
		elseif Weapon:GetNWInt("Rarity",0) == 25 then
			DrawColor = Color(200, 90, 104,150)
		elseif Weapon:GetNWInt("Rarity",0) == 30 then
			DrawColor = Color(255, 255, 51,150)
		elseif Weapon:GetNWInt("Rarity",0) == 35 then
			DrawColor = Color(0, 0, 0,150)
		end
for i = 1,11 do
if i == 1 then
cam.Start3D2D(w:GetPos()+w:OBBCenter(),Angle(0,EyeAngles().y + 90,270),.5)

surface.SetDrawColor(DrawColor.r,DrawColor.g,DrawColor.b,155) 
surface.SetMaterial(Material("sprites/mechshield"))
surface.DrawTexturedRectRotated(1.5,2 + i * 5,8,8,CurTime() * 60)
surface.DrawTexturedRectRotated(1.5,2 + i * 5,8,8,CurTime() * 60)
surface.DrawTexturedRectRotated(1.5,2 + i * 5,8,8,CurTime() * 60)
surface.DrawTexturedRectRotated(1.5,2 + i * 5,8,8,CurTime() * 60)
surface.SetDrawColor(DrawColor.r,DrawColor.g,DrawColor.b,255) 
surface.DrawRect(-1.5,0 + i * 5,4,4)
cam.End3D2D()
end
cam.Start3D2D(w:GetPos()+w:OBBCenter(),Angle(0,EyeAngles().y + 90,270),.5)
surface.SetDrawColor(DrawColor.r,DrawColor.g,DrawColor.b,255 - (i * 30)) 
surface.DrawRect(0,0 + i * 5,2,5)
cam.End3D2D()
end
end
end

	for i,d in pairs(received) do

		if d.alpha > 1 then
			d.alpha = Lerp(1*FrameTime(),d.alpha,0)
			local offset = Angle(270,d.faggotang.y,0)

			cam.Start3D2D(d.dmgpos + d.randompos + offset:Up() * 67,Angle(270,d.faggotang.y,0),.5)
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
		if IsValid(cltable[2]) and IsValid(cltable[1]) then
			received[#received + 1] = {		
				faggot = cltable[2],
				faggotpos = cltable[2]:GetPos(),
				faggotang = cltable[2]:GetAngles(),
				dmgnumber = cltable[3],
				dmgpos = cltable[1]:EyePos(),
				randompos = Vector(0,math.random(-20,2),math.random(-20,2)),
				alpha = 255,
				secondfaggot = cltable[1],
			}
		end
	end)
end


