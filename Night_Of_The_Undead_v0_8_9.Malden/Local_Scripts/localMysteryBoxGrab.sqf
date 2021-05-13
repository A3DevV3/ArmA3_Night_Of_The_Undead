private ["_weaponData","_actionID","_weaponObject","_pos"];

_weaponData = _this select 0;
_actionID = -1;

for "_x" to 10 do
{
	if ((getPos player) inArea MysteryBoxGrab)
	then
	{
		if (_actionID == -1)
		then
		{
			_actionID = player addAction [format ["Take %1",_weaponData select 0],"Local_Scripts\localAddWeaponProxy.sqf",[_weaponData select 1]];
			diag_log "MysteryBoxGrab";
			diag_log _weaponData;
		};
	}
	else
	{
		if (!(_actionID == -1))
		then
		{
			player removeAction _actionID;
		};
	};
	sleep 1;
};
