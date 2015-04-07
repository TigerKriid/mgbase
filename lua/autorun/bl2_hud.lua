
if SERVER then
util.AddNetworkString("bl2_3d2dshield")
util.AddNetworkString("bl2_xpscreen")
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

if CLIENT then
	net.Receive("client_LevelUP",function(len,ply)
		LVLUpScreen(net.ReadInt(32))
	end)
end
hook.Add( "HUDPaint", "BL2_Render3", function()
	local Armor = LocalPlayer():GetNWInt("Shield",LocalPlayer():Armor())
	s_alpha1 = Lerp(1*FrameTime(),s_alpha1,Armor)
	local hp = LocalPlayer():Health()
	local move = math.sin(CurTime() * 1) * 1
	if BL2HUD_lvl_time <= 0.4 then
		--print(BL2HUD_lvl_time)
		BL2HUD_lvl_time = BL2HUD_lvl_time + (.1) * FrameTime()
		lvl_textposx = Lerp(5*FrameTime(),lvl_textposx,ScrW() * (.6 - BL2HUD_lvl_time))
		lvl_textposy = Lerp(5*FrameTime(),lvl_textposy,ScrH() * (.65 - BL2HUD_lvl_time / 10))

		draw.SimpleText("LEVEL UP","BL2Font_2",lvl_textposx,ScrH() * .75,Color(0,200,255,155 - BL2HUD_lvl_time * 600),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)
		draw.SimpleTextOutlined("LEVEL UP","BL2Font_1",lvl_textposx,ScrH() * .75,Color(255,220,0,255 - BL2HUD_lvl_time * 1000),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER,2,Color(0,0,0,255 - BL2HUD_lvl_time * 1000))

		draw.SimpleText(lvl_string,"BL2Font_2",ScrW() * .5,lvl_textposy + 5,Color(0,200,255,155 - BL2HUD_lvl_time * 400),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER)


		draw.SimpleTextOutlined(lvl_string,"BL2Font_1",ScrW() * .5,lvl_textposy,Color(255,220,0,255 - BL2HUD_lvl_time * 600),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER,2,Color(0,0,0,255 - BL2HUD_lvl_time * 600))
	end

	--[[surface.SetDrawColor(0,155,255,55)
	surface.DrawPoly({
	{x	=	ScrW() / 14.693,y	=	ScrH() / 1.097},
	{x	=	ScrW() / 15.483,y	=	ScrH() / 1.044},
	{x	=	ScrW() / 4.186,y	=	ScrH() / 1.057},
	{x	=	ScrW() / 4.705,y	=	ScrH() / 1.119},
	})]]

	----AMMO

surface.SetDrawColor(0,155,255,155)
surface.DrawPoly({
{x	=	ScrW() / 1.323+ move,y	=	ScrH() / 1.045+ move},
{x	=	ScrW() / 1.071+ move,y	=	ScrH() / 1.03+ move},
{x	=	ScrW() / 1.07+ move,y		=	ScrH() / 1.067+ move},
{x	=	ScrW() / 1.315+ move,y	=	ScrH() / 1.077+ move},
})

surface.SetDrawColor(0,0,0,255)
surface.DrawPoly({
{x	=	ScrW() / 1.332+ move,y	=	ScrH() / 1.046+ move},
{x	=	ScrW() / 1.318+ move,y	=	ScrH() / 1.081+ move},
{x	=	ScrW() / 1.074+ move,y	=	ScrH() / 1.069+ move},
{x	=	ScrW() / 1.078+ move,y	=	ScrH() / 1.036+ move},
})
local ammostate = 0
if IsValid(LocalPlayer():GetActiveWeapon()) and LocalPlayer():GetActiveWeapon().Primary then
	ammostate = LocalPlayer():GetActiveWeapon():Clip1() / LocalPlayer():GetActiveWeapon().Primary.ClipSize
end
local ammopos = Lerp(ammostate,ScrW() / 1.079,ScrW() / 1.319)
local ammopos2 = Lerp(ammostate,ScrW() / 1.083,ScrW() / 1.313)
local ammopos3 = Lerp(ammostate,ScrH() / 1.045, ScrH() / 1.052)
local ammopos4 = Lerp(ammostate,ScrH() / 1.065, ScrH() / 1.076)
surface.SetDrawColor(60,100,255,255)
surface.DrawPoly({
{x	=	ammopos+ move,y	=	ammopos3+ move},
{x	=	ammopos2+ move,y	=	ammopos4+ move},
{x	=	ScrW() / 1.079+ move,y	=	ScrH() / 1.065+ move},
{x	=	ScrW() / 1.083+ move,y	=	ScrH() / 1.045+ move},
})
----
----XPbar
surface.SetDrawColor(0,155,255,155)
surface.DrawPoly({
	{x	=	ScrW() / 3.396+ move,y	=	ScrH() / 1.05+ move},
	{x	=	ScrW() / 3.546+ move,y	=	ScrH() / 1.025+ move},
	{x	=	ScrW() / 1.435+ move,y	=	ScrH() / 1.024+ move},
	{x	=	ScrW() / 1.444+ move,y	=	ScrH() / 1.048+ move},
})

surface.SetDrawColor(0,0,0,255)
surface.DrawPoly({
	{x	=	ScrW() / 1.451 + move,y	=	ScrH() / 1.027+ move},
	{x	=	ScrW() / 3.512+ move,y	=	ScrH() / 1.027+ move},
	{x	=	ScrW() / 3.404+ move ,y	=	ScrH() / 1.05+ move},
	{x	=	ScrW() / 1.448+ move ,y	=	ScrH() / 1.055+ move},
})
surface.SetDrawColor(0,255,255,255)
local xpneeded = math.Round((XPtoNextLevel*(BL2.GetLevel(LocalPlayer())*LevelMultiplicator)))
local xpstate = BL2.GetXP(LocalPlayer())/xpneeded
local xppos = Lerp(xpstate, ScreenScale(0),ScreenScale(250))

surface.DrawRect(ScrW() * .296 + move,ScrH() * .956 + move,xppos,ScreenScale(5))

local Level = BL2.GetLevel(LocalPlayer())
draw.SimpleTextOutlined("Level: "..Level,"BL2Font_4",ScrW() * .3+move, ScrH() * .935+move,Color(255,255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER,2,Color(0,0,0,255))

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

 local hpstate = hp/LocalPlayer():GetMaxHealth()
surface.SetDrawColor(255,0,0,255)
local pos = Lerp(hpstate, ScrW() / 12.631,ScrW() / 4.7)
local pos2 = Lerp(hpstate, ScrW() / 12.631,ScrW() / 4.5)
local pos3 = Lerp(hpstate, ScrH() / 1.086,ScrH() / 1.093)
local pos4 = Lerp(hpstate, ScrH() / 1.061,ScrH() / 1.075)
surface.DrawPoly({
{x=ScrW() / 12.631 + move,y=ScrH() / 1.061 + move},
{x=ScrW() / 12.631 + move,y=ScrH() / 1.086 + move},
{x= pos + move ,y= pos3 + move},
{x= pos2 + move ,y=pos4 + move},
})
	surface.SetDrawColor(0,155,255,155)
	surface.DrawPoly({
		{x	=	ScrW() / 4.585 + move,y	=	ScrH() / 1.065 + move},
		{x	=	ScrW() / 14.4 + move,y	=	ScrH() / 1.047 + move},
		{x	=	ScrW() / 14.4 + move ,y	=	ScrH() / 1.02 + move},
		{x	=	ScrW() / 4.458 + move,y	=	ScrH() / 1.044 + move},
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
local armorstate = Armor/LocalPlayer():GetNWInt("Shield-MaxShield")
surface.SetDrawColor(255,0,0,255)
local pos = Lerp(armorstate, ScrW() / 12.631,ScrW() / 4.58)
local pos2 = Lerp(armorstate, ScrW() / 12.431,ScrW() / 4.5)
surface.SetDrawColor(0,115,255,255)
surface.DrawPoly({
	{x	=	ScrW() / 12.631+ move,y	=	ScrH() / 1.031+ move},
	{x	=	ScrW() / 12.431+ move,y	=	ScrH() / 1.047+ move},
	{x	=	pos + move ,y	=	ScrH() / 1.061+ move},
	{x	=	pos2 + move ,y	=	ScrH() / 1.045+ move},
})
--------------------
draw.SimpleTextOutlined("+","BL2Font_3",ScrW() * .075+ move,ScrH() * .93+ move,Color(255,255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER,2,Color(0,0,0,255))
draw.SimpleTextOutlined(hp,"BL2Font_4",ScrW() * .085+ move,ScrH() * .915+ move,Color(255,255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT,2,Color(0,0,0,255))

draw.SimpleTextOutlined("-","BL2Font_3",ScrW() * .075+ move,ScrH() * .96+ move,Color(255,255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER,2,Color(0,0,0,255))
draw.SimpleTextOutlined(LocalPlayer():Armor(),"BL2Font_4",ScrW() * .085+ move,ScrH() * .945+ move,Color(255,255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT,2,Color(0,0,0,255))
if LocalPlayer():GetActiveWeapon() != NULL then
draw.SimpleTextOutlined(LocalPlayer():GetActiveWeapon():Clip1().." / "..LocalPlayer():GetAmmoCount(LocalPlayer():GetActiveWeapon():GetPrimaryAmmoType()),"BL2Font_4",ScrW() * .92+ move,ScrH() * .932+ move,Color(255,255,255,255),TEXT_ALIGN_RIGHT,TEXT_ALIGN_RIGHT,2,Color(0,0,0,255))
end

surface.SetDrawColor(0,0,0,255)
surface.SetMaterial(Material("sprites/mechshield"))
--surface.DrawTexturedRectUV(ScrW() / 12.63+ move,ScrH() / 1.078+ move,ScreenScale(65),ScreenScale(5),2 + (CurTime()/2),0 ,0 + (CurTime()/2),.2)
--surface.DrawTexturedRectUV(ScrW() / 1.24+move,ScrH() / 1.058+move,ScreenScale(76),ScreenScale(5),2 - (CurTime()/2),0 ,0 - (CurTime()/2),.2)
surface.SetDrawColor(0,215,255,255)
surface.SetMaterial(Material("vgui/gfx/vgui/shell"))
surface.DrawTexturedRectRotated(ScrW() / 1.06+move,ScrH() / 1.043+move,ScreenScale(12),ScreenScale(12),38)
surface.SetDrawColor(40,155,255,255)
surface.SetMaterial(Material("vgui/gfx/vgui/shell"))
surface.DrawTexturedRectRotated(ScrW() / 1.062+move,ScrH() / 1.05+move,ScreenScale(12),ScreenScale(12),40)
	surface.SetDrawColor(0,0,0,255)
	surface.SetMaterial(Material("sprites/mechshield"))
	--surface.DrawTexturedRectUV(ScrW() / 12.63+ move,ScrH() / 1.078+ move,ScreenScale(65),ScreenScale(5),2 + (CurTime()/2),0 ,0 + (CurTime()/2),.2)
	--------------------
	draw.SimpleTextOutlined("+","BL2Font_3",ScrW() * .075+ move,ScrH() * .93+ move,Color(255,255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER,2,Color(0,0,0,255))
	draw.SimpleTextOutlined(hp,"BL2Font_4",ScrW() * .085+ move,ScrH() * .915+ move,Color(255,255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT,2,Color(0,0,0,255))

	draw.SimpleTextOutlined("-","BL2Font_3",ScrW() * .075+ move,ScrH() * .96+ move,Color(255,255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER,2,Color(0,0,0,255))
	draw.SimpleTextOutlined(Armor,"BL2Font_4",ScrW() * .085+ move,ScrH() * .945+ move,Color(255,255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT,2,Color(0,0,0,255))

	for i23,exp in pairs(xptable) do
		exp.time = exp.time + 2.5
		exp.alpha = Lerp(3*FrameTime(),exp.alpha,0)
		draw.SimpleTextOutlined(exp.xp.."xp","BL2Font_4",ScrW() * .5,ScrH() * .55 + exp.time,Color(255,255,255,exp.alpha),TEXT_ALIGN_RIGHT,TEXT_ALIGN_RIGHT,2,Color(0,0,0,exp.alpha))
		if exp.alpha <= 5 then
			xptable[i23] = nil
		end
		--[[surface.SetDrawColor(255,0,0,exp.alpha)
		surface.SetMaterial(Material("hud/killicons/default"))
		surface.DrawTexturedRectRotated(ScrW() * .49 + (surface.GetTextSize(exp.xp) * .8),ScrH() * .56 + exp.time,ScreenScale(15),ScreenScale(15),math.sin(exp.time) * 10)]]
	end

	if Armor > 0 then
		surface.SetDrawColor(0,155,255,155 + (Armor - s_alpha1) * 20)
		surface.SetMaterial(Material("sprites/mechshield"))
		surface.DrawTexturedRectUV(0,ScrH() * .97,ScrW(),ScreenScale(70),2 + (CurTime()/10),0 ,0 + (CurTime()/10),.2)

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
	if LocalPlayer().GetEyeTrace then
		local trace = LocalPlayer():GetEyeTrace()
	--	print(table.ToString(trace,"Hity",true))
		Ents = {}
		if trace.Entity and trace.HitWorld == false and trace.HitPos:Distance(trace.StartPos) <= 200 and not trace.Entity:IsPlayer() then
			if trace.Entity:IsNPC() then
				trace.Entity = trace.Entity:GetActiveWeapon()
			end
			if not IsValid(trace.Entity) then return end
			local Name = trace.Entity:GetNWString("Name", trace.Entity:GetNWString("Shield-Name", trace.Entity.PrintName) )
			local Weapon = trace.Entity
			local Rarity = Weapon:GetNWInt("Rarity",0)
			local DrawColor = Color(255,255,255,150)
			if Rarity == 0 then
				DrawColor = Color(255, 255, 255,150)
			elseif Rarity == 5 then
				DrawColor = Color(100, 255, 8,150)
			elseif Rarity == 10 then
				DrawColor = Color(50, 100, 255,150)
			elseif Rarity == 15 then
				DrawColor = Color(100, 0, 80,150)
			elseif Rarity == 20 then
				DrawColor = Color(213, 131, 0,150)
			elseif Rarity == 25 then
				DrawColor = Color(35, 164, 255,150)
			elseif Rarity == 30 then
				DrawColor = Color(200, 90, 104,150)
			elseif Rarity == 35 then
				DrawColor = Color(255, 255, 51,150)
			elseif Rarity == 40 then
				DrawColor = Color(0, 0, 0,150)
			end
			local H = ScrH()
			local W = ScrW()
			local drawpos = H*.4
			if Weapon:GetNWString("Manufacturer","") != "" then
				draw.SimpleText(Weapon:GetNWString("Manufacturer",""),"ObjectText",W*.56, H*.4,DrawColor, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
				drawpos = H*.37
			end
			if Weapon:GetNWString("Shield-Manufacturer","") != "" then
				draw.SimpleText(Weapon:GetNWString("Shield-Manufacturer",""),"ObjectText",W*.56, H*.4,DrawColor, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
				drawpos = H*.37
			end
			draw.SimpleText("Lvl: "..BL2.GetLevel(trace.Entity),"LevelText",W*.5, drawpos,DrawColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
			draw.SimpleText(Name,"ObjectText",W*.56, H*.43,DrawColor, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
			if trace.Entity:GetClass() == "ent_shield" then
				draw.SimpleText("Capacity:"..trace.Entity:GetNWInt("Shield-MaxShield",0),"LevelText",W*.56, H*.46,DrawColor, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
				draw.SimpleText("Cooldown:"..trace.Entity:GetNWInt("Shield-Cooldown",0),"LevelText",W*.56, H*.48,DrawColor, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
				draw.SimpleText("RechargeRate:"..(trace.Entity:GetNWInt("Shield-RechargeRate",0)*(1.33^BL2.GetLevel(trace.Entity) or 0)),"LevelText",W*.56, H*.5,DrawColor, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
				draw.SimpleText("Rarity:"..Rarity,"LevelText",W*.56, H*.52,DrawColor, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
			end
			if trace.Entity:IsWeapon() and trace.Entity.Primary then
				draw.SimpleText("Damage:"..math.Round(trace.Entity.Primary.Damage*(1.13^BL2.GetLevel(trace.Entity))),"LevelText",W*.56, H*.46,DrawColor, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
				draw.SimpleText("ClipSize:"..trace.Entity.Primary.ClipSize,"LevelText",W*.56, H*.48,DrawColor, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
				draw.SimpleText("Delay:"..math.Round(trace.Entity.Primary.Delay,3),"LevelText",W*.56, H*.5,DrawColor, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
				draw.SimpleText("Rarity:"..Rarity,"LevelText",W*.56, H*.52,DrawColor, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
				if trace.Entity.Effects then
					local i = 1
					for k,v in pairs(trace.Entity.Effects) do
						draw.SimpleText(k..":"..v,"LevelText",W*.56, H*(.52+(0.02*i)),DrawColor, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
						i = i + 1
					end
				end
			end

		--	Ents = {trace.Entity}
		end
		--if trace.Entity:IsWeapon() and trace.Entity:Clip1() > 0 then
		--	draw.SimpleText(trace.Entity:Clip1(),"ObjectText",W*.57, H*.47,HudColor, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
		--	draw.SimpleText("V","CSD-Symbols",W*.61, H*.5,HudColor, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
		--end
	end

end )
local received = {}
local tablenum = 0

hook.Remove("PostDrawOpaqueRenderables","hllyshit")
hook.Remove("PreDrawOpaqueRenderables","hllyshit")
hook.Add("PostDrawTranslucentRenderables","hllyshit",function()
	for i,w in pairs(ents.GetAll()) do
if IsValid(w) and w:IsWeapon() and not IsValid(w:GetOwner()) and LocalPlayer():EyePos():Distance(w:GetPos()) < 501 or w:GetClass() == "ent_shield" then
local Weapon = w
local Rarity = Weapon:GetNWInt("Rarity",0)
local DrawColor = Color(255,255,255,150)
if Rarity == 0 then
	DrawColor = Color(255, 255, 255,150)
elseif Rarity == 5 then
	DrawColor = Color(100, 255, 8,150)
elseif Rarity == 10 then
	DrawColor = Color(50, 100, 255,150)
elseif Rarity == 15 then
	DrawColor = Color(100, 0, 80,150)
elseif Rarity == 20 then
	DrawColor = Color(213, 131, 0,150)
elseif Rarity == 25 then
	DrawColor = Color(35, 164, 255,150)
elseif Rarity == 30 then
	DrawColor = Color(200, 90, 104,150)
elseif Rarity == 35 then
	DrawColor = Color(255, 255, 51,150)
elseif Rarity == 40 then
	DrawColor = Color(0, 0, 0,150)
end
for i = 1,11 do
if i == 1 then
cam.Start3D2D(w:GetPos()+w:OBBCenter(),Angle(0,EyeAngles().y + 90,270),.5)
--draw.SimpleText(w,"BL2Font_3",0, 55,DrawColor, TEXT_ALIGN_RIGHT, TEXT_ALIGN_CENTER)
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

	net.Receive("bl2_xpscreen",function(len,ply)
		local cl_xp = net.ReadString()
		xptable_i = xptable_i + 1 
		xptable[xptable_i] = { 
			xp = tonumber(cl_xp),
			alpha = 255,
			time = 0,
		}
	end)


end


