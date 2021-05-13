private 
[
	"_playerUID",
	"_playerDisconnected",
	"_playerRespawning"
];

private ["_canPos","_canDir","_zonePos"];

params ["_requesterPlayerObject"];

diag_log _requesterPlayerObject;

if (_requesterPlayerObject inArea FuelCan3Zone)
then
{
	if (!(FuelCan3Mobile))
	then
	{
		FuelCan3Mobile = true;
		_canPos = getPosASL FuelCan3;
		_canDir = getDir FuelCan3;
		_zonePos = getPos FuelCan3Zone;
		FuelCan3 setPos (getPos trash);
		FuelCan3Zone setPos (getPos trash);
		_playerUID = getPlayerUID _requesterPlayerObject;
		_requesterPlayerObject setVariable ["HasFuel", true, false];
		[_requesterPlayerObject] execVM "Server_Scripts\serverSyncPlayerDataSend.sqf"; //Sync player variables to all other machines
		
		while {(FuelCan3Mobile)} do
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
				FuelCan3Mobile = false;
				FuelCan3 setPosASL _canPos;
				FuelCan3 setDir _canDir;
				FuelCan3Zone setPos _zonePos;
			};
			if (_playerRespawning)
			then
			{
				FuelCan3Mobile = false;
				_requesterPlayerObject setVariable ["HasFuel", false, false];
				[_requesterPlayerObject] execVM "Server_Scripts\serverSyncPlayerDataSend.sqf"; //Sync player variables to all other machines
				FuelCan3Mobile = false;
				FuelCan3 setPosASL _canPos;
				FuelCan3 setDir _canDir;
				FuelCan3Zone setPos _zonePos;
			};
			
			if (!(_requesterPlayerObject getVariable "HasFuel"))
			then
			{
				//Fuels been placed in generator
				FuelCan3Mobile = false;
			};
			sleep 1;
		};
	};
};

if (_requesterPlayerObject inArea FuelCan2Zone)
then
{
	if (!(FuelCan2Mobile))
	then
	{
		FuelCan2Mobile = true;
		_canPos = getPosASL FuelCan2;
		_canDir = getDir FuelCan2;
		_zonePos = getPos FuelCan2Zone;
		FuelCan2 setPos (getPos trash);
		FuelCan2Zone setPos (getPos trash);
		_playerUID = getPlayerUID _requesterPlayerObject;
		_requesterPlayerObject setVariable ["HasFuel", true, false];
		[_requesterPlayerObject] execVM "Server_Scripts\serverSyncPlayerDataSend.sqf"; //Sync player variables to all other machines
		
		while {(FuelCan2Mobile)} do
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
				FuelCan2Mobile = false;
				FuelCan2 setPosASL _canPos;
				FuelCan2 setDir _canDir;
				FuelCan2Zone setPos _zonePos;
			};
			if (_playerRespawning)
			then
			{
				FuelCan2Mobile = false;
				_requesterPlayerObject setVariable ["HasFuel", false, false];
				[_requesterPlayerObject] execVM "Server_Scripts\serverSyncPlayerDataSend.sqf"; //Sync player variables to all other machines
				FuelCan2Mobile = false;
				FuelCan2 setPosASL _canPos;
				FuelCan2 setDir _canDir;
				FuelCan2Zone setPos _zonePos;
			};
			
			if (!(_requesterPlayerObject getVariable "HasFuel"))
			then
			{
				//Fuels been placed in generator
				FuelCan2Mobile = false;
			};
			sleep 1;
		};
	};
};

if (_requesterPlayerObject inArea FuelCan1Zone)
then
{
	if (!(FuelCan1Mobile))
	then
	{
		FuelCan1Mobile = true;
		_canPos = getPosASL FuelCan1;
		_canDir = getDir FuelCan1;
		_zonePos = getPos FuelCan1Zone;
		FuelCan1 setPos (getPos trash);
		FuelCan1Zone setPos (getPos trash);
		_playerUID = getPlayerUID _requesterPlayerObject;
		_requesterPlayerObject setVariable ["HasFuel", true, false];
		[_requesterPlayerObject] execVM "Server_Scripts\serverSyncPlayerDataSend.sqf"; //Sync player variables to all other machines
		
		while {(FuelCan1Mobile)} do
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
				FuelCan1Mobile = false;
				FuelCan1 setPosASL _canPos;
				FuelCan1 setDir _canDir;
				FuelCan1Zone setPos _zonePos;
			};
			if (_playerRespawning)
			then
			{
				FuelCan1Mobile = false;
				_requesterPlayerObject setVariable ["HasFuel", false, false];
				[_requesterPlayerObject] execVM "Server_Scripts\serverSyncPlayerDataSend.sqf"; //Sync player variables to all other machines
				FuelCan1Mobile = false;
				FuelCan1 setPosASL _canPos;
				FuelCan1 setDir _canDir;
				FuelCan1Zone setPos _zonePos;
			};
			
			if (!(_requesterPlayerObject getVariable "HasFuel"))
			then
			{
				//Fuels been placed in generator
				FuelCan1Mobile = false;
			};
			sleep 1;
		};
	};
};