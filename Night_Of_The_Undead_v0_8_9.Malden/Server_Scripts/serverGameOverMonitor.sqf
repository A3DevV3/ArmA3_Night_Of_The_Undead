private ["_gameOver","_zombiesTargetsList"];
while {ServerCurrentRound > 0}
do
{
	_gameOver = true;
	{
		if ((_x getVariable "PlayerReady") == 5)
		then
		{
			if (!(_x getVariable "PlayerRespawnWaiting"))
			then
			{
				_gameOver = false;
			};
		};
	} foreach allPlayers;
	if (_gameOver)
	then
	{
		[[format ["All players are dead. Game over. You've made it %1 rounds.",ServerCurrentRound]],"Local_Scripts\localSystemChat.sqf"] remoteExec ["execVM",0];
		MaxRound = ServerCurrentRound;
		execVM "Server_Scripts\syncServerDataSend.sqf"; //Syncs ServerCurrentRound MysteryBoxLocation and OpenAreas to all clients
		[[MaxRound],"Local_Scripts\localGameOver.sqf"] remoteExec ["execVM",-2]; //Executes on all machines
		sleep 30; //Give players time to watch the game over camera work
		execVM "Server_Scripts\serverRestart.sqf";
	};
		
	_zombiesTargetsList= [];
	{
		if ((isPlayer _x) && (alive _x)) 
		then
		{
			_zombiesTargetsList = _zombiesTargetsList + [_x];
		};
	} forEach list PlayerTargetingTrigger;
	MYZONETARGETLIST = _zombiesTargetsList;
	
	sleep 0.33;
};