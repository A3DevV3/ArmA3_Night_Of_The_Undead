if (!(SpamDelay))
then
{
	SpamDelay = true;
	if ((player getVariable "PlayerReady") == 0)
	then
	{
		player setVariable ["PlayerReady", 1, false];
		//DATA SYNC BLOCK//////////////////////////////////////////////
		execVM "Local_Scripts\syncPlayerDataSend.sqf"; //Sync player variables to all other machines and server
		///////////////////////////////////////////////////////////////
	}
	else
	{
		player setVariable ["PlayerReady", 0, false];
		//DATA SYNC BLOCK//////////////////////////////////////////////
		execVM "Local_Scripts\syncPlayerDataSend.sqf"; //Sync player variables to all other machines and server
		///////////////////////////////////////////////////////////////
	};
	sleep 3;
	SpamDelay = false;
};