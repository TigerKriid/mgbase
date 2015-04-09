if SERVER then

hook.Add("Think","BL2_CHESTSMANAGER",function()
	for sv, p in pairs(player.GetAll()) do
	for i,c in pairs(ents.FindByClass("prop_physics*")) do

	-------------------ITEMS TO LOOK FOR-----------------||
	---STRONGBOX
	if c:GetModel() == "models/rena/borderlands/strongbox.mdl" and c:GetNWBool("isChest") == false then
	c:SetNWBool("isChest",true)
	c:SetNWBool("chest_open",false)
	c:SetNWString("chest_type","strongbox")
	c.SpawnOffset = Vector(0,15,5)
	c.Contents = table.Random{"item_ammo_smg1","item_ammo_ar2","item_ammo_pistol","item_box_buckshot","item_ammo_357","nil","nil","nil","nil"}
	c:EmitSound("player/object_use_stop_01.wav")
	print("Found "..c:GetNWString("chest_type")..", setting up with item: "..c.Contents)
	end
	-----CARDBOARD BOX
	if c:GetModel() == "models/rena/borderlands/cardboardbox.mdl" and c:GetNWBool("isChest") == false then
	c:SetNWBool("isChest",true)
	c:SetNWBool("chest_open",false)
	c:SetNWString("chest_type","cardboardbox")
	c:SetModelScale(2)
	c.SpawnOffset = Vector(0,0,10)
	c.Contents = table.Random{"item_ammo_smg1","item_ammo_ar2","item_ammo_pistol","item_box_buckshot","item_ammo_357","nil","nil","nil","nil"}
	c:EmitSound("player/object_use_stop_01.wav")
	print("Found "..c:GetNWString("chest_type")..", setting up with item: "..c.Contents)
	end
	------LOCKER
	if c:GetModel() == "models/rena/borderlands/storagelocker.mdl" and c:GetNWBool("isChest") == false then
	c:SetNWBool("isChest",true)
	c:SetNWBool("chest_open",false)
	c.SpawnOffset = Vector(0,14,50)
	c:SetNWString("chest_type","locker")
	c.Contents = table.Random{"mg_wpn_f2000","item_ammo_ar2","mg_wpn_fnp","mg_wpn_tavor","mg_wpn_ump45","mg_wpn_m240b","mg_wpn_makarov","mg_wpn_mateba","mg_wpn_m9","mg_wpn_masada","mg_wpn_mp40","item_ammo_smg1","item_ammo_pistol","item_box_buckshot","item_ammo_357","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil"}
	c:EmitSound("player/object_use_stop_01.wav")
	print("Found "..c:GetNWString("chest_type")..", setting up with item: "..c.Contents)
	end
	------Bandid chest
	if c:GetModel() == "models/rena/borderlands/epicbanditlocker.mdl" and c:GetNWBool("isChest") == false then
	c:SetNWBool("isChest",true)
	c:SetNWBool("chest_open",false)
	c.SpawnOffset = Vector(25,0,60)
	c:SetNWString("chest_type","bandit chest")
	c.Contents = GetRandomDrop("lootchest")--table.Random{"mg_wpn_f2000","mg_wpn_fnp","mg_wpn_tavor","mg_wpn_ump45","mg_wpn_m240b","mg_wpn_makarov","mg_wpn_mateba","mg_wpn_m9","mg_wpn_masada","mg_wpn_mp40",}
	c:EmitSound("player/object_use_stop_01.wav")
	print("Found "..c:GetNWString("chest_type")..", setting up with item: "..c.Contents)
	end
	---------------dumpster
	if c:GetModel() == "models/rena/borderlands/dumpster.mdl" and c:GetNWBool("isChest") == false then
	c:SetNWBool("isChest",true)
	c:SetNWBool("chest_open",false)
	c.SpawnOffset = Vector(10,0,60)
	c:SetNWString("chest_type","dumpster")
	c.Contents = table.Random{"mg_wpn_f2000","item_ammo_ar2","mg_wpn_fnp","mg_wpn_tavor","mg_wpn_ump45","mg_wpn_m240b","mg_wpn_makarov","mg_wpn_mateba","mg_wpn_m9","mg_wpn_masada","mg_wpn_mp40","item_ammo_smg1","item_ammo_pistol","item_box_buckshot","item_ammo_357","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil","nil"}
	c:EmitSound("player/object_use_stop_01.wav")
	print("Found "..c:GetNWString("chest_type")..", setting up with item: "..c.Contents)
	end
	-------------shelf what
	if c:GetModel() == "models/rena/borderlands/hyperion_weapon_box.mdl" and c:GetNWBool("isChest") == false then
	c:SetNWBool("isChest",true)
	c:SetNWBool("chest_open",false)
	c:SetNWString("chest_type","shelf")
	c.SpawnOffset = Vector(-35,0,60)
	c.Contents = GetRandomDrop("lootchest")
	c:EmitSound("player/object_use_stop_01.wav")
	print("Found "..c:GetNWString("chest_type")..", setting up with item: "..c.Contents)
	end
	-------toilet
	if c:GetModel() == "models/rena/borderlands/bandit_dookhut.mdl" and c:GetNWBool("isChest") == false then
	c:SetNWBool("isChest",true)
	c:SetNWBool("chest_open",false)
	c:SetNWString("chest_type","toilet")
	c.Contents = GetRandomDrop("lootchest")
	c.SpawnOffset = Vector(-35,0,60)
	c:EmitSound("player/object_use_stop_01.wav")
	print("Found "..c:GetNWString("chest_type")..", setting up with item: "..c.Contents)
	end
	----LAUNDRY MACHINE
	if c:GetModel() == "models/rena/borderlands/laundrymachine.mdl" and c:GetNWBool("isChest") == false then
	c:SetNWBool("isChest",true)
	c:SetNWBool("chest_open",false)
	c:SetNWString("chest_type","laundry machine")
	c.SpawnOffset = Vector(0,25,40)
	c.Contents = table.Random{"item_ammo_smg1","item_ammo_ar2","item_ammo_pistol","item_box_buckshot","item_ammo_357"}
	c:EmitSound("player/object_use_stop_01.wav")
	print("Found "..c:GetNWString("chest_type")..", setting up with item: "..c.Contents)
	end
	----DAHL AMMO BOX
	if c:GetModel() == "models/rena/borderlands/dahl_ammo_box.mdl" and c:GetNWBool("isChest") == false then
	c:SetNWBool("isChest",true)
	c:SetNWBool("chest_open",false)
	c:SetNWString("chest_type","dahl ammo box")
	c.SpawnOffset = Vector(0,0,35)
	c.Contents = table.Random{"item_ammo_smg1","item_ammo_pistol","item_ammo_ar2","item_box_buckshot","item_ammo_357"}
	c:EmitSound("player/object_use_stop_01.wav")
	print("Found "..c:GetNWString("chest_type")..", setting up with item: "..c.Contents)
	end
	---FRIDGE
	if c:GetModel() == "models/rena/borderlands/fridgey.mdl" and c:GetNWBool("isChest") == false then
	c:SetNWBool("isChest",true)
	c:SetNWBool("chest_open",false)
	c:SetNWString("chest_type","fridge")
	c.SpawnOffset = Vector(0,25,40)
	c.Contents = table.Random{"item_ammo_smg1","item_ammo_pistol","item_ammo_ar2","item_box_buckshot","item_ammo_357"}
	c:EmitSound("player/object_use_stop_01.wav")
	print("Found "..c:GetNWString("chest_type")..", setting up with item: "..c.Contents)
	end
	---------------------------------------||

	if c:GetNWBool("isChest") == true and c:GetNWBool("chest_open") == false and p:GetEyeTrace().Entity == c and c:GetPos():Distance(p:EyePos()) < 100 and p:KeyPressed(IN_USE) then
	c:SetNWBool("chest_open",true)
	if c:GetNWString("chest_type") == "cardboardbox" then
		c:EmitSound("physics/cardboard/cardboard_box_break3.wav")
	else
		c:EmitSound("doors/de_bank_doors_move_0"..math.random(1,3)..".wav")
		if c:GetNWString("chest_type") == "shelf" then
			c:EmitSound("doors/door_metal_thin_close2.wav")
		end
	end
	if c.Contents != "nil" then
	c.createdContent = ents.Create(tostring(c.Contents))
	local pos = c:GetBonePosition(1) + c:GetBoneMatrix(1):GetAngles():Forward() * 15
	if (c.SpawnOffset) then
		local ang = c:GetAngles()
		local new = c.SpawnOffset
		pos = c:GetPos()+new.x*ang:Right()+new.z*ang:Up()+new.y*ang:Forward()
	end
	c.createdContent:SetPos(pos)
	c.createdContent:SetAngles(c:GetAngles())
	c.createdContent:Spawn()
	c.createdContent:GetPhysicsObject():SetVelocity(c:GetAngles():Forward() * 1)
	end
	end
	end
	end
end)

end



if CLIENT then
	hook.Add("PostDrawTranslucentRenderables","wow this shit will take ages!",function()
	for i, chest in pairs(ents.FindByClass("prop_physics*")) do
	local c = chest
	if chest:GetNWBool("isChest") == true and not chest.moveBone then
	if chest:GetNWString("chest_type") == "strongbox" then
		c.moveBone = {[1] = {bone = "StrongBox_Door",
				  		 ang = Angle(math.Rand(-60,-160),2,0),
				  		 pos = Vector(0,0,0),
				  		 lerpang = Angle(0,0,0),
				  		 angspeed = .03,
				  		 lerppos = Vector(0,0,0),
				  		 posspeed = 0,
				  		},
				  }
	elseif chest:GetNWString("chest_type") == "locker" then
		c.moveBone = {[1] = {bone = "Locker_Door",
				  		 ang = Angle(0,math.Rand(-60,-160),0),
				  		 pos = Vector(0,0,0),
				  		 lerpang = Angle(0,0,0),
				  		 angspeed = .03,
				  		 lerppos = Vector(0,0,0),
				  		 posspeed = 0,
				  		},
				  }
	elseif chest:GetNWString("chest_type") == "laundry machine" then
		c.moveBone = {[1] = {bone = "Laundry_Lid",
				  		 ang = Angle(0,math.Rand(88,110),0),
				  		 pos = Vector(0,0,0),
				  		 lerpang = Angle(0,0,0),
				  		 angspeed = .5,
				  		 lerppos = Vector(0,0,0),
				  		 posspeed = 0,
				  		},
				  }
	elseif chest:GetNWString("chest_type") == "bandit chest" then
		c.moveBone = {[1] = {bone = "Door_Hinge",
				  		 ang = Angle(-101.111,0,0),
				  		 pos = Vector(0,0,0),
				  		 lerpang = Angle(0,0,0),
				  		 angspeed = .025,
				  		 lerppos = Vector(0,0,0),
				  		 posspeed = 0,
				  		},
				  		[2] = {bone = "Main_Lift",
				  		 ang = Angle(41.111,0,0),
				  		 pos = Vector(30,0,30),
				  		 lerpang = Angle(0,0,0),
				  		 angspeed = .01,
				  		 lerppos = Vector(0,0,0),
				  		 posspeed = .2,
				  		},
				  }
	elseif chest:GetNWString("chest_type") == "cardboardbox" then
		c.moveBone = {[1] = {bone = "Dummy01",
				  		 ang = Angle(180,0,0),
				  		 pos = Vector(0,0,0),
				  		 lerpang = Angle(0,0,0),
				  		 angspeed = .2,
				  		 lerppos = Vector(0,0,0),
				  		 posspeed = 0,
				  		},
				  [2] = {bone = "Dummy03",
				  		 ang = Angle(180,0,0),
				  		 pos = Vector(0,0,0),
				  		 lerpang = Angle(0,0,0),
				  		 angspeed = .1,
				  		 lerppos = Vector(0,0,0),
				  		 posspeed = 0,
				  		},
				  [3] = {bone = "Dummy02",
				  		 ang = Angle(180,0,0),
				  		 pos = Vector(0,0,0),
				  		 lerpang = Angle(0,0,0),
				  		 angspeed = .05,
				  		 lerppos = Vector(0,0,0),
				  		 posspeed = 0,
				  		},
				  [4] = {bone = "Dummy04",
				  		 ang = Angle(180,0,0),
				  		 pos = Vector(0,0,0),
				  		 lerpang = Angle(0,0,0),
				  		 angspeed = .04,
				  		 lerppos = Vector(0,0,0),
				  		 posspeed = 0,
				  		},
				  }
	elseif chest:GetNWString("chest_type") == "dahl ammo box" then
		c.moveBone = {[1] = {bone = "Lid",
				  		 ang = Angle(math.Rand(-88,-110),0,0),
				  		 pos = Vector(0,0,0),
				  		 lerpang = Angle(0,0,0),
				  		 angspeed = .03,
				  		 lerppos = Vector(0,0,0),
				  		 posspeed = 0,
				  		},
				  }
	elseif chest:GetNWString("chest_type") == "dumpster" then
		c.moveBone = {[1] = {bone = "Trashcan_Lid",
				  		 ang = Angle(0,0,math.Rand(-88,-110)),
				  		 pos = Vector(0,0,0),
				  		 lerpang = Angle(0,0,0),
				  		 angspeed = .03,
				  		 lerppos = Vector(0,0,0),
				  		 posspeed = 0,
				  		},
			
				  }
	elseif chest:GetNWString("chest_type") == "fridge" then
		c.moveBone = {[1] = {bone = "Fridge_Doors",
				  		 ang = Angle(0,math.Rand(45,145),0),
				  		 pos = Vector(0,0,0),
				  		 lerpang = Angle(0,0,0),
				  		 angspeed = .03,
				  		 lerppos = Vector(0,0,0),
				  		 posspeed = 0.01,
				  		},
				  }
	elseif chest:GetNWString("chest_type") == "toilet" then
			c.moveBone = {[1] = {bone = "door",
				  		 ang = Angle(0,math.Rand(-20,40),0),
				  		 pos = Vector(0,0,0),
				  		 lerpang = Angle(0,-90,0),
				  		 angspeed = .03,
				  		 lerppos = Vector(0,0,0),
				  		 posspeed = 0,
				  		},
				  		[2] = {bone = "Lid",
				  		 ang = Angle(0,0,0),
				  		 pos = Vector(0,0,0),
				  		 lerpang = Angle(90,0,0),
				  		 angspeed = .01,
				  		 lerppos = Vector(0,0,0),
				  		 posspeed = 0,
				  		},
			
				  }
	c.angLerp = Angle(0,-90,0)
	elseif chest:GetNWString("chest_type") == "shelf" then
		c.moveBone = {[1] = {bone = "Hinge",
				  		 ang = Angle(0,-90,0),
				  		 pos = Vector(0,0,0),
				  		 lerpang = Angle(0,0,0),
				  		 angspeed = .015,
				  		 lerppos = Vector(0,0,0),
				  		 posspeed = 0.1,
				  		},[5] = {bone = "Shelf",
				  		 ang = Angle(0,0,0),
				  		 pos = Vector(0,3,0),
				  		 lerpang = Angle(0,0,0),
				  		 angspeed = 0,
				  		 lerppos = Vector(0,0,0),
				  		 posspeed = 0.05,
				  		},
				  		[2] = {bone = "Arms",
				  		 ang = Angle(0,0,0),
				  		 pos = Vector(13,-7,0),
				  		 lerpang = Angle(0,0,0),
				  		 angspeed = 0.001,
				  		 lerppos = Vector(0,0,0),
				  		 posspeed = .07,
				  		},
				  		[3] = {bone = "L_Door",
				  		 ang = Angle(0,-80,0),
				  		 pos = Vector(-5,0,0),
				  		 lerpang = Angle(0,0,0),
				  		 angspeed = .03,
				  		 lerppos = Vector(0,0,0),
				  		 posspeed = 0.1,
				  		},
				  		[4] = {bone = "R_Door",
				  		 ang = Angle(0,80,0),
				  		 pos = Vector(-5,0,0),
				  		 lerpang = Angle(0,0,0),
				  		 angspeed = .03,
				  		 lerppos = Vector(0,0,0),
				  		 posspeed = 0.1,
				  		},
			
				  }
	end
	end

	if chest:GetNWBool("isChest") == true and chest:GetNWBool("chest_open") == true then
	for ind,b in pairs(chest.moveBone) do
	b.lerpang = LerpAngle(b.angspeed,b.lerpang,b.ang)
	chest:ManipulateBoneAngles(chest:LookupBone(b.bone),b.lerpang)
	b.lerppos = LerpVector(b.posspeed,b.lerppos,b.pos)
	chest:ManipulateBonePosition(chest:LookupBone(b.bone),b.lerppos)
	end
	elseif chest.moveBone then
	for ind,b in pairs(chest.moveBone) do
		chest:ManipulateBoneAngles(chest:LookupBone(b.bone),LerpAngle(0,b.lerpang,b.ang))
		chest:ManipulateBonePosition(chest:LookupBone(b.bone),LerpVector(0,b.lerppos,b.pos))
	end
	end

	if chest:GetNWBool("isChest") == true and chest:GetNWBool("chest_open") == false and LocalPlayer():EyePos():Distance(chest:GetPos()) < 1000 then
	if chest:GetNWString("chest_type") == "strongbox" then
	cam.Start3D2D(chest:GetPos() + chest:GetAngles():Up() * 13 + chest:GetAngles():Forward() * 10.5  + chest:GetAngles():Right() * -2.2,chest:GetAngles() + Angle(90,0,0),1)
	surface.SetDrawColor(0,255,0,50)
	surface.DrawRect(0,0,2,4)
	cam.End3D2D()
	elseif chest:GetNWString("chest_type") == "locker" then
	cam.Start3D2D(chest:GetPos() + chest:GetAngles():Up() * 57.7 + chest:GetAngles():Forward() * 10.5  + chest:GetAngles():Right() * -3.1,chest:GetAngles() + Angle(90,0,0),1)
	surface.SetDrawColor(0,255,0,50)
	surface.DrawRect(0,0,3,6)
	cam.End3D2D()
	elseif chest:GetNWString("chest_type") == "laundry machine" then
	cam.Start3D2D(chest:GetPos() + chest:GetAngles():Up() * 70.7 + chest:GetAngles():Forward() * 22.4  + chest:GetAngles():Right() * -13,chest:GetAngles() + Angle(90,0,0),1)
	surface.SetDrawColor(0,255,0,50)
	surface.DrawRect(0,0,5,10)
	cam.End3D2D()
	elseif chest:GetNWString("chest_type") == "bandit chest" then
	cam.Start3D2D(chest:GetPos() + chest:GetAngles():Up() * 20.2 + chest:GetAngles():Forward() * -18.85  + chest:GetAngles():Right() * -5.05,chest:GetAngles() + Angle(0,0,90),1)
	surface.SetDrawColor(0,255,0,50)
	surface.DrawRect(0,0,7,5)
	cam.End3D2D()
	elseif chest:GetNWString("chest_type") == "cardboardbox" then
	cam.Start3D2D(chest:GetPos() + chest:GetAngles():Up() * 9.7 + chest:GetAngles():Forward() * -2.1  + chest:GetAngles():Right() * 9,chest:GetAngles() + Angle(0,0,90),1)
	surface.SetDrawColor(0,255,0,50)
	surface.DrawRect(0,0,7,5)
	cam.End3D2D()
	elseif chest:GetNWString("chest_type") == "dahl ammo box" then
	cam.Start3D2D(chest:GetPos() + chest:GetAngles():Up() * 20.5 + chest:GetAngles():Forward() * 1  + chest:GetAngles():Right() * -17.7,chest:GetAngles() + Angle(0,0,90),1)
	surface.SetDrawColor(0,255,0,50)
	surface.DrawRect(0,0,2,4)
	cam.End3D2D()
	elseif chest:GetNWString("chest_type") == "dumpster" then
	cam.Start3D2D(chest:GetPos() + chest:GetAngles():Up() * 38 + chest:GetAngles():Forward() * 16.17  + chest:GetAngles():Right() * -2.4,chest:GetAngles() + Angle(90,0,0),1)
	surface.SetDrawColor(0,255,0,50)
	surface.DrawRect(0,0,3,5)
	cam.End3D2D()
	elseif chest:GetNWString("chest_type") == "fridge" then
	cam.Start3D2D(chest:GetPos() + chest:GetAngles():Up() * 16 + chest:GetAngles():Forward() * 14.2  + chest:GetAngles():Right() * -5,chest:GetAngles() + Angle(90,0,0),1)
	surface.SetDrawColor(0,255,0,50)
	surface.DrawRect(0,0,3,8)
	cam.End3D2D()
	elseif chest:GetNWString("chest_type") == "toilet" then
	cam.Start3D2D(chest:GetPos() + chest:GetAngles():Up() * 81 + chest:GetAngles():Forward() * 8.5  + chest:GetAngles():Right() * -28.8,chest:GetAngles() + Angle(90,0,90),1)
	surface.SetDrawColor(0,255,0,50)
	surface.DrawRect(0,0,4,17)
	cam.End3D2D()
elseif chest:GetNWString("chest_type") == "shelf" then
	cam.Start3D2D(chest:GetPos() + chest:GetAngles():Up() * 89.4 + chest:GetAngles():Forward() * -5.1  + chest:GetAngles():Right() * -24.4,chest:GetAngles() + Angle(90,0,90),1)
	surface.SetDrawColor(0,255,0,50)
	surface.DrawRect(0,0,7,4)
	cam.End3D2D()
	end
    end
	end
	end)
end
