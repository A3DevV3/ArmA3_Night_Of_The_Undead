private 
[
	"_windowRepairZoneArray",
	"_actionAdded",
	"_inAnyZone",
	"_actionID",
	"_zspawn",
	"_zwindow",
	"_zbreach",
	"_windowboard1",
	"_windowboard2",
	"_windowboard3",
	"_windowboard4",
	"_windowboard5"
];

_actionAdded = false;
_inAnyZone = false;
_windowRepairZoneArray = [zbreach1,zbreach2,zbreach3,zbreach4,zbreach5,zbreach6,zbreach7,zbreach8,zbreach9];
_actionID = -1;


while {ServerCurrentRound > 0}
do
{
	_inAnyZone = false;
	{
		if (player inArea _x)
		then
		{
			_windowNum = ((_windowRepairZoneArray find _x) + 1);
			switch (_windowNum) 
			do 
			{
				case 1: {_zspawn = "zspawn1"; _zwindow = zwindow1; _zbreach = zbreach1; _windowboard1 = zwindow1b1; _windowboard2 = zwindow1b2; _windowboard3 = zwindow1b3; _windowboard4 = zwindow1b4; _windowboard5 = zwindow1b5;};
				case 2: {_zspawn = "zspawn2"; _zwindow = zwindow2; _zbreach = zbreach2; _windowboard1 = zwindow2b1; _windowboard2 = zwindow2b2; _windowboard3 = zwindow2b3; _windowboard4 = zwindow2b4; _windowboard5 = zwindow2b5;};
				case 3: {_zspawn = "zspawn3"; _zwindow = zwindow3; _zbreach = zbreach3; _windowboard1 = zwindow3b1; _windowboard2 = zwindow3b2; _windowboard3 = zwindow3b3; _windowboard4 = zwindow3b4; _windowboard5 = zwindow3b5;};
				case 4: {_zspawn = "zspawn4"; _zwindow = zwindow4; _zbreach = zbreach4; _windowboard1 = zwindow4b1; _windowboard2 = zwindow4b2; _windowboard3 = zwindow4b3; _windowboard4 = zwindow4b4; _windowboard5 = zwindow4b5;};
				case 5: {_zspawn = "zspawn5"; _zwindow = zwindow5; _zbreach = zbreach5; _windowboard1 = zwindow5b1; _windowboard2 = zwindow5b2; _windowboard3 = zwindow5b3; _windowboard4 = zwindow5b4; _windowboard5 = zwindow5b5;};
				case 6: {_zspawn = "zspawn6"; _zwindow = zwindow6; _zbreach = zbreach6; _windowboard1 = zwindow6b1; _windowboard2 = zwindow6b2; _windowboard3 = zwindow6b3; _windowboard4 = zwindow6b4; _windowboard5 = zwindow6b5;};
				case 7: {_zspawn = "zspawn7"; _zwindow = zwindow7; _zbreach = zbreach7; _windowboard1 = zwindow7b1; _windowboard2 = zwindow7b2; _windowboard3 = zwindow7b3; _windowboard4 = zwindow7b4; _windowboard5 = zwindow7b5;};
				case 8: {_zspawn = "zspawn8"; _zwindow = zwindow8; _zbreach = zbreach8; _windowboard1 = zwindow8b1; _windowboard2 = zwindow8b2; _windowboard3 = zwindow8b3; _windowboard4 = zwindow8b4; _windowboard5 = zwindow8b5;};
				case 9: {_zspawn = "zspawn9"; _zwindow = zwindow9; _zbreach = zbreach9; _windowboard1 = zwindow9b1; _windowboard2 = zwindow9b2; _windowboard3 = zwindow9b3; _windowboard4 = zwindow9b4; _windowboard5 = zwindow9b5;};
			};
			_inAnyZone = true;
			if (!(_actionAdded) || (!(_actionID in actionIDs player)))
			then
			{
				if ((player inArea _x) && ((isObjectHidden _windowboard1) || (isObjectHidden _windowboard2) || (isObjectHidden _windowboard3) || (isObjectHidden _windowboard4) || (isObjectHidden _windowboard5)))
				then
				{
					_actionAdded = true;
					_actionID = player addAction ["Repair window", "Local_Scripts\localRepairWindow.sqf", _x];
				};
			};
		};
	}
	forEach _windowRepairZoneArray;
	
	if ((!(_inAnyZone)) && (_actionAdded))
	then
	{
		player removeAction _actionID;
		_actionAdded = false;
	};
	sleep 0.25;
};