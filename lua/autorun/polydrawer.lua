-- a handy tool to design anything by clicking on your screen.
-- cursor's x and y are automatically scaled to ScrH() and ScrW(), so you literally have to copy paste what you get :)

if CLIENT then
local PolyTable = {}
local PolyTable_Index = 0
local MousePause = 0
local cvarenable = CreateClientConVar("tool_drawpoly","0",FCVAR_NONE)

concommand.Add("tool_drawpoly_cleartable",function()
	PolyTable = {}
	PolyTable_Index = 0
	LocalPlayer():EmitSound("items/ammocrate_close.wav")
end)

concommand.Add("tool_drawpoly_printtable",function()
PrintTable(PolyTable)
end)

hook.Add("HUDPaint","TOOL_Poly",function()
if cvarenable:GetInt() == 1 and vgui.CursorVisible() then
if LocalPlayer():KeyDown(IN_ATTACK) then 
	if CurTime() >= MousePause then
	MousePause = CurTime() + .5
	PolyTable_Index = PolyTable_Index + 1
	PolyTable[PolyTable_Index] = {x = "ScrW() / "..math.Truncate(ScrW() /gui.MouseX(),3),y = "ScrH() / "..math.Truncate(ScrH() /gui.MouseY(),3)}
	LocalPlayer():EmitSound("items/medshot4.wav")
end
end

for i, v in pairs(PolyTable) do
	surface.SetDrawColor(255,0,0,255)
	surface.SetTextColor(255,0,0,255)
surface.DrawCircle(ScrW() / tonumber(string.Replace(v.x,"ScrW() / ","")),ScrH() / tonumber(string.Replace(v.y,"ScrH() / ","")),math.sin(CurTime() * 20 - i) * 2 + i * .5,Color(255,0,0,255))
if #PolyTable > 1 then
surface.DrawText(i,"Default",ScrW() / tonumber(string.Replace(v.x,"ScrW() /","")),ScrH() / tonumber(string.Replace(v.y,"ScrH() /","")))
surface.DrawLine(ScrW() / tonumber(string.Replace(v.x,"ScrW() /","")),ScrH() / tonumber(string.Replace(v.y,"ScrH() /","")),ScrW() / tonumber(string.Replace(table.FindNext(PolyTable,v).x,"ScrW() / ","")),ScrH() / tonumber(string.Replace(table.FindNext(PolyTable,v).y,"ScrH() / ","")))
end
end
end
end)
end
