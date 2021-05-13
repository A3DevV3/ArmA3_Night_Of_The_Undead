private ["_startWaitTimer","_disconnectedPlayerID","_players","_temp","_script_Handle","_gameActive","_tempMem1","_tempMem2","_gameOver","_tempMem3","_allPlayersReady","_tempMem1","_tempMem2","_DBQuery"];

_gameActive = true;
_gameOver = false;

//systemChat "S_GameManager run";
[["Server waiting on players..."],"Local_Scripts\localSystemChat.sqf"] remoteExec ["execVM",0];

_allPlayersReady = false;
_tempMem2 = 0;
_startWaitTimer = 0;

//Check if game is in progress, if not, wait until majority of players indicate ready, then start the game
while {ServerCurrentRound == -2}
do
{
	_startWaitTimer = _startWaitTimer + 1;
	[[_startWaitTimer],"Local_Scripts\localLobbyCountdown.sqf"] remoteExec ["execVM",0]; //Everywhere but server
	if (_startWaitTimer > 120)
	then
	{
		//If 10 minutes has passed and a game has not been started, run serverRestart script to determine mission or server restart
		if (_startWaitTimer > 600)
		then
		{
			execVM "Server_Script\serverRestart.sqf";
			_startWaitTimer = 0;
		};
		//Continually scan all players to get a count of how many are ready. How many are ready is stored by _tempMem2
		_tempMem1 = count (call BIS_fnc_listPlayers);
		_tempMem2 = 0;
		for "_x" from 1 to 10 do 
		{
			if (_x <= _tempMem1)
			then
			{
				if ((((call BIS_fnc_listPlayers) select (_x - 1)) getVariable "PlayerReady") == 1)
				then
				{
					_tempMem2 = _tempMem2 + 1;
				};
			};
		};
			
		//Handle situation where player count is 2 players or lower. In this cause, only 1 player is needed to start the game
		if (count (call BIS_fnc_listPlayers) < 3)
		then
		{
			if (_tempMem2 > 0)
			then
			{
				//Set all players with ready state to 1 to 2
				_tempMem1 = count (call BIS_fnc_listPlayers);
				for "_x" from 1 to 10 do 
				{
					if (_x <= _tempMem1)
					then
					{
						//If a player has indicated player ready state 1, set their ready state to 2
						if ((((call BIS_fnc_listPlayers) select (_x - 1)) getVariable "PlayerReady") == 1)
						then
						{
							((call BIS_fnc_listPlayers) select (_x - 1)) setVariable ["PlayerReady", 2, false];
							//DATA SYNC BLOCK//////////////////////////////////////////////
							[((call BIS_fnc_listPlayers) select (_x - 1))] execVM "Server_Scripts\serverSyncPlayerDataSend.sqf"; //Sync player variables to all other machines
							///////////////////////////////////////////////////////////////
						};
									
						_DBQuery = ["read", ["PlayerPresenceTable", getPlayerUID ((call BIS_fnc_listPlayers) select (_x - 1))]] call DATABASE;
						if ((typeName _DBQuery) == "BOOL")
						then
						{
							[["There is a new player on server. Prologue will be shown..."],"Local_Scripts\localSystemChat.sqf"] remoteExec ["execVM",0];
							NewPlayerPresent = true;
							["write", ["PlayerPresenceTable", getPlayerUID ((call BIS_fnc_listPlayers) select (_x - 1)),"Present"]] call DATABASE;
						};
					};
				};
						//////////////////////				
					//1 player has indicated ready, start game
					[["Player ready threshold reached. Starting game in 10"],"Local_Scripts\localSystemChat.sqf"] remoteExec ["execVM",0];
					sleep 1;
					[["Player ready threshold reached. Starting game in 9"],"Local_Scripts\localSystemChat.sqf"] remoteExec ["execVM",0];
					sleep 1;
					[["Player ready threshold reached. Starting game in 8"],"Local_Scripts\localSystemChat.sqf"] remoteExec ["execVM",0];
					sleep 1;
					[["Player ready threshold reached. Starting game in 7"],"Local_Scripts\localSystemChat.sqf"] remoteExec ["execVM",0];
					sleep 1;
					[["Player ready threshold reached. Starting game in 6"],"Local_Scripts\localSystemChat.sqf"] remoteExec ["execVM",0];
					sleep 1;
					[["Player ready threshold reached. Starting game in 5"],"Local_Scripts\localSystemChat.sqf"] remoteExec ["execVM",0];
					sleep 1;
					[["Player ready threshold reached. Starting game in 4"],"Local_Scripts\localSystemChat.sqf"] remoteExec ["execVM",0];
					sleep 1;
					[["Player ready threshold reached. Starting game in 3"],"Local_Scripts\localSystemChat.sqf"] remoteExec ["execVM",0];
					sleep 1;
					[["Player ready threshold reached. Starting game in 2"],"Local_Scripts\localSystemChat.sqf"] remoteExec ["execVM",0];
					sleep 1;
					[["Player ready threshold reached. Starting game in 1"],"Local_Scripts\localSystemChat.sqf"] remoteExec ["execVM",0];
					sleep 1;
					
						//Set all players with ready state to 1 at this moment to 2
						_tempMem1 = count (call BIS_fnc_listPlayers);
						for "_x" from 1 to 10 do 
						{
							if (_x <= _tempMem1)
							then
							{
								if ((((call BIS_fnc_listPlayers) select (_x - 1)) getVariable "PlayerReady") == 1)
								then
								{
									((call BIS_fnc_listPlayers) select (_x - 1)) setVariable ["PlayerReady", 2, false];
									//DATA SYNC BLOCK//////////////////////////////////////////////
									[((call BIS_fnc_listPlayers) select (_x - 1))] execVM "Server_Scripts\serverSyncPlayerDataSend.sqf"; //Sync player variables to all other machines
									///////////////////////////////////////////////////////////////
								};
							};
						};
						//////////////////////
						
					ServerCurrentRound = -1; //Indicate game starting
					execVM "Server_Scripts\syncServerDataSend.sqf"; //Syncs ServerCurrentRound MysteryBoxLocation and OpenAreas to all clients
				};
			}
			else
			{
				//Handle situation where player count is 3 players or greater. In this cause, majority is needed to start the game
				 if (count (call BIS_fnc_listPlayers) > 2)
				 then
				 {
					if (_tempMem2 > (0.51 * count (call BIS_fnc_listPlayers)))
					then
					{
							//Set all players with ready state to 1 to 2
							_tempMem1 = count (call BIS_fnc_listPlayers);
							for "_x" from 1 to 10 do 
							{
								if (_x <= _tempMem1)
								then
								{
									if ((((call BIS_fnc_listPlayers) select (_x - 1)) getVariable "PlayerReady") == 1)
									then
									{
										((call BIS_fnc_listPlayers) select (_x - 1)) setVariable ["PlayerReady", 2, false];
										//DATA SYNC BLOCK//////////////////////////////////////////////
										[((call BIS_fnc_listPlayers) select (_x - 1))] execVM "Server_Scripts\serverSyncPlayerDataSend.sqf"; //Sync player variables to all other machines
										///////////////////////////////////////////////////////////////
									};
								};
								_DBQuery = ["read", ["PlayerPresenceTable", getPlayerUID ((call BIS_fnc_listPlayers) select (_x - 1))]] call DATABASE;
								if ((typeName _DBQuery) == "BOOL")
								then
								{
									[["There is a new player on server. Prologue will be shown..."],"Local_Scripts\localSystemChat.sqf"] remoteExec ["execVM",0];
									NewPlayerPresent = true;
									["write", ["PlayerPresenceTable", getPlayerUID ((call BIS_fnc_listPlayers) select (_x - 1)),"Present"]] call DATABASE;
								};
							};
							//////////////////////
						//Majority of players have indicated ready, start game
						[["Player ready threshold reached. Starting game in 10"],"Local_Scripts\localSystemChat.sqf"] remoteExec ["execVM",0];
						sleep 1;
						[["Player ready threshold reached. Starting game in 9"],"Local_Scripts\localSystemChat.sqf"] remoteExec ["execVM",0];
						sleep 1;
						[["Player ready threshold reached. Starting game in 8"],"Local_Scripts\localSystemChat.sqf"] remoteExec ["execVM",0];
						sleep 1;
						[["Player ready threshold reached. Starting game in 7"],"Local_Scripts\localSystemChat.sqf"] remoteExec ["execVM",0];
						sleep 1;
						[["Player ready threshold reached. Starting game in 6"],"Local_Scripts\localSystemChat.sqf"] remoteExec ["execVM",0];
						sleep 1;
						[["Player ready threshold reached. Starting game in 5"],"Local_Scripts\localSystemChat.sqf"] remoteExec ["execVM",0];
						sleep 1;
						[["Player ready threshold reached. Starting game in 4"],"Local_Scripts\localSystemChat.sqf"] remoteExec ["execVM",0];
						sleep 1;
						[["Player ready threshold reached. Starting game in 3"],"Local_Scripts\localSystemChat.sqf"] remoteExec ["execVM",0];
						sleep 1;
						[["Player ready threshold reached. Starting game in 2"],"Local_Scripts\localSystemChat.sqf"] remoteExec ["execVM",0];
						sleep 1;
						[["Player ready threshold reached. Starting game in 1"],"Local_Scripts\localSystemChat.sqf"] remoteExec ["execVM",0];
						sleep 1;
						
							//Set all players with ready state to 1 to 2
							_tempMem1 = count (call BIS_fnc_listPlayers);
							for "_x" from 1 to 10 do 
							{
								if (_x <= _tempMem1)
								then
								{
									if ((((call BIS_fnc_listPlayers) select (_x - 1)) getVariable "PlayerReady") == 1)
									then
									{
										((call BIS_fnc_listPlayers) select (_x - 1)) setVariable ["PlayerReady", 2, false];
										//DATA SYNC BLOCK//////////////////////////////////////////////
										[((call BIS_fnc_listPlayers) select (_x - 1))] execVM "Server_Scripts\serverSyncPlayerDataSend.sqf"; //Sync player variables to all other machines
										///////////////////////////////////////////////////////////////
									};
								};
							};
							///////////////////////
							
						ServerCurrentRound = -1;
						execVM "Server_Scripts\syncServerDataSend.sqf"; //Syncs ServerCurrentRound MysteryBoxLocation and OpenAreas to all clients
					};
				 };
			};
	};
	sleep 1;
};

//Players in ready state 1 have been switched to ready state 2, they will switch to ready state 3 when they are ready
//This section catches after the above section changes SCR to -1
while {ServerCurrentRound == -1}
do
{
	_tempMem1 = count (call BIS_fnc_listPlayers);
	_tempMem2 = 0;
	_tempMem3 = 0;
	
	//Gets count of all players with ready state 2 or 3
	for "_x" from 1 to 10 do 
	{
		if (_x <= _tempMem1)
		then
		{
			if ((((call BIS_fnc_listPlayers) select (_x - 1)) getVariable "PlayerReady") == 3)
			then
			{
				_tempMem3 = _tempMem3 + 1;
			};
			if  ((((call BIS_fnc_listPlayers) select (_x - 1)) getVariable "PlayerReady") == 2)
			then
			{
				_tempMem3 = _tempMem3 + 1;
			};
		};
	};
		
	//Gets count of players with just ready state 3
	for "_x" from 1 to 10 do 
	{
		if (_x <= _tempMem1)
		then
		{
			if ((((call BIS_fnc_listPlayers) select (_x - 1)) getVariable "PlayerReady") == 3)
			then
			{
				_tempMem2 = _tempMem2 + 1;
			};
		};
	};
	
	if (_tempMem3 == _tempMem2) //If there are no state 2 players left (Meaning they've all indicated state 3. Start the prologue or game
	then
	{
		ServerCurrentRound = 0;
		execVM "Server_Scripts\syncServerDataSend.sqf"; //Syncs ServerCurrentRound MysteryBoxLocation and OpenAreas to all clients
	};
	sleep 0.2;
};

sleep 1;
waitUntil {ServerCurrentRound == 0};

//systemChat "Loop 1";
if (NewPlayerPresent)
then
{
	//systemChat "Loop 2";
	sleep 2;
	introscenery1 hideObjectGlobal true;
	introscenery2 hideObjectGlobal true;
	introscenery3 hideObjectGlobal true;
	introscenery4 hideObjectGlobal true;
	introscenery5 hideObjectGlobal true;
	introscenery6 hideObjectGlobal true;
	//[["SERVER: Prologue started"],"Local_Scripts\localSystemChat.sqf"] remoteExec ["execVM",0];
	["Local_Scripts\localIntroMovie.sqf"] remoteExec ["execVM",0];
	sleep 14.5; //14.5
	sleep 4.5; //19
	sleep 8.1; //27.5
	introscenery1 hideObjectGlobal false;
	introscenery2 hideObjectGlobal false;
	introscenery3 hideObjectGlobal false;
	introscenery4 hideObjectGlobal false;
	introscenery5 hideObjectGlobal false;
	introscenery6 hideObjectGlobal false;
	sleep 15.9;
	NewPlayerPresent = false;
};
		
ServerCurrentRound = 1;
execVM "Server_Scripts\syncServerDataSend.sqf"; //Syncs ServerCurrentRound MysteryBoxLocation and OpenAreas to all clients
		
_tempMem1 = count (call BIS_fnc_listPlayers);
for "_x" from 1 to 10 do 
{
	if (_x <= _tempMem1)
	then
	{
		if ((((call BIS_fnc_listPlayers) select (_x - 1)) getVariable "PlayerReady") == 3)
		then
		{
			((call BIS_fnc_listPlayers) select (_x - 1)) setVariable ["PlayerReady",4,false];
				//DATA SYNC BLOCK//////////////////////////////////////////////
			[((call BIS_fnc_listPlayers) select (_x - 1))] execVM "Server_Scripts\serverSyncPlayerDataSend.sqf"; //Sync player variables to all other machines
			///////////////////////////////////////////////////////////////
		};
	};
};

//Ensure the game starts at the correct day/night cycle time
skipTime (20 - daytime + 24 ) % 24;// Skip forward to the correct mission time, irrespective of the current mission time

MysteryBoxUseCount = 0;
execVM "Server_Scripts\serverRoundManager.sqf";
sleep 5;
execVM "Server_Scripts\serverGameOverMonitor.sqf";
//systemChat "serverGameManager exit";