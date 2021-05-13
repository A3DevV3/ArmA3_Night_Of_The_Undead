private 
[
	"_playerUID",
	"_playerDisconnected",
	"_playerRespawning"
];

private ["_canPos","_canDir","_zonePos"];

params ["_requesterPlayerObject"];

diag_log _requesterPlayerObject;

if (_requesterPlayerObject inArea Satchel3Zone)
then
{
	if (!(Satchel3Mobile))
	then
	{
		Satchel3Mobile = true;
		_canPos = getPosASL Satchel3;
		_canDir = getDir Satchel3;
		_zonePos = getPos Satchel3Zone;
		Satchel3 setPos (getPos trash);
		Satchel3Zone setPos (getPos trash);
		_playerUID = getPlayerUID _requesterPlayerObject;
		_requesterPlayerObject setVariable ["HasC4", true, false];
		[_requesterPlayerObject] execVM "Server_Scripts\serverSyncPlayerDataSend.sqf"; //Sync player variables to all other machines
		
		while {(Satchel3Mobile)} do
		{
			_playerDisconnected = true;
			_playerRespawning = true;
			{
				if ((getPlayerUID _x) == _playerUID)
				then
				{
					_playerDisconnected = false;
				};
				if ((getPlayerUID _x) == _playerUID)
				then
				{
					if (!(_x getVariable "PlayerRespawnWaiting"))
					then
					{
						_playerRespawning = false;
					};
				};
			} forEach allPlayers;
			
			if (_playerDisconnected)
			then
			{
				Satchel3Mobile = false;
				Satchel3 setPosASL _canPos;
				Satchel3 setDir _canDir;
				Satchel3Zone setPos _zonePos;
			};
			if (_playerRespawning)
			then
			{
				Satchel3Mobile = false;
				_requesterPlayerObject setVariable ["HasC4", false, false];
				[_requesterPlayerObject] execVM "Server_Scripts\serverSyncPlayerDataSend.sqf"; //Sync player variables to all other machines
				Satchel3Mobile = false;
				Satchel3 setPosASL _canPos;
				Satchel3 setDir _canDir;
				Satchel3Zone setPos _zonePos;
			};
			
			if (!(_requesterPlayerObject getVariable "HasC4"))
			then
			{
				//Fuels been placed in generator
				Satchel3Mobile = false;
			};
			sleep 1;
		};
	};
};

if (_requesterPlayerObject inArea Satchel2Zone)
then
{
	if (!(Satchel2Mobile))
	then
	{
		Satchel2Mobile = true;
		_canPos = getPosASL Satchel2;
		_canDir = getDir Satchel2;
		_zonePos = getPos Satchel2Zone;
		Satchel2 setPos (getPos trash);
		Satchel2Zone setPos (getPos trash);
		_playerUID = getPlayerUID _requesterPlayerObject;
		_requesterPlayerObject setVariable ["HasC4", true, false];
		[_requesterPlayerObject] execVM "Server_Scripts\serverSyncPlayerDataSend.sqf"; //Sync player variables to all other machines
		
		while {(Satchel2Mobile)} do
		{
			_playerDisconnected = true;
			_playerRespawning = true;
			{
				if ((getPlayerUID _x) == _playerUID)
				then
				{
					_playerDisconnected = false;
				};
				if ((getPlayerUID _x) == _playerUID)
				then
				{
					if (!(_x getVariable "PlayerRespawnWaiting"))
					then
					{
						_playerRespawning = false;
					};
				};
			} forEach allPlayers;
			
			if (_playerDisconnected)
			then
			{
				Satchel2Mobile = false;
				Satchel2 setPosASL _canPos;
				Satchel2 setDir _canDir;
				Satchel2Zone setPos _zonePos;
			};
			if (_playerRespawning)
			then
			{
				Satchel2Mobile = false;
				_requesterPlayerObject setVariable ["HasC4", false, false];
				[_requesterPlayerObject] execVM "Server_Scripts\serverSyncPlayerDataSend.sqf"; //Sync player variables to all other machines
				Satchel2Mobile = false;
				Satchel2 setPosASL _canPos;
				Satchel2 setDir _canDir;
				Satchel2Zone setPos _zonePos;
			};
			
			if (!(_requesterPlayerObject getVariable "HasC4"))
			then
			{
				//Fuels been placed in generator
				Satchel2Mobile = false;
			};
			sleep 1;
		};
	};
};

if (_requesterPlayerObject inArea Satchel1Zone)
then
{
	if (!(Satchel1Mobile))
	then
	{
		Satchel1Mobile = true;
		_canPos = getPosASL Satchel1;
		_canDir = getDir Satchel1;
		_zonePos = getPos Satchel1Zone;
		Satchel1 setPos (getPos trash);
		Satchel1Zone setPos (getPos trash);
		_playerUID = getPlayerUID _requesterPlayerObject;
		_requesterPlayerObject setVariable ["HasC4", true, false];
		[_requesterPlayerObject] execVM "Server_Scripts\serverSyncPlayerDataSend.sqf"; //Sync player variables to all other machines
		
		while {(Satchel1Mobile)} do
		{
			_playerDisconnected = true;
			_playerRespawning = true;
			{
				if ((getPlayerUID _x) == _playerUID)
				then
				{
					_playerDisconnected = false;
				};
				if ((getPlayerUID _x) == _playerUID)
				then
				{
					if (!(_x getVariable "PlayerRespawnWaiting"))
					then
					{
						_playerRespawning = false;
					};
				};
			} forEach allPlayers;
			
			if (_playerDisconnected)
			then
			{
				Satchel1Mobile = false;
				Satchel1 setPosASL _canPos;
				Satchel1 setDir _canDir;
				Satchel1Zone setPos _zonePos;
			};
			if (_playerRespawning)
			then
			{
				Satchel1Mobile = false;
				_requesterPlayerObject setVariable ["HasC4", false, false];
				[_requesterPlayerObject] execVM "Server_Scripts\serverSyncPlayerDataSend.sqf"; //Sync player variables to all other machines
				Satchel1Mobile = false;
				Satchel1 setPosASL _canPos;
				Satchel1 setDir _canDir;
				Satchel1Zone setPos _zonePos;
			};
			
			if (!(_requesterPlayerObject getVariable "HasC4"))
			then
			{
				//Fuels been placed in generator
				Satchel1Mobile = false;
			};
			sleep 1;
		};
	};
};