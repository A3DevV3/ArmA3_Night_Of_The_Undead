private ["_string"];
GeneratorFuelCount = GeneratorFuelCount + 1;

if (3 > GeneratorFuelCount)
then
{
	if (GeneratorFuelCount == 2)
	then
	{
		{hint "Generator needs 1 more fuel can..."} remoteExec ["bis_fnc_call", 0];
	}
	else
	{
		if (GeneratorFuelCount == 1)
		then
		{
			{hint "Generator needs 2 more fuel cans..."} remoteExec ["bis_fnc_call", 0];
		};
	};
};

if (GeneratorFuelCount == 3)
then
{
	execVM "Server_Scripts\serverTurnOnPower.sqf";
};