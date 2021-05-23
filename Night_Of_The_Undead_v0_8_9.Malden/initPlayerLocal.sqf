//Copyright AWD | Dev
systemChat "ArmA3 Zombies Version 0.8.9 P2 | Copyright © - Dev";
systemChat "AWDZ executing local scripts";

private ["_eventHandlerReference","_camera"];

//Set variables to the player's worldspace character
//We need to watch our bandwidth with variable synchronization and client-client/client-host/host-client data transmission
//Main reason for this is because we already have a lot of processing overhead on the host's part for zombie AI
player setVariable ["PlayerName", name player, true]; //This is 1 of 2 ONLY player attached variables that are synced to the network

diag_log "watch here";
//profileNamespace setVariable ["A3DevV3NOTUFirstTime",1];
diag_log (profileNamespace getVariable "A3DevV3NOTUFirstTime");

if (isNil (profileNamespace getVariable "A3DevV3NOTUFirstTime"))
then
{
	player setVariable ["PlayerFirstTime", true, true]; //This is 2 of 2 ONLY player attached variables that are synced to the network
	diag_log "trying to save";
}
else 
{
	player setVariable ["PlayerFirstTime", false, true]; //This is 2 of 2 ONLY player attached variables that are synced to the network
};
player setVariable ["PlayerScore", 500, false];
player setVariable ["PlayerReady", 0, false];
player setVariable ["PlayerRespawnWaiting", false, false];
player setVariable ["VotedKickAgainst", [], false];
player setVariable ["PerkStamina", false, false];
player setVariable ["PerkJuggernaut", false, false];
player setVariable ["PerkPackMule", false, false];
player setVariable ["HasRPG", false, false];
player setVariable ["HasC4", false, false];
player setVariable ["HasFuel", false, false];
player setVariable ["HasPAPWeap", false, false];

//DATA SYNC BLOCK//////////////////////////////////////////////
//When player is initializing, define player's local vars for everyone else. This is the method for defining player variables for new players.
execVM "Local_Scripts\syncPlayerDataSend.sqf"; //Sync player variables to all other machines and server
///////////////////////////////////////////////////////////////
		
//Hide the player and make them invulnerable. We don't make them visible and vulnerable until the game has started and they are ready to play
player allowDamage false; //Executed locally
[[getPlayerUID player,true],"Server_Scripts\serverHidePlayer.sqf"] remoteExec ["execVM",2]; //Executes on server only and uses the hideObjectGlobal command. Boolean argument is to make invisible/visible
player enableFatigue false; //Execute locally

//LGLOBAL VARIABLES - These are variables global to the client, but not synced to/from the network. These variables can be used across client-side scripts and are not confined to the execution scope of any single script
	//-------------\\
	RefreshUI = false;
	LoopSoundState = 0; //0 -> No sound is looping    1 -> Sound is looping   2 -> Issue request to localLoopSound to stop sound loop
	OpenAreasLocal = ["Zone"]; //Variable to store areas that the player has opened, and check public broadcasted variable consistency to prevent race conditions
	SpamDelay = false;
	keyPressDelay = 0;
	Power = false; //The electric power is off by default
	GameOver = false;
	WindowRepairCooldown = 0;
	WindowRepairCount = 0;
	
	//The player does not start with any firearms, they must buy a weapon off the wall if they wish to start with one
	DefaultLoadout = [[],[],[],["U_B_CombatUniform_mcam",[["FirstAidKit",2],["HandGrenade",2,1]]],["V_Chestrig_rgr",[]],["B_Carryall_oli",[]],"H_HelmetSpecB_blk","",[],["","","","","",""]];

	//Will have format ["3ClassType",PAPBoolean,[UnitLoadoutArray],[WeaponsDBEntry],weapon Classname,backpack Inventory,activeMagBulletCount
	PlayerWeaponSlot1 = ["",false,[],[],"",0];
	PlayerWeaponSlot2 = ["",false,[],[],"",0];

//Setup weapons database as it configures LGlobal variable WEAPONSDB
execVM "Local_Scripts\localConfigureWeaponsDatabase.sqf";

//SYNCHRONIZED GLOBAL VARIABLES - These are variables global to the client, and also synced from the network
ServerCurrentRound = -2;
MysteryBoxLocation = 1;
OpenAreas = ["Zone1"];
MaxRound = 0;

//Initialize UI manager now that the required memory elements have been initialized
execVM "Local_Scripts\localUIManager.sqf";

//Start the local Zombie hit detection manager, zombHitM, which is responsible for fast series hit detection and score rewarding
execVM "Local_Scripts\localZombHitMan.sqf";

//Locally add scores for players when they kill a zombie
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
			_killer setVariable ["PlayerScore",((_killer getVariable "PlayerScore") + 50), false]; //This updates player scores locally
		};
	};
}];

//Local set player variables to configuration for spectating. Broadcast his change of playerrespawnwaiting state globally
player addEventHandler ["Killed", 
{
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	if (_unit == player)
	then
	{
		player setPos (getMarkerPos "respawnWait");
		removeAllWeapons player;
		[[getPlayerUID _unit,true],"Server_Scripts\serverHidePlayer.sqf"] remoteExec ["execVM",2]; //Executes on server only
		player allowDamage false;
		player enableFatigue true;
		["Initialize", [player]] call BIS_fnc_EGSpectator;
		player setVariable ["PlayerRespawnWaiting",true,false];
		player setVariable ["PerkStamina", false, false];
		player setVariable ["PerkJuggernaut", false, false];
		player setVariable ["PerkPackMule", false, false];
		player setVariable ["HasPAPWeap", false, false];
		//DATA SYNC BLOCK//////////////////////////////////////////////
		//When player is killed, need to inform all others that he is now waiting to respawn
		execVM "Local_Scripts\syncPlayerDataSend.sqf"; //Sync player variables to all other machines and server
		///////////////////////////////////////////////////////////////
	};
}];

//Disable friendly fire from other players. The player can still hurt themselves
player addEventHandler ["HandleDamage", {
	params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint"];
	if ((faction _source == "BLU_F") || (faction _instigator == "BLU_F"))
	then
	{
		if ((_source == player) || (_instigator == player))
		then
		{
		}
		else
		{0};
	}
	else
	{
	};
}];

execVM "Local_Scripts\localGameManager.sqf";