if (Power)
then
{
	if (player getVariable "HasC4")
	then
	{
		player setVariable ["HasC4", false, false];
		if (UnblockActionAdded == 1) then {player removeAction actionID; UnblockActionAdded = 0;};
		//DATA SYNC BLOCK//////////////////////////////////////////////
		//When player is initializing, define player vars for everyone else
		execVM "Local_Scripts\syncPlayerDataSend.sqf"; //Sync player variables to all other machines and server
		///////////////////////////////////////////////////////////////
		[[],"Server_Scripts\serverPAPAddSatchel.sqf"] remoteExec ["execVM",2];
	}
	else
	{
	};
};