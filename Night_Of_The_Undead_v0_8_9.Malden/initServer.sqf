//Author - Dev - a3devv3@gmail.com

GAMESETTINGS setVariable ["ZombieDifficulty", 1, true]; //0 = Easy  |  1 = Normal  |  2 = Hard
GAMESETTINGS setVariable ["PointsPerKill", 50, true]; //25 = Hard |  50 = Normal  |  100 Easy
GAMESETTINGS setVariable ["MachineGunsEnabled", true, true]; //Default = true
GAMESETTINGS setVariable ["SpecialWeaponsEnabled", true, true]; //Default = true

//GLOBAL-LOCAL VARIABLES - These are variables global to the server instance, but not synced to/from the network
ActiveZombies = 0; //Used by serverRoundManager.sqf. It must be defined before EH
MysteryBoxActive = 0; //Used to keep track on whether the mystery box is in use or not
NewPlayerPresent = false;
ZombieGroup = createGroup [east,false];
AreaLights = [];
ServerRestartFlag = false;

		DEBUGGLOBALTNoZombies = 0;
		
FuelCan1Mobile = false;
FuelCan2Mobile = false;
FuelCan3Mobile = false;
GeneratorFuelCount = 0;
SatchelCount = 0;

//Configure aspects of the mission related to PAP
execVM "Server_Scripts\setupPAP.sqf";
		
//Setup weapons database as it configures global-local variable WEAPONSDB
execVM "Local_Scripts\localConfigureWeaponsDatabase.sqf";

//Setup the map lighting as it configures global-local variable AreaLights
execVM "Server_Scripts\serverlightRegistry.sqf";

//SYNCHRONIZED GLOBAL VARIABLES - These are variables global to the machine, and also synced to clients
ServerCurrentRound = -2;
MysteryBoxLocation = 1;
OpenAreas = ["Zone1"];
MaxRound = 0;

//For subtracting active zombie count whenever a zombie is killed
addMissionEventHandler ["EntityKilled",
{
	params ["_killed", "_killer", "_instigator"];
	if (_killed isKindOf "O_G_Soldier_F")
	then
	{
		if (isNull _instigator) then {_instigator = UAVControl vehicle _killer select 0}; // UAV/UGV player operated road kill
		if (isNull _instigator) then {_instigator = _killer}; // player driven vehicle road kill
		
		if (!(faction _killed == "BLU_F"))
		then
		{
			ActiveZombies = ActiveZombies - 1;
		};
	};
}];
execVM "Server_Scripts\serverGameManager.sqf";