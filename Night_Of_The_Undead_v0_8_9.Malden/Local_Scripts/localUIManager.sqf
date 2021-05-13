//This only has to be executed once, then updates 30 times per second
//Note that redisplaying the hpp resource 30 times a second will cause disorientating flickering on clients
//It is preferable to contain all UI operations in here, for the sake of keeping things organized and clean

private ["_tempUIMem1","_tempUIMem2","_tempMem1","_tempMem2","_text","_weaponSlotSwitchMessage"];

_weaponSlotSwitchMessage = "";

while {true}
do
{
	if (!((player getVariable "PlayerReady") == 3)) //State 3 means they're watching the cutscene. Don't show any UI elements
	then
	{
		//Handle lobby UI logic
		if ((player getVariable "PlayerReady") < 2) //If state 0 or 1, they are in lobby. If state 1, they're waiting for server to let them in
		then
		{
			uiNamespace getVariable "Overlay" displayCtrl 21 ctrlSetTextColor [1, 1, 1, 1];
			uiNamespace getVariable "Overlay" displayCtrl 21 ctrlSetText "Night of the Undead";
			uiNamespace getVariable "Overlay" displayCtrl 21 ctrlShow true;
			
			call AWDxNOTU_fnc_LUIFRefreshGameSettings; //Function to update game settings text
			
			uiNamespace getVariable "Overlay" displayCtrl 22 ctrlShow true;  //-- Game Settings --
			uiNamespace getVariable "Overlay" displayCtrl 23 ctrlShow true; //Zombie difficulty
			uiNamespace getVariable "Overlay" displayCtrl 24 ctrlShow true; //Pts per kill
			uiNamespace getVariable "Overlay" displayCtrl 25 ctrlShow true; //Machine guns
			uiNamespace getVariable "Overlay" displayCtrl 26 ctrlShow true; //Special weaps
			uiNamespace getVariable "Overlay" displayCtrl 27 ctrlShow true; //By Dev
			uiNamespace getVariable "Overlay" displayCtrl 28 ctrlShow true; //Game will start when
			uiNamespace getVariable "Overlay" displayCtrl 32 ctrlShow true; //TS address
		}
		else
		{
			uiNamespace getVariable "Overlay" displayCtrl 22 ctrlShow false; //-- Game Settings --
			uiNamespace getVariable "Overlay" displayCtrl 23 ctrlShow false; //Zombie difficulty
			uiNamespace getVariable "Overlay" displayCtrl 24 ctrlShow false; //Pts per kill
			uiNamespace getVariable "Overlay" displayCtrl 25 ctrlShow false; //Machine guns
			uiNamespace getVariable "Overlay" displayCtrl 26 ctrlShow false; //Special weaps
			uiNamespace getVariable "Overlay" displayCtrl 27 ctrlShow false; //By Dev
			uiNamespace getVariable "Overlay" displayCtrl 28 ctrlShow false; //Game will start when
			uiNamespace getVariable "Overlay" displayCtrl 31 ctrlShow false; //If the game is not started
			uiNamespace getVariable "Overlay" displayCtrl 32 ctrlShow false; //TS address
		};
		
		if (RefreshUI)
		then
		{
			if ((player getVariable "PlayerReady") < 2) //If they are in lobby, either unready or waiting. Show dialog and cutrsc
			then
			{
				if (IsNull (FindDisplay 3000))
				then
				{
					cutRsc ["GUI1000", "PLAIN"];
					createDialog "GUI3000";
				};
			};
			RefreshUI = false;
		};
		
		//Handle player UI list
		_tempMem1 = count (call BIS_fnc_listPlayers);
		for "_x" from 1 to 10 do 
		{
			_tempUIMem1 = ((_x * 2) - 1);
			_tempUIMem2 = (_x * 2);
			
			//uiNamespace getVariable "Overlay" displayCtrl _tempUIMem1 ctrlShow false;
			//uiNamespace getVariable "Overlay" displayCtrl _tempUIMem2 ctrlShow false;
			
			if (_x <= _tempMem1)
			then
			{
					if (!((getPlayerUID ((call BIS_fnc_listPlayers) select (_x - 1))) == getPlayerUID player))
					then
					{
						if ((getPlayerUID player) in (((call BIS_fnc_listPlayers) select (_x - 1)) getVariable "VotedKickAgainst"))
						then
						{
							ctrlShow [_x, false];
						}
						else
						{
							ctrlShow [_x, true];
						};
					}
					else
					{
						ctrlShow [_x, false];
					};
					
					uiNamespace getVariable "Overlay" displayCtrl _tempUIMem1 ctrlShow true;
					uiNamespace getVariable "Overlay" displayCtrl _tempUIMem2 ctrlShow true;
					
					//This is construction area for tags after player names
					_text = (((call BIS_fnc_listPlayers) select (_x - 1)) getVariable "PlayerName");
					_text = _text + " ";
					if (((call BIS_fnc_listPlayers) select (_x - 1)) getVariable "HasFuel")
					then
					{
						_text = _text + "[Fuel]";
					};
					if (((call BIS_fnc_listPlayers) select (_x - 1)) getVariable "HasC4")
					then
					{
						_text = _text + "[C4]";
					};
					if (((call BIS_fnc_listPlayers) select (_x - 1)) getVariable "PerkStamina")
					then
					{
						_text = _text + "[S]";
					};
					if (((call BIS_fnc_listPlayers) select (_x - 1)) getVariable "PerkJuggernaut")
					then
					{
						_text = _text + "[J]";
					};
					if (((call BIS_fnc_listPlayers) select (_x - 1)) getVariable "PerkPackMule")
					then
					{
						_text = _text + "[P]";
					};
					if (((call BIS_fnc_listPlayers) select (_x - 1)) getVariable "HasRPG")
					then
					{
						_text = _text + "[RPG]";
					};
					//
					if (((call BIS_fnc_listPlayers) select (_x - 1)) getVariable "HasPAPWeap")
					then
					{
						uiNamespace getVariable "Overlay" displayCtrl _tempUIMem1 ctrlSetTextColor [0.3,0.3,0.5,1];
					}
					else
					{
						uiNamespace getVariable "Overlay" displayCtrl _tempUIMem1 ctrlSetTextColor [1, 1, 1, 1];
					};
					uiNamespace getVariable "Overlay" displayCtrl _tempUIMem1 ctrlSetText _text;
					
						
					_tempMem2 = ((call BIS_fnc_listPlayers) select (_x - 1));
					if ((_tempMem2 getVariable "PlayerReady") == 1)
					then
					{
						uiNamespace getVariable "Overlay" displayCtrl _tempUIMem2 ctrlSetText "Ready";
						uiNamespace getVariable "Overlay" displayCtrl _tempUIMem2 ctrlSetTextColor [0,0.8,0,1];
					}
					else
					{
						if ((_tempMem2 getVariable "PlayerReady") == 0)
						then
						{
							uiNamespace getVariable "Overlay" displayCtrl _tempUIMem2 ctrlSetText "Not Ready";
							uiNamespace getVariable "Overlay" displayCtrl _tempUIMem2 ctrlSetTextColor [0.85,0.4,0,1];
						}
						else
						{
							if ((_tempMem2 getVariable "PlayerReady") == 2)
							then
							{
								uiNamespace getVariable "Overlay" displayCtrl _tempUIMem2 ctrlSetText "Loading in";
								uiNamespace getVariable "Overlay" displayCtrl _tempUIMem2 ctrlSetTextColor [0.85,0,0,1];
							}
							else
							{
								if ((_tempMem2 getVariable "PlayerReady") == 3)
								then
								{
									uiNamespace getVariable "Overlay" displayCtrl _tempUIMem2 ctrlSetText "Initializing";
									uiNamespace getVariable "Overlay" displayCtrl _tempUIMem2 ctrlSetTextColor [0.85,0,0,1];
								}
								else
								{
									if (ServerCurrentRound > 0) //ServerCurrentRound > 0 will be true if game is running
									then
									{
										if (((call BIS_fnc_listPlayers) select (_x - 1)) getVariable "PlayerRespawnWaiting")
										then
										{
											uiNamespace getVariable "Overlay" displayCtrl _tempUIMem2 ctrlSetText "Waiting to respawn";
											uiNamespace getVariable "Overlay" displayCtrl _tempUIMem2 ctrlSetTextColor [0.85,0.4,0,1];
										}
										else
										{
											uiNamespace getVariable "Overlay" displayCtrl _tempUIMem2 ctrlSetText format["%1",(((call BIS_fnc_listPlayers) select (_x - 1)) getVariable "PlayerScore")];
											uiNamespace getVariable "Overlay" displayCtrl _tempUIMem2 ctrlSetTextColor [1,1,1,1];
										};
									}
									else
									{
										uiNamespace getVariable "Overlay" displayCtrl _tempUIMem2 ctrlSetText "Initialization finished";
										uiNamespace getVariable "Overlay" displayCtrl _tempUIMem2 ctrlSetTextColor [1,1,1,1];
									};
								};
							};
						};
					};
			}
			else
			{
				uiNamespace getVariable "Overlay" displayCtrl _tempUIMem1 ctrlShow false;
				uiNamespace getVariable "Overlay" displayCtrl _tempUIMem2 ctrlShow false;
				ctrlShow [_x, false];
			};
		};
		
		if (ServerCurrentRound > 0)
		then
		{
			if ((player getVariable "PlayerReady") == 0)
			then
			{
				uiNamespace getVariable "Overlay" displayCtrl 28 ctrlSetText "A game is currently in progress. Press ready to join...";
			};
			
			//Addon for allowing players to see instructions for switching to their other weapon
			if ((player getVariable "PlayerReady") == 5)
			then
			{
				if (!(GameOver))
				then
				{
					if ((currentWeapon player == (PlayerWeaponSlot1 select 4)) && (!(currentWeapon player == "")))
					then
					{
						if (!(PlayerWeaponSlot2 isEqualTo []))
						then
						{
								uiNamespace getVariable "Overlay" displayCtrl 33 ctrlSetTextColor [1, 1, 1, 1];
								
								switch (PlayerWeaponSlot2 select 0) do 
								{
									case "Primary": 	{_weaponSlotSwitchMessage = format ["Press [1] to switch to %1. You cannot be moving/pressing other keys.",((PlayerWeaponSlot2 select 3) select 0)];};
									case "Launcher":	{_weaponSlotSwitchMessage = format ["Press [2] to switch to %1. You cannot be moving/pressing other keys.",((PlayerWeaponSlot2 select 3) select 0)];};
									case "Sidearm": 	{_weaponSlotSwitchMessage = format ["Press [3] to switch to %1. You cannot be moving/pressing other keys.",((PlayerWeaponSlot2 select 3) select 0)];};
									default 			{};
								};
								uiNamespace getVariable "Overlay" displayCtrl 33 ctrlSetText _weaponSlotSwitchMessage;
								uiNamespace getVariable "Overlay" displayCtrl 33 ctrlShow true;
						};
					}
					else
					{
						if ((currentWeapon player == (PlayerWeaponSlot2 select 4)) && (!(currentWeapon player == "")))
						then
						{
							if (!(PlayerWeaponSlot1 isEqualTo []))
							then
							{
									uiNamespace getVariable "Overlay" displayCtrl 33 ctrlSetTextColor [1, 1, 1, 1];
									
									switch (PlayerWeaponSlot1 select 0) do 
									{
										case "Primary": 	{_weaponSlotSwitchMessage = format ["Press [1] to switch to %1. You cannot be moving/pressing other keys.",((PlayerWeaponSlot1 select 3) select 0)];};
										case "Launcher":	{_weaponSlotSwitchMessage = format ["Press [2] to switch to %1. You cannot be moving/pressing other keys.",((PlayerWeaponSlot1 select 3) select 0)];};
										case "Sidearm": 	{_weaponSlotSwitchMessage = format ["Press [3] to switch to %1. You cannot be moving/pressing other keys.",((PlayerWeaponSlot1 select 3) select 0)];};
										default 			{};
									};
									
									uiNamespace getVariable "Overlay" displayCtrl 33 ctrlSetText _weaponSlotSwitchMessage;
									uiNamespace getVariable "Overlay" displayCtrl 33 ctrlShow true;
							};
						}
						else
						{
							uiNamespace getVariable "Overlay" displayCtrl 33 ctrlShow false;
						};
					};
				}
				else
				{
					uiNamespace getVariable "Overlay" displayCtrl 33 ctrlShow false;
				};
			}
			else
			{
				uiNamespace getVariable "Overlay" displayCtrl 33 ctrlShow false;
			};
		}
		else
		{
			uiNamespace getVariable "Overlay" displayCtrl 33 ctrlShow false;	
		};
		
		//Code to close dialog when player loading in
		if ((player getVariable "PlayerReady") == 2)
		then
		{
			if (!IsNull (FindDisplay 3000))
			then
			{
				closeDialog 2;
			};
		};
	};
	sleep 0.33;
};