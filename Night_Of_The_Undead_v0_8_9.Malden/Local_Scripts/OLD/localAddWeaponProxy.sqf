private ["_arg1","_arg2","_temp"];

_temp = _this select 3;
_arg1 = _temp select 0;
_arg2 = (1 isEqualTo 2);
[_arg1, _arg2] execVM "Local_Scripts\localAddWeapon.sqf";