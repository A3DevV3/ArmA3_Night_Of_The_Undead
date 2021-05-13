params ["_tempMem1","_IDToKick","_StringIDToKick"];

while {ServerCurrentRound == -2}
do
{
	_tempMem1 = count (call BIS_fnc_listPlayers);
	for "_x" from 1 to 10 do 
	{
		if (_x <= _tempMem1)
		then
		{
			_IDToKick = getPlayerUID ((call BIS_fnc_listPlayers) select (_x - 1));
			if ((count (((call BIS_fnc_listPlayers) select (_x - 1)) getVariable "VoteDKickAgainst")) > (0.51 * (count (call BIS_fnc_listPlayers))))
			then
			{
				[format ["Threshold value %1",(0.51 * (count (call BIS_fnc_listPlayers)))],"Local_Scripts\localSystemChat.sqf"] remoteExec ["execVM",0];
				[format ["Player %1 needs to be kicked",_IDToKick],"Local_Scripts\localSystemChat.sqf"] remoteExec ["execVM",0];
				_IDToKick = getPlayerUID ((call BIS_fnc_listPlayers) select (_x - 1));
				_StringIDToKick = format ["%1", _IDToKick];
				"SERVERCOMMANDPASSWORD" serverCommand format ["#kick %1",_StringIDToKick];
				//relace the "SERVERCOMMANDPASSWORD" with "[your password]"    Example: password is water so it'd be "water" serverCommand format ["#kick %1",_StringIDToKick];
			};
		};
	};
	sleep 3;
};
systemChat "Server kick manager stopped";
