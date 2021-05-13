private ["_randomArea","_gaussDistComp","_null","_round","_zombiesToSpawn","_maxParallelZombies","_RoundDuration","_zombieSpawnDelay","_random","_lastRound","_zspawn","_zwindow","_zbreach","_windowboard1","_windowboard2","_windowboard3","_windowboard4","_windowboard5"];

		_lastRound = 0;
		MysteryBoxLocation = 1;

		_lastRound = ServerCurrentRound;
		_zombiesToSpawn = ServerCurrentRound * 12;
		_maxParallelZombies = 35;
		ActiveZombies = 0;
		ZombiesRemaining = _zombiesToSpawn;
		_RoundDuration = (60 + (ServerCurrentRound - 1) * 12);
		_zombieSpawnDelay = _RoundDuration / _zombiesToSpawn;
		sleep 12;
		while {(ZombiesRemaining > 0) || (ActiveZombies > 0)}
		do
		{
			if ((ActiveZombies < (_maxParallelZombies + 1)) && (ZombiesRemaining > 0))
			then
			{
				ActiveZombies = ActiveZombies + 1;
				ZombiesRemaining = ZombiesRemaining - 1;
				_gaussDistComp = [];
				_gaussDistComp append OpenAreas;
				_gaussDistComp append OpenAreas;
				_randomArea = _gaussDistComp call BIS_fnc_selectRandom;
				
				switch (_randomArea) do
				{
					//zone 1 has windows 1,2,3
					//zone 2 has windows 5,6
					//zone 3 has windows 7,9
					//zone 4 has windows 4
					//zone 5 has windows 8
					case "Zone1": 
					{
						_random = [1,2,3,1,2,3] call BIS_fnc_selectRandom;
					};
					case "Zone2": 
					{
						_random = [5,6,5,6] call BIS_fnc_selectRandom;
					};
					case "Zone3": 
					{
						if (SatchelCount == 3)
						then
						{
							_random = 9;
						}
						else
						{
							_random = [7,9,7,9] call BIS_fnc_selectRandom;
						};
					};
					case "Zone4": 
					{
						_random = [4] call BIS_fnc_selectRandom;
					};
					case "Zone5":
					{
						_random = [8] call BIS_fnc_selectRandom;
					};
				};
				switch (_random) do 
				{
					case 1: {_zspawn = "zspawn1"; _zwindow = zwindow1; _zbreach = zbreach1; _windowboard1 = zwindow1b1; _windowboard2 = zwindow1b2; _windowboard3 = zwindow1b3; _windowboard4 = zwindow1b4; _windowboard5 = zwindow1b5;};
					case 2: {_zspawn = "zspawn2"; _zwindow = zwindow2; _zbreach = zbreach2; _windowboard1 = zwindow2b1; _windowboard2 = zwindow2b2; _windowboard3 = zwindow2b3; _windowboard4 = zwindow2b4; _windowboard5 = zwindow2b5;};
					case 3: {_zspawn = "zspawn3"; _zwindow = zwindow3; _zbreach = zbreach3; _windowboard1 = zwindow3b1; _windowboard2 = zwindow3b2; _windowboard3 = zwindow3b3; _windowboard4 = zwindow3b4; _windowboard5 = zwindow3b5;};
					case 4: {_zspawn = "zspawn4"; _zwindow = zwindow4; _zbreach = zbreach4; _windowboard1 = zwindow4b1; _windowboard2 = zwindow4b2; _windowboard3 = zwindow4b3; _windowboard4 = zwindow4b4; _windowboard5 = zwindow4b5;};
					case 5: {_zspawn = "zspawn5"; _zwindow = zwindow5; _zbreach = zbreach5; _windowboard1 = zwindow5b1; _windowboard2 = zwindow5b2; _windowboard3 = zwindow5b3; _windowboard4 = zwindow5b4; _windowboard5 = zwindow5b5;};
					case 6: {_zspawn = "zspawn6"; _zwindow = zwindow6; _zbreach = zbreach6; _windowboard1 = zwindow6b1; _windowboard2 = zwindow6b2; _windowboard3 = zwindow6b3; _windowboard4 = zwindow6b4; _windowboard5 = zwindow6b5;};
					case 7: {_zspawn = "zspawn7"; _zwindow = zwindow7; _zbreach = zbreach7; _windowboard1 = zwindow7b1; _windowboard2 = zwindow7b2; _windowboard3 = zwindow7b3; _windowboard4 = zwindow7b4; _windowboard5 = zwindow7b5;};
					case 8: {_zspawn = "zspawn8"; _zwindow = zwindow8; _zbreach = zbreach8; _windowboard1 = zwindow8b1; _windowboard2 = zwindow8b2; _windowboard3 = zwindow8b3; _windowboard4 = zwindow8b4; _windowboard5 = zwindow8b5;};
					case 9: {_zspawn = "zspawn9"; _zwindow = zwindow9; _zbreach = zbreach9; _windowboard1 = zwindow9b1; _windowboard2 = zwindow9b2; _windowboard3 = zwindow9b3; _windowboard4 = zwindow9b4; _windowboard5 = zwindow9b5;};
					case 10: {_zspawn = "zspawn10"; _zwindow = zwindow10; _zbreach = zbreach10; _windowboard1 = zwindow10b1; _windowboard2 = zwindow10b2; _windowboard3 = zwindow10b3; _windowboard4 = zwindow10b4; _windowboard5 = zwindow10b5;};
				};
				_object = [(markerpos _zspawn), 180, "O_G_Soldier_F", ZombieGroup] call bis_fnc_spawnvehicle;
				//(_object select 0) disableAI "MOVE";
				DEBUGGLOBALTNoZombies = (DEBUGGLOBALTNoZombies + 1);
				diag_log (format ["Attempting zombie %1 spawn",DEBUGGLOBALTNoZombies]);
				//systemChat (format ["Attempting zombie %1 spawn",DEBUGGLOBALTNoZombies]);
				_null = [_object select 0,_zwindow,_zbreach,_windowboard1,_windowboard2,_windowboard3,_windowboard4,_windowboard5] execVM "Server_Scripts\serverZombie.sqf";
				_random = 0;
			};
			sleep _zombieSpawnDelay;
			diag_log "serverRoundManager while {(ZombiesRemaining loop iteration";
			//systemChat "serverRoundManager while {(ZombiesRemaining loop iteration";
			if (!(PAPaccessible))
			then
			{
				execVM "Server_Scripts\serverCheckPAP.sqf";
			};
		};
		ServerCurrentRound = ServerCurrentRound + 1;
		execVM "Server_Scripts\syncServerDataSend.sqf"; //Syncs ServerCurrentRound MysteryBoxLocation and OpenAreas to all clients
	sleep 2;
	execVM "Server_Scripts\serverRoundManager.sqf";