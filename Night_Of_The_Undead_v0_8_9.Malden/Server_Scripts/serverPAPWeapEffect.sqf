params ["_object","_effectNo","_explosion"];

if (_effectNo == 1)
then
{
	[_object, nil, True] call BIS_fnc_moduleLightning;
};