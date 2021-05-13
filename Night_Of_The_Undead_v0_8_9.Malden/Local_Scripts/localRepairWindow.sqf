params ["_temp"];	

private 
[
	"_zspawn",
	"_zwindow",
	"_zbreach",
	"_windowboard1",
	"_windowboard2",
	"_windowboard3",
	"_windowboard4",
	"_windowboard5",
	"_trigger",
	"_windowRepairZoneArray",
	"_windowNum"
];			

_windowRepairZoneArray = [zbreach1,zbreach2,zbreach3,zbreach4,zbreach5,zbreach6,zbreach7,zbreach8,zbreach9];
			
			_trigger = _this select 3;
			_windowNum = ((_windowRepairZoneArray find _trigger) + 1);
			//systemChat format ["%1",_trigger];
			//systemChat format ["%1",_windowNum];
			switch (_windowNum) 
			do 
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
			};
			
			while {(player inArea _trigger) && ((isObjectHidden _windowboard1) || (isObjectHidden _windowboard2) || (isObjectHidden _windowboard3) || (isObjectHidden _windowboard4) || (isObjectHidden _windowboard5))}
			do
			{
				if (isObjectHidden _windowboard1)
				then
				{
					[[_windowboard1,false],"Server_Scripts\serverHideObject.sqf"] remoteExec ["execVM",2]; //Executes on server only
					//systemChat "Added board";
					if (WindowRepairCount < 5)
					then
					{
						WindowRepairCount = WindowRepairCount + 1;
						if ((player getVariable "PlayerScore") < 250)
						then
						{
							player setVariable ["PlayerScore", (player getVariable "PlayerScore") + 10, false];
						};
						//DATA SYNC BLOCK//////////////////////////////////////////////
						execVM "Local_Scripts\syncPlayerDataSend.sqf"; //Sync player variables to all other machines and server
						///////////////////////////////////////////////////////////////
						if (WindowRepairCount == 5)
						then
						{
							WindowRepairCooldown = 200;
						};
					};
				}
				else
				{
					if (isObjectHidden _windowboard2)
					then
					{
						[[_windowboard2,false],"Server_Scripts\serverHideObject.sqf"] remoteExec ["execVM",2]; //Executes on server only
						//systemChat "Added board";
						if (WindowRepairCount < 5)
						then
						{
							WindowRepairCount = WindowRepairCount + 1;
							if ((player getVariable "PlayerScore") < 250)
							then
							{
								player setVariable ["PlayerScore", (player getVariable "PlayerScore") + 10, false];
							};
							//DATA SYNC BLOCK//////////////////////////////////////////////
							execVM "Local_Scripts\syncPlayerDataSend.sqf"; //Sync player variables to all other machines and server
							///////////////////////////////////////////////////////////////
							if (WindowRepairCount == 5)
							then
							{
								WindowRepairCooldown = 200;
							};
						};						
					}
					else
					{
						if (isObjectHidden _windowboard3)
						then
						{
							[[_windowboard3,false],"Server_Scripts\serverHideObject.sqf"] remoteExec ["execVM",2]; //Executes on server only
							//systemChat "Added board";
							if (WindowRepairCount < 5)
							then
							{
								WindowRepairCount = WindowRepairCount + 1;
								if ((player getVariable "PlayerScore") < 250)
								then
								{
									player setVariable ["PlayerScore", (player getVariable "PlayerScore") + 10, false];
								};
								//DATA SYNC BLOCK//////////////////////////////////////////////
								execVM "Local_Scripts\syncPlayerDataSend.sqf"; //Sync player variables to all other machines and server
								///////////////////////////////////////////////////////////////
								if (WindowRepairCount == 5)
								then
								{
									WindowRepairCooldown = 200;
								};
							};
						}
						else
						{
							if (isObjectHidden _windowboard4)
							then
							{
								[[_windowboard4,false],"Server_Scripts\serverHideObject.sqf"] remoteExec ["execVM",2]; //Executes on server only
								//systemChat "Added board";
								if (WindowRepairCount < 5)
								then
								{
									WindowRepairCount = WindowRepairCount + 1;
									if ((player getVariable "PlayerScore") < 250)
									then
									{
										player setVariable ["PlayerScore", (player getVariable "PlayerScore") + 10, false];
									};
									//DATA SYNC BLOCK//////////////////////////////////////////////
									execVM "Local_Scripts\syncPlayerDataSend.sqf"; //Sync player variables to all other machines and server
									///////////////////////////////////////////////////////////////
									if (WindowRepairCount == 5)
									then
									{
										WindowRepairCooldown = 200;
									};
								};				
							}
							else
							{
								if (isObjectHidden _windowboard5)
								then
								{
									[[_windowboard5,false],"Server_Scripts\serverHideObject.sqf"] remoteExec ["execVM",2]; //Executes on server only
									//systemChat "Added board";
									if (WindowRepairCount < 5)
									then
									{
										WindowRepairCount = WindowRepairCount + 1;
										if ((player getVariable "PlayerScore") < 250)
										then
										{
											player setVariable ["PlayerScore", (player getVariable "PlayerScore") + 10, false];
										};
										//DATA SYNC BLOCK//////////////////////////////////////////////
										execVM "Local_Scripts\syncPlayerDataSend.sqf"; //Sync player variables to all other machines and server
										///////////////////////////////////////////////////////////////
										if (WindowRepairCount == 5)
										then
										{
											WindowRepairCooldown = 200;
										};
									};	
								}
							};
						};
					};
				};
				sleep 2;
			};
			//systemChat "Done";