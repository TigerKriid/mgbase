if SERVER then

concommand.Add("bl2_inv_open",function(ply)
ply.inInventory = true
print(ply.inInventory)
end)

concommand.Add("bl2_inv_close",function(ply)
ply.inInventory = false
print(ply.inInventory)
end)

hook.Add("Think","BL2_Inventory_Manager",function()
	for i,p in pairs(player.GetAll()) do
	if p.inInventory == true then
	p:SetNWBool("bl2_tk_inventory",true)
	p:Freeze(true)
	p:SetEyeAngles(Angle(0,p:EyeAngles().y,p:EyeAngles().r))
	if p:GetActiveWeapon() != nil then
	p:GetActiveWeapon():SetHoldType("passive")
	end
	elseif p.inInventory == false or !p:IsOnGround() then
	p.inInventory = false
	p:SetNWBool("bl2_tk_inventory",false)
	p:Freeze(false)
	if p:GetActiveWeapon() != nil then
	p:GetActiveWeapon():SetHoldType(p:GetActiveWeapon().HoldType or "normal")
	end
	end
	end
end)

end

if CLIENT then

hook.Add("ShouldDrawLocalPlayer","BL2_Inventory_TP",function()
if LocalPlayer():GetNWBool("bl2_tk_inventory") == true then
	return true
end
end)

local PosLerp = Vector(0,0,0)
local e_PosLerp = Vector(0,0,0)

hook.Add("CalcView","BL2_Inventory_Camera",function(ply,origin,angles,fov,vm_origin,vm_angles)
	e_PosLerp = LerpVector(5*FrameTime(),e_PosLerp,PosLerp)
if LocalPlayer():GetNWBool("bl2_tk_inventory") == true then
	PosLerp = LocalPlayer():GetPos() + LocalPlayer():EyeAngles():Forward() * -40 + LocalPlayer():EyeAngles():Right() * (-30 + math.sin(CurTime() * .5) * 2) + Vector(0,0,(50 + math.sin(CurTime() * .25) * 1))
	local BL2_TPInventory = {}
	BL2_TPInventory.origin = e_PosLerp
	BL2_TPInventory.angles = LocalPlayer():EyeAngles()
	BL2_TPInventory.fov = 90
	return BL2_TPInventory
else PosLerp = EyePos() end
end)



hook.Add( "HUDPaint", "BL2_Render1", function() --hacky method to render the player on top of inventory :P
if LocalPlayer():GetNWBool("bl2_tk_inventory") == true then
	------
	cam.Start3D()
		LocalPlayer():DrawModel()
	cam.End3D()
end
end )

hook.Add("PostDrawOpaqueRenderables","BL2_Render2",function()
if LocalPlayer():GetNWBool("bl2_tk_inventory") == true then
cam.Start3D2D(EyePos() + EyeAngles():Forward() * 10 + EyeAngles():Right() * (-10 + math.sin(CurTime() * .5) * -.2) + Vector(0,0,-4 + math.sin(CurTime() * .25) * -.1),EyeAngles() + Angle(270,0,0),.1)
draw.RoundedBox(2,0,0,100,200,Color(0,150,255,100))
cam.End3D2D()

cam.Start3D2D(EyePos() + EyeAngles():Forward() * 8 + EyeAngles():Right() * (-10 + math.sin(CurTime() * .5) * -.3) + Vector(0,0,-4 + math.sin(CurTime() * .25) * -.15),EyeAngles() + Angle(270,0,0),.1)
for i = 1,math.Clamp(#LocalPlayer():GetWeapons(),1,4) do --ply.loadout something
draw.RoundedBox(1,70 - (i - 1) * 15,25,10,30,Color(200,200,255,200))
end
cam.End3D2D()
end
end)

end
