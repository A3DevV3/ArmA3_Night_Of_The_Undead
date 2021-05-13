if (!(Power))
then
{
	if (player getVariable "HasFuel")
	then
	{
		player setVariable ["HasFuel", false, false];
		//DATA SYNC BLOCK//////////////////////////////////////////////
		//When player is initializing, define player vars for everyone else
		execVM "Local_Scripts\syncPlayerDataSend.sqf"; //Sync player variables to all other machines and server
		///////////////////////////////////////////////////////////////
		[[],"Server_Scripts\serverGeneratorAddFuel.sqf"] remoteExec ["execVM",2];
	}
	else
	{
		hint "The generator needs fuel | You do not have any";
	};
};