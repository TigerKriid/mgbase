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

surface.SetDrawColor(60,100,255,255)
surface.DrawPoly({
{x	=	ScrW() / 1.319+ move,y	=	ScrH() / 1.052+ move},
{x	=	ScrW() / 1.313+ move,y	=	ScrH() / 1.076+ move},
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

 local hpstate = hp/LocalPlayer():GetMaxHealth()
surface.SetDrawColor(255,0,0,255)
local pos = Lerp(hpstate, ScrW() / 12.631,ScrW() / 4.7)
local pos2 = Lerp(hpstate, ScrW() / 12.631,ScrW() / 4.5)
surface.DrawPoly({
{x=ScrW() / 12.631 + move,y=ScrH() / 1.061 + move},
{x=ScrW() / 12.631 + move,y=ScrH() / 1.086 + move},
{x= pos + move ,y=ScrH() / 1.093 + move},
{x= pos2 + move ,y=ScrH() / 1.075 + move},
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
surface.DrawTexturedRectUV(ScrW() / 1.24+move,ScrH() / 1.058+move,ScreenScale(76),ScreenScale(5),2 - (CurTime()/2),0 ,0 - (CurTime()/2),.2)
surface.SetDrawColor(0,215,255,255)
surface.SetMaterial(Material("vgui/gfx/vgui/shell"))
surface.DrawTexturedRectRotated(ScrW() / 1.06+move,ScrH() / 1.043+move,ScreenScale(12),ScreenScale(12),38)
surface.SetDrawColor(40,155,255,255)
surface.SetMaterial(Material("vgui/gfx/vgui/shell"))
surface.DrawTexturedRectRotated(ScrW() / 1.062+move,ScrH() / 1.05+move,ScreenScale(12),ScreenScale(12),40)
