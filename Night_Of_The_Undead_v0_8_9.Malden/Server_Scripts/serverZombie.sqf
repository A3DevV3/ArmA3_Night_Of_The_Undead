private 
[
	"_playerListConstructor",
	"_zombieFreezeCounter",
	"_zombieFreezeCheck",
	"_zombieFreezeCheck2",
	"_target",
	"_retargetingCounter",
	"_min",
	"_playerTargetingData",
	"_infected",
	"_zspawn",
	"_zwindow",
	"_zbreach",
	"_windowboard1",
	"_windowboard2",
	"_windowboard3",
	"_windowboard4",
	"_windowboard5",
	"_thisZombie",
	"_markPos",
	"_param",
	"_initialPos",
	"_nextTarget",
	"_counter",
	"_militaryCloth",
	"_casque",
	"_kevlar",
	"_totalmil",
	"_milselect",
	"_chosenmil",
	"_totalhead",
	"_headselect",
	"_chosenhead",
	"_initialPos",
	"_targetPos",
	"_playerInZone",
	"_finalTarget",
	"_playerList",
	"_playerNear",
	"_nearestPlayers",
	"_seenPlayers",
	"_spotted",
	"_totalP",
	"_dist",
	"_total",
	"_round",
	"_object",
	"_a",
	"_b",
	"_vectorDistance",
	"_tempAA",
	"_currentDamage",
	"_newDamage",
	"_explosion"
];
	
	_thisZombie = _this select 0;
	_zwindow = _this select 1;
	_zbreach = _this select 2;
	_windowboard1 = _this select 3;
	_windowboard2 = _this select 4;
	_windowboard3 = _this select 5;
	_windowboard4 = _this select 6;
	_windowboard5 = _this select 7;
	
	_zombieFreezeCheck = 0;
	_zombieFreezeCounter = 0;
	
	_initialPos = getPos _thisZombie;
	_thisZombie disableAI "FSM";
	_thisZombie disableAI "AUTOTARGET";
	_thisZombie disableAI "TARGET";
	_thisZombie disableAI "RADIOPROTOCOL";
	_thisZombie disableAI "SUPPRESSION";
	_thisZombie disableAI "COVER";
	_thisZombie disableAI "AUTOCOMBAT";
	_thisZombie setBehaviour "CARELESS";
	_thisZombie enableFatigue false;
	_thisZombie setVariable ["BIS_noCoreConversations", true];
	_thisZombie disableConversation true;
	_thisZombie setMimic "hurt";
	_thisZombie setSpeedMode "FULL";
	[_thisZombie, "NoVoice"] remoteExec ["setSpeaker", 0, _thisZombie];

	removeAllWeapons _thisZombie;
	removeAllItems _thisZombie;
	removeAllAssignedItems _thisZombie;
	removeVest _thisZombie;
	removeBackpack _thisZombie;
	removeHeadgear _thisZombie;
	removeGoggles _thisZombie;
	
	if (ServerCurrentRound > 21)
	then
	{
		_thisZombie addVest "V_PlateCarrier2_blk";
	}
	else
	{
		if (ServerCurrentRound > 16)
		then
		{
			_thisZombie addVest "V_PlateCarrierL_CTRG";
		}
		else
		{
			if (ServerCurrentRound > 7)
			then
			{
			_thisZombie addVest "V_TacVestIR_blk";
			};
		};
	};
	
	_thisZombie addEventHandler ["HandleDamage", {
		private ["_explosion"];
		params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];
		hint _projectile;
		if (_source in MYZONETARGETLIST)
		then
		{
			if (_damage < 0.9)
			then
			{
				if (_source getVariable "HasPAPWeap")
				then
				{	
					//GM6 Lynx 12.7 mm | Wunderwaffe
					if (_projectile == "B_127x108_Ball")
					then
					{
						[_unit,1] execVM "Server_Scripts\serverPAPWeapEffect.sqf";
					};
					_currentDamage = getDammage _unit;
					_newDamage = _currentDamage * 2;
					_unit setDamage _newDamage;
				};
			};	
		};
	}];
	
	(_thisZombie) doMove (getPos _zwindow);
	_counter = 0;
	while {(((!(_thisZombie inArea _zwindow)) && (alive _thisZombie)) && (ServerCurrentRound > 0))}
	do
	{
		_counter = _counter + 1;
		if (_counter < 7)
		then
		{
		}
		else
		{
			_thisZombie disableAI "MOVE";
			_vectorDistance = (getPosASL _thisZombie) vectorDiff (getPosASL _zwindow);
			_a = (_vectorDistance select 0) / 8;
			_b = (_vectorDistance select 1) / 8;
			for "_x" from 1 to 8 do
			{
				if ((alive _thisZombie) && (ServerCurrentRound > 0))
				then
				{
					sleep 0.5;
					_thisZombie setPos [(((getPos _thisZombie) select 0) - _a),(((getPos _thisZombie) select 1) - _b), ((getPos _thisZombie) select 2)];
					_thisZombie setDir ((getPos _thisZombie) getDir (getPos _zbreach));
				};
			};
			_thisZombie setDir ((getPos _thisZombie) getDir (getPos _zbreach));
			_thisZombie setPos (getPos _zwindow);
		};
		sleep 3;
	};
	
	_thisZombie disableAI "MOVE";
	while {(((!(isObjectHidden _windowboard1)) || (!(isObjectHidden _windowboard2)) || (!(isObjectHidden _windowboard3)) || (!(isObjectHidden _windowboard4)) || (!(isObjectHidden _windowboard5)) && (alive _thisZombie)) && (alive _thisZombie)) && (ServerCurrentRound > 0)}
	do
	{
		_thisZombie setDir ((getPos _thisZombie) getDir (getPos _zbreach));
		_thisZombie switchMove "AwopPercMstpSgthWnonDnon_throw";
		_thisZombie setPos (getPos _zwindow);
		[[_thisZombie,"punch"], "INF_fnc_NextSound"] call BIS_fnc_MP;
		sleep 0.5;
		if (!(isObjectHidden _windowboard1))
		then
		{
			hideObjectGlobal _windowboard1;
		}
		else
		{
			if (!(isObjectHidden _windowboard2))
			then
			{
				hideObjectGlobal _windowboard2;
			}
			else
			{
				if (!(isObjectHidden _windowboard3))
				then
				{
					hideObjectGlobal _windowboard3;
				}
				else
				{
					if (!(isObjectHidden _windowboard4))
					then
					{
						hideObjectGlobal _windowboard4;
					}
					else
					{
						if (!(isObjectHidden _windowboard5))
						then
						{
							hideObjectGlobal _windowboard5;
						}
					};
				};
			};
		};
		sleep 2;
	};
	
	if ((alive _thisZombie) && (ServerCurrentRound > 0))
	then
	{
		_thisZombie setPos (getPos _zwindow);
	};
	
	_tempAA = 0;
	sleep 0.5;
	
	while {(((!(_thisZombie inArea _zbreach)) && (alive _thisZombie)) && (ServerCurrentRound > 0))}
	do
	{
		if (_tempAA < 4)
		then
		{
			_tempAA =  _tempAA + 1;
			if ((alive _thisZombie) && (ServerCurrentRound > 0))
			then
			{
				_thisZombie setDir ((getPos _thisZombie) getDir (getPos _zbreach));
				_thisZombie switchMove "AovrPercMstpSnonWnonDf";
			};
			sleep 2;
		}
		else
		{
			_thisZombie setPos (getPos _zbreach);
		};
	};
	
	_thisZombie enableAI "MOVE";
	_playerList = MYZONETARGETLIST;
	_playerNear = false;
	_nearestPlayers = [];
	_seenPlayers = [];
	_spotted = false;
	_playerTargetingData = [];
	_min = 150;
	
	{
		if (((_x getVariable "PlayerReady") == 5) && (!(_x getVariable "PlayerRespawnWaiting")))
		then
		{
			_dist = _thisZombie distance _x;
			_playerTargetingData pushBack _x;
			_playerTargetingData pushBack _dist;
		};
	} foreach _playerList;
	
	for "_x" from 1 to (count _playerList) do
	{
		if (_min > _playerTargetingData select ((_x*2)-1))
		then
		{
			_min = _playerTargetingData select ((_x*2)-1);
			_finalTarget = (_playerTargetingData select ((_x*2) - 2));
		};
	};
	_min = 150;
	

	if ((!alive _thisZombie) && (ServerCurrentRound > 0)) then
	{
		_thisZombie removeAllEventHandlers "hit";
	}
	else
	{
		_retargetingCounter = 0;
		while {(alive _thisZombie) && (ServerCurrentRound > 0)} do
		{
			_playerList = MYZONETARGETLIST;
			_targetPos = getposATL _finalTarget;
			_distance = (_targetPos distance _thisZombie);
			(_thisZombie) doMove (_targetPos);
			if(_distance<=2.5)then
			{	
				if ((alive _thisZombie) && (!(_finalTarget getVariable "PlayerRespawnWaiting")))
				then
				{
					_thisZombie setDir ((getPos _thisZombie) getDir (getPos _finalTarget));
					_thisZombie switchMove "AwopPercMstpSgthWnonDnon_throw";
					sleep 0.2;
					_targetPos = getposATL _finalTarget;
					_distance=(_targetPos distance _thisZombie);
					if(_distance<=2.5)then
					{	
						if (_finalTarget getVariable "PerkJuggernaut")
						then
						{
							_finalTarget setDamage (damage _finalTarget + 0.20);
						}
						else
						{
							_finalTarget setDamage (damage _finalTarget + 0.34);
						};
					};
					[[_thisZombie,"punch"], "INF_fnc_NextSound"] call BIS_fnc_MP;
					sleep 2;
				};
			};
			if(_finalTarget getVariable "PlayerRespawnWaiting")then
			{
				_playerTargetingData = [];
				{
					if (((_x getVariable "PlayerReady") == 5) && (!(_x getVariable "PlayerRespawnWaiting")))
					then
					{
						_dist = _thisZombie distance _x;
						_playerTargetingData pushBack _x;
						_playerTargetingData pushBack _dist;
					};
				} foreach _playerList;
				
				for "_x" from 1 to (count _playerList) do
				{
					if (_min > _playerTargetingData select ((_x*2)-1))
					then
					{
						_min = _playerTargetingData select ((_x*2)-1);
						_finalTarget = (_playerTargetingData select ((_x*2) - 2));
					};
				};
				_min = 150;
			};
			if (_zombieFreezeCounter == 4)
			then
			{
				_thisZombie setDamage 1;
			};
			if(_retargetingCounter > 5)
			then
			{
				_zombieFreezeCheck2 = _thisZombie distance _zombieFreezeCheck;
				if (_zombieFreezeCheck2 < 1)
				then
				{
					_zombieFreezeCounter = _zombieFreezeCounter + 1;
					_thisZombie setPos (getPos _zbreach);
				};
				_zombieFreezeCheck2 = 0;
				_playerTargetingData = [];
				{
					if (((_x getVariable "PlayerReady") == 5) && (!(_x getVariable "PlayerRespawnWaiting")))
					then
					{
						_dist = _thisZombie distance _x;
						_playerTargetingData pushBack _x;
						_playerTargetingData pushBack _dist;
					};
				} foreach _playerList;
				
				for "_x" from 1 to (count _playerList) do
				{
					if (_min > _playerTargetingData select ((_x*2)-1))
					then
					{
						_min = _playerTargetingData select ((_x*2)-1);
						_finalTarget = (_playerTargetingData select ((_x*2) - 2));
					};
				};
				_min = 150;
				_retargetingCounter = 0;
			};
			
			_asleep= 1+(random 1);
			_zombieFreezeCheck = getPos _thisZombie;
			sleep _asleep;
			_retargetingCounter = _retargetingCounter + 1;
		};
	};
_thisZombie removeAllEventHandlers "HandleDamage";
_thisZombie removeAllEventHandlers "hit";
sleep 10;
deleteVehicle _thisZombie;