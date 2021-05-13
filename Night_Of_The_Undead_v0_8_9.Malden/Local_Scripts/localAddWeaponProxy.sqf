private ["_arg1","_temp"];

_temp = _this select 3;
_arg1 = _temp select 0;

			diag_log "Proxy";
			diag_log _arg1;
			
[_arg1] execVM "Local_Scripts\localAddWeapon.sqf";