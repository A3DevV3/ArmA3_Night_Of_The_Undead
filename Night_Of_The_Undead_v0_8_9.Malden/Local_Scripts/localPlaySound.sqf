private ["_SFXHandle","_counter","_soundToPlay","_duration"];

_soundToPlay = _this select 0;

//Play game start sound
_counter = 0;
_SFXHandle = "Land_HelipadEmpty_F" createVehicleLocal getPos player;
_SFXHandle attachTo [player,[0,0,0.2]];

switch (_soundToPlay)
do
{
	case 1: {_SFXHandle say "startSound"; _duration = 30;};
	case 2: {_SFXHandle say "nextRound"; _duration = 21;};
	case 3: {_SFXHandle say "gameStart"; _duration = 11;};
	case 4: {_SFXHandle say "doorOpen"; _duration = 2;};
	case 5: {_SFXHandle say "power"; _duration = 25;};
};	
while {_counter < _duration}
do
{
	_counter = _counter + 1;
	sleep 1;
};
deleteVehicle _SFXHandle;