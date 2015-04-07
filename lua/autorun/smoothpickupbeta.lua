-- makes props you pickup behave like portal 2's cubes: smooth and not laggy.
-- this will give the player the ability to smoothly walk around while having props in their hands
-- at the cost of not having cover behind picked up stuff.
-- unlike portal 2 though, this will also make the player able to throw the prop at a certain velocity:
-- the more you hold mouse2, the stronger the throw will be (math.clamp(force + 5,0,600 - prop.mass!)).

if game.SinglePlayer() then return end
if SERVER then
util.AddNetworkString("PROP_PICKUP")
util.AddNetworkString("PROP_INFO")
util.AddNetworkString("client_leftovers")
local svprop_data = {}

net.Receive("PROP_INFO",function(len,ply)
local position = net.ReadVector()
local angles = net.ReadAngle()
local simvelocity = net.ReadString()
local propent = net.ReadEntity()
local owner = net.ReadEntity()
if propent.isBroadcasted == true then
propent:SetMaterial("")
propent:SetNoDraw(false)
propent:SetCollisionGroup(propent.oldCGroup)
propent:GetPhysicsObject():EnableMotion(true)
propent:GetPhysicsObject():SetVelocity(owner:GetVelocity() + owner:EyeAngles():Forward() * tonumber(simvelocity))
propent:DrawShadow(true)
propent:SetPos(position)
propent:SetAngles(angles)
propent.isBroadcasted = false
propent.oldCGroup = nil
owner.hasshit = NULL
net.Start("client_leftovers")
net.WriteBool(true)
net.Broadcast()
end
end)

hook.Add("AllowPlayerPickup","this shit is old as fuck maybe idk hi",function(ply,ent)
	if not ply.hasshit then ply.hasshit = NULL end
	if ent.isBroadcasted == true or ply.hasshit != NULL then return false end
	ply.hasshit = ent
	svprop_data[1] = {entity = ent,
				      owner = ply,
					  mass = ent:GetPhysicsObject():GetMass(),
	}
	net.Start("PROP_PICKUP")
	net.WriteTable(svprop_data)
	net.Broadcast()
	ent:SetMaterial("gmod_silent")
	ent:SetNoDraw(true)
	ent.oldCGroup = ent:GetCollisionGroup()
	ent:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
	ent:GetPhysicsObject():SetVelocity(Vector(0,0,1))
	ent:GetPhysicsObject():EnableMotion(false)
	ent:DrawShadow(false)
	ent.isBroadcasted = true
end)
end

if CLIENT then
	net.Receive("PROP_PICKUP",function(len,ply)
	for i,p in pairs(player.GetAll()) do
	p.prop_data = net.ReadTable()
	for sdi,data in pairs(p.prop_data) do
	data.prop = data.entity:GetModel()
	data.pos = data.entity:GetPos()
	data.ang = data.entity:GetAngles()
	data.poslerp = data.pos
	data.anglerp = data.ang
	data.skins = data.entity:GetSkin()
	data.time = CurTime()
	end
	end
	end)

	net.Receive("client_leftovers",function(len,ply)
	for i,p in pairs(player.GetAll()) do
	p.model:Remove()
	p.model = nil
	p:EmitSound("ui/item_hat_drop.wav")
	p.prop_data = {}
	end
	end)

	hook.Add("Think","dsjfhsjfksjdfksajdhfsa",function()
	for ez, noob in pairs(player.GetAll()) do
	if not noob.prop_data then return end
	for i,p in pairs(noob.prop_data) do
	if not p.owner.model then 
	p.owner.model = ClientsideModel(p.prop,RENDERGROUP_VIEWMODEL)
	p.owner.model:SetPos(p.pos)
	p.owner.model:SetAngles(p.ang) 
	p.owner.model:SetMoveType(MOVETYPE_VPHYSICS) 
	p.owner.model:SetSolid(SOLID_VPHYSICS) 
	p.owner.model:SetCollisionGroup(COLLISION_GROUP_NONE)
	end
	p.poslerp = LerpVector(.2,p.poslerp,p.owner:EyePos() + p.owner:EyeAngles():Forward() * 40)
	p.anglerp = LerpAngle(.1,p.anglerp,p.owner:EyeAngles())
	p.owner.model:SetModel(p.prop)
	p.owner.model:SetPos(p.poslerp)
	p.owner.model:SetAngles(p.anglerp)
	if p.skins != nil then
	p.owner.model:SetSkin(p.skins)
	end
	
	if not p.owner.throwforce then p.owner.throwforce = 0 end
	if noob == p.owner then
	if p.owner:KeyDown(IN_ATTACK2) then
	p.owner.throwforce = math.Clamp(p.owner.throwforce + 5,0,600 - p.mass)
	end

	if CurTime() > p.time + .1 then
	if p.owner:KeyReleased(IN_ATTACK2) then 
	net.Start("PROP_INFO")
	net.WriteVector(p.poslerp)
	net.WriteAngle(p.anglerp)
	net.WriteString(p.owner.throwforce)
	net.WriteEntity(p.entity)
	net.WriteEntity(p.owner)
	net.SendToServer()
	p.owner.throwforce = 0
	end
	end
	end
	if !IsValid(p.entity) and IsValid(p.owner.model) then p.owner.model:Remove() p.owner.model = nil noob.prop_data = {} end
	end
	end
	end)

	hook.Add("HUDPaint","fuckyouthatswhy",function()
	if LocalPlayer().throwforce then
	for i,shit in pairs(LocalPlayer().prop_data) do
	if shit.owner == LocalPlayer() then
	if LocalPlayer().throwforce > 0 then 
	end
	end
	end
	draw.RoundedBoxEx(8,ScrW() * .465,ScrH() * .55,ScreenScale(50),ScreenScale(20),Color(150,150,150,math.Clamp(LocalPlayer().throwforce/6,0,100)),false,true,true,false)
	draw.RoundedBox(0,ScrW() * .473,ScrH() * .56,ScreenScale((0 + LocalPlayer().throwforce/6)/2.5),ScreenScale(5),Color(255,150,0,math.Clamp(LocalPlayer().throwforce/3,0,255)))
	draw.SimpleText(math.Round(LocalPlayer().throwforce/6),"Default",ScrW() * .474,ScrH() * .575,Color(255,150,0,math.Clamp(LocalPlayer().throwforce/3,0,255)),TEXT_ALIGN_LEFT,TEXT_ALIGN_LEFT)
	end
	end)
end
