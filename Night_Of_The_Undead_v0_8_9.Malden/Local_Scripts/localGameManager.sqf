//Local Game manager
while {!((player getVariable "PlayerReady") == 5)}
do
{
    //Check if game is in progress or if player is ready, if not, setup lobby interface, otherwise, configure player to play
    if ((player getVariable "PlayerReady") < 2)
    then
    {
        //Create and setup a camera at first scene position
        LOCALCAMERA = "camera" camCreate getPos MenuCam1Pos1;
        LOCALCAMERA cameraEffect ["internal", "BACK"];
        LOCALCAMERA camSetTarget getPos MenuCam1Tar1;	
        
        //Set sound loop state flag to 1 (a sound is looping) and run the sound loop script
        LoopSoundState = 1;
        [1] execVM "Local_Scripts\localLoopSound.sqf";
        
        //Loop until player is ready or the game is started
        while {((player getVariable "PlayerReady") < 2)}
        do
        {
			if ((player getVariable "PlayerReady") < 2)
			then
			{
				LOCALCAMERA cameraEffect ["internal", "BACK"];
				LOCALCAMERA camSetTarget getPos MenuCam1Tar1;
				LOCALCAMERA camSetPos getPos MenuCam1Pos1;
				LOCALCAMERA camCommit 0;
				LOCALCAMERA camPreparePos getPos MenuCam1Pos2;
				LOCALCAMERA camCommitPrepared 10;
				RefreshUI = true;
				sleep 10;
			};
			//Game is in progress and player is JIP
			if (((player getVariable "PlayerReady") == 1) && ServerCurrentRound > 0)
			then
			{
				player setVariable ["PlayerReady",4,false];
			};
            
			if ((player getVariable "PlayerReady") < 2)
			then
			{
				LOCALCAMERA cameraEffect ["internal", "BACK"];
				LOCALCAMERA camSetTarget getPos MenuCam2Tar1;
				LOCALCAMERA camSetPos getPos MenuCam2Pos1;
				LOCALCAMERA camCommit 0;
				LOCALCAMERA camPreparePos getPos MenuCam2Pos2;
				LOCALCAMERA camCommitPrepared 10;
				RefreshUI = true;
				sleep 10;
            };
			//Game is in progress and player is JIP
			if (((player getVariable "PlayerReady") == 1) && ServerCurrentRound > 0)
			then
			{
				player setVariable ["PlayerReady",4,false];
			};
			
			if ((player getVariable "PlayerReady") < 2)
			then
			{
				LOCALCAMERA cameraEffect ["internal", "BACK"];
				LOCALCAMERA camSetTarget getPos MenuCam3Tar1;
				LOCALCAMERA camSetPos getPos MenuCam3Pos1;
				LOCALCAMERA camCommit 0;
				LOCALCAMERA camPreparePos getPos MenuCam3Pos2;
				LOCALCAMERA camCommitPrepared 10;
				RefreshUI = true;
				sleep 10;
			};
			//Game is in progress and player is JIP
			if (((player getVariable "PlayerReady") == 1) && ServerCurrentRound > 0)
			then
			{
				player setVariable ["PlayerReady",4,false];
			};
        };
    };
	
	//If player state is 2 and SCR is -1
	//Game is being started and this player will play the cutscene
	if (((ServerCurrentRound > -2) && ((player getVariable "PlayerReady") == 2)) && (!(ServerCurrentRound > -1)))
	then
	{
		//systemChat "Block 1 run";
		closeDialog 2;
		cutRsc ["GUI1000", "PLAIN"];
		titleCut ["", "BLACK OUT", 4];
		sleep 5;
		execVM "Local_Scripts\localTurnOffLights.sqf";
		player setVariable ["PlayerReady",3,false];
		//DATA SYNC BLOCK//////////////////////////////////////////////
		execVM "Local_Scripts\syncPlayerDataSend.sqf"; //Sync player variables to all other machines and server
		///////////////////////////////////////////////////////////////
		[format ["%1 awaiting intro",name player],"Local_Scripts\localSystemChat.sqf"] remoteExec ["execVM",0];
		LoopSoundState = 2;
	};
	
	//SCR is either -1, which means the server is waiting for state 2 players to report state 3, and player state is 1, set them to 4, they missed the server catch to be shown intro
	if (((ServerCurrentRound > -2) && ((player getVariable "PlayerReady") == 1)) && (!(ServerCurrentRound > -1)))
	then
	{
		//systemChat "Block 2 run";
		closeDialog 2;
		cutRsc ["GUI1000", "PLAIN"];
		titleCut ["", "BLACK OUT", 1];
		player setVariable ["PlayerReady",3,false];
		execVM "Local_Scripts\localTurnOffLights.sqf";
		//DATA SYNC BLOCK//////////////////////////////////////////////
		execVM "Local_Scripts\syncPlayerDataSend.sqf"; //Sync player variables to all other machines and server
		///////////////////////////////////////////////////////////////
		LoadIcon = true;
		execVM "Local_Scripts\localLoadingIcon.sqf";
		systemChat "The intro is currently being shown to other players. Please wait";
		LoopSoundState = 2;
	};
	
	/*
	if ((player getVariable "PlayerReady") == 4)
	then
	{
		waitUntil {ServerCurrentRound == 1};
		player setVariable ["PlayerReady", 5, false];
		//DATA SYNC BLOCK//////////////////////////////////////////////
		execVM "Local_Scripts\syncPlayerDataSend.sqf"; //Sync player variables to all other machines and server
		///////////////////////////////////////////////////////////////
		LOCALCAMERA cameraEffect ["terminate","back"];
		camDestroy LOCALCAMERA;
		closeDialog 2;
		cutRsc ["GUI1000", "PLAIN"];
		LoopSoundState = 2;
		LoadIcon = false;
		execVM "Local_Scripts\localManager.sqf";
		[[getPlayerUID player,false],"Server_Scripts\serverHidePlayer.sqf"] remoteExec ["execVM",2]; //Executes on server only
		player allowDamage true;
	};
	*/
	
	//Game has started some time ago and this player missed the intro sequence. Load them in straight away
	if (((ServerCurrentRound > 0) && ((player getVariable "PlayerReady") > 0)) && ((player getVariable "PlayerReady") < 5))
	then
	{
		closeDialog 2;
		cutRsc ["GUI1000", "PLAIN"];
		LOCALCAMERA cameraEffect ["terminate","back"];
		camDestroy LOCALCAMERA;
		player setVariable ["PlayerReady",5,false];
		player setVariable ["PlayerScore", (150 + (100*ServerCurrentRound)), false];
		//DATA SYNC BLOCK//////////////////////////////////////////////
		execVM "Local_Scripts\syncPlayerDataSend.sqf"; //Sync player variables to all other machines and server
		///////////////////////////////////////////////////////////////
		[format ["Player %1 loaded in",name player],"Local_Scripts\localSystemChat.sqf"] remoteExec ["execVM",0];
		LoopSoundState = 2;
		LoadIcon = false;
		execVM "Local_Scripts\localManager.sqf";
		[[getPlayerUID player,false],"Server_Scripts\serverHidePlayer.sqf"] remoteExec ["execVM",2]; //Executes on server only
		player allowDamage true;
		player enableFatigue true;
	};
	sleep 1.5;
};
//systemChat "LocalGameManager exit";