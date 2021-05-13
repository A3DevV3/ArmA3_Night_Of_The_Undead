private ["_hostPresent"];

while {true}
do
{
	if (count call BIS_fnc_listPlayers > 0) //Only run if at least 1 player on server
	then
	{
		_hostPresent = false;
		//Check if a host has been assigned yet 
		{
			if (!(_x getVariable "PlayerHost"))
			then
			//Executes if scanned player is not host
			{
			}
			else
			//Executes if scanned player is host
			{
				_hostPresent = true;
			};
		} forEach call BIS_fnc_listPlayers;
		if (!(_hostPresent))
		then
		{
			(selectRandom call BIS_fnc_listPlayers) setVariable ["PlayerHost", true, true];
		};
	};
	sleep 5;
};