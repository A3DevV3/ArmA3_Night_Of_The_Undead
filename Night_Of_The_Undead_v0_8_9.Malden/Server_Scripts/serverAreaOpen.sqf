params ["_areaNumber"];

	//systemChat format ["%1",_areaNumber];
	[[4],"Local_Scripts\localPlaySound.sqf"] remoteExec ["execVM",0]; //Executes on all machines
	switch (_areaNumber) do
	{
		//DONE
		case "Zone2A": 
		{
			OpenAreas append ["Zone2"];
			Zone2DoorCollision1 hideObjectGlobal true;
			Zone2DoorCollision2 hideObjectGlobal true;
			Zone2Barrier1 hideObjectGlobal true;
			Zone2DoorA setPos (getPos trash);
			Zone2KillBox1 setPos (getPos trash);
			Zone2KillBox2 setPos (getPos trash);
			if ("Zone3" in OpenAreas)
			then
			{
				Zone2DoorB setPos (getPos trash);
				Zone3DoorB setPos (getPos trash);
				Zone2Barrier3 hideObjectGlobal true; 
				Zone2DoorCollision3 hideObjectGlobal true;
				Zone2DoorCollision4 hideObjectGlobal true;
				Zone2DoorCollision5 hideObjectGlobal true;
				Zone2Barrier2 hideObjectGlobal true;
				Zone2Barrier3 hideObjectGlobal true;
				Zone2Barrier4 hideObjectGlobal true;
				Zone2Barrier5 hideObjectGlobal true;
			};
		};
		//DONE
		case "Zone4A": 
		{
			OpenAreas append ["Zone4"];
			Zone4Barrier1 hideObjectGlobal true;
			Zone4Barrier2 hideObjectGlobal true; 
			Zone4DoorCollision1 hideObjectGlobal true;
			Zone4DoorCollision2 hideObjectGlobal true;
			Zone4DoorA setPos (getPos trash);
			Zone4KillBox setPos (getPos trash);
			if ("Zone3" in OpenAreas)
			then
			{
				Zone4DoorB setPos (getPos trash);
				Zone3DoorA setPos (getPos trash);
				Zone4Barrier3 hideObjectGlobal true; 
				Zone4DoorCollision3 hideObjectGlobal true;
			};
		};
		//DONE
		case "Zone2B": 
		{
			OpenAreas append ["Zone2"];
			Zone2DoorCollision1 hideObjectGlobal true;
			Zone2DoorCollision2 hideObjectGlobal true;
			Zone2Barrier1 hideObjectGlobal true;
			Zone2DoorA setPos (getPos trash);
			Zone2KillBox1 setPos (getPos trash);
			Zone2KillBox2 setPos (getPos trash);
			Zone2DoorB setPos (getPos trash);
			Zone3DoorB setPos (getPos trash);
			Zone2Barrier3 hideObjectGlobal true; 
			Zone2DoorCollision3 hideObjectGlobal true;
			Zone2DoorCollision4 hideObjectGlobal true;
			Zone2DoorCollision5 hideObjectGlobal true;
			Zone2Barrier2 hideObjectGlobal true;
			Zone2Barrier3 hideObjectGlobal true;
			Zone2Barrier4 hideObjectGlobal true;
			Zone2Barrier5 hideObjectGlobal true;
		};
		//DONE
		case "Zone3B": 
		{
			OpenAreas append ["Zone3"];
			Zone2DoorB setPos (getPos trash);
			Zone3DoorB setPos (getPos trash);
			Zone2DoorCollision3 hideObjectGlobal true;
			Zone2DoorCollision4 hideObjectGlobal true;
			Zone2DoorCollision5 hideObjectGlobal true;
			Zone2Barrier2 hideObjectGlobal true;
			Zone2Barrier3 hideObjectGlobal true;
			Zone2Barrier4 hideObjectGlobal true;
			Zone2Barrier5 hideObjectGlobal true;
			Zone3Killbox1 setPos (getPos trash);
			Zone3Killbox2 setPos (getPos trash);
			if ("Zone4" in OpenAreas)
			then
			{
				Zone4DoorB setPos (getPos trash);
				Zone3DoorA setPos (getPos trash);
				Zone4Barrier3 hideObjectGlobal true; 
				Zone4DoorCollision3 hideObjectGlobal true;
			};
		};
		//DONE
		case "Zone3A": 
		{
			OpenAreas append ["Zone3"];
			Zone3DoorA setPos (getPos trash);
			Zone4DoorB setPos (getPos trash);
			Zone4DoorCollision3 hideObjectGlobal true;
			Zone4Barrier3 hideObjectGlobal true; 
			Zone3Killbox1 setPos (getPos trash);
			Zone3Killbox2 setPos (getPos trash);
			if ("Zone2" in OpenAreas)
			then
			{
				Zone2DoorB setPos (getPos trash);
				Zone3DoorB setPos (getPos trash);
				Zone2Barrier2 hideObjectGlobal true; 
				Zone2Barrier3 hideObjectGlobal true; 
				Zone2Barrier4 hideObjectGlobal true; 
				Zone2Barrier5 hideObjectGlobal true; 
				Zone2DoorCollision3 hideObjectGlobal true;
				Zone2DoorCollision4 hideObjectGlobal true;
				Zone2DoorCollision5 hideObjectGlobal true;
			};
		};
		//DONE
		case "Zone4B": 
		{
			OpenAreas append ["Zone4"];
			Zone4Barrier1 hideObjectGlobal true;
			Zone4Barrier2 hideObjectGlobal true; 
			Zone4DoorCollision1 hideObjectGlobal true;
			Zone4DoorCollision2 hideObjectGlobal true;
			Zone4DoorA setPos (getPos trash);
			Zone4KillBox setPos (getPos trash);
			Zone4DoorB setPos (getPos trash);
			Zone3DoorA setPos (getPos trash);
			Zone4Barrier3 hideObjectGlobal true; 
			Zone4DoorCollision3 hideObjectGlobal true;
		};
		//Done
		case "Zone5": 
		{
			OpenAreas append ["Zone5"];
			Zone5DoorA setPos (getPos trash);
			Zone5DoorB setPos (getPos trash);
			Zone5DoorCollision1 hideObjectGlobal true;
			Zone5DoorCollision2 hideObjectGlobal true;
			Zone5DoorCollision3 hideObjectGlobal true;
			Zone5DoorCollision4 hideObjectGlobal true;
			Zone5DoorCollision5 hideObjectGlobal true;
			Zone5DoorCollision6 hideObjectGlobal true;
			Zone5DoorCollision7 hideObjectGlobal true;
			Zone5DoorBarrier1 hideObjectGlobal true;
			Zone5DoorBarrier2 hideObjectGlobal true;
			Zone5DoorBarrier3 hideObjectGlobal true;
			Zone5DoorBarrier4 hideObjectGlobal true;
			Zone5Killbox1 setPos (getPos trash);
			Zone5Killbox2 setPos (getPos trash);
		};
	};