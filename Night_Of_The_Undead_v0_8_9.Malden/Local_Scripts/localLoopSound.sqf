private ["_SFXHandle","_counter","_soundToLoop","_duration"];

_soundToLoop = _this select 0;

_counter = 0;
_SFXHandle = "Land_HelipadEmpty_F" createVehicleLocal getPos player;
_SFXHandle attachTo [player,[0,0,0.2]];

while {LoopSoundState == 1}
do
{
	switch (_soundToLoop)
	do
	{
		case 1: {_SFXHandle say "LobbyLoop"; _duration = 160;};
	};	
	while {_counter < _duration}
	do
	{
		if (LoopSoundState == 2) exitWith {};
		_counter = _counter + 1;
		sleep 1;
	};
	_counter = 0;
};
deleteVehicle _SFXHandle;
LoopSoundState = 0;