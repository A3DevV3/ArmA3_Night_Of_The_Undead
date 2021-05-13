private ["_string"];

SatchelCount = SatchelCount + 1;

if (3 > SatchelCount)
then
{
	if (SatchelCount == 2)
	then
	{
		{hint "1 more satchel..."} remoteExec ["bis_fnc_call", 0];
	}
	else
	{
		if (SatchelCount == 1)
		then
		{
			{hint "2 more satchels..."} remoteExec ["bis_fnc_call", 0];
		};
	};
};

if (SatchelCount == 3)
then
{
	execVM "Server_Scripts\serverOpenPAP.sqf";
};