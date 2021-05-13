private ["_door"];
_door = _this select 3;
for "_x" from 1 to (count Players) do 
{ 
	_temp = Players select (_x - 1);
	if (((_temp select 0) == (clientOwner)) && (!((_temp select 2) < 1000))) exitWith {[[clientOwner,_door],"Server_Scripts\serverAreaUnblockRequestHandler.sqf"] remoteExec ["execVM",2];};
	if (((_temp select 0) == (clientOwner)) && ((_temp select 2) < 1000))
	then
	{
		hint "Not enough money";
	};
};