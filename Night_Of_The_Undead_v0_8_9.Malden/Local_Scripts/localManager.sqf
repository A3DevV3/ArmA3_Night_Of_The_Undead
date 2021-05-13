private [

	"_respawnWaiting",
	"_overlay",
	"_text",
	"_previousRound",
	"_playerUniform",
	"_playerVestData",
	"_playerBackpackData",
	"_playerLoadout",
	"_firstStart",
	"_pointsPerKill",
	"_keyDownEH",
	"_spawnMoney"

];


_previousRound = 0;
_respawnWaiting = false;
_firstStart = true;
VARIABLE = 0;
execVM "Local_Scripts\localInventoryDialogDisabler.sqf";
execVM "Local_Scripts\localRepairWindowMonitor.sqf";

//Set the player's loadout to the default loadout. The default loadout has 2 grenades and 2 FAKs
player setUnitLoadout DefaultLoadout;

waitUntil {ServerCurrentRound > 0};

//Add the event handler to allow players to switch their weapons
_keyDownEH = findDisplay 46 displayAddEventHandler ["KeyDown", "[_this] execVM 'local_Scripts\localPlayerSwitchWeapon.sqf';"];

while {((ServerCurrentRound > 0) && (!(GameOver)))}
do
{	
	//Patch for window repair cooldown
	if (!(WindowRepairCooldown == 0))
	then
	{
		WindowRepairCooldown = WindowRepairCooldown - 1;
		if (WindowRepairCooldown == 0)
		then
		{
			if (WindowRepairCount == 5)
			then
			{
				WindowRepairCount = 0;
			};
		};
	}
	else
	{
	};
	if (!(_previousRound == ServerCurrentRound))
	then
	{
		_previousRound = ServerCurrentRound;
		if (ServerCurrentRound == 1)
		then
		{
			[3] execVM "Local_Scripts\localPlaySound.sqf";
		}
		else
		{
			[2] execVM "Local_Scripts\localPlaySound.sqf";
		};
	
		if (player getVariable "PlayerRespawnWaiting")
		then
		{
			player setVariable ["PlayerRespawnWaiting",false,false];
			if ((player getVariable "PlayerScore") < 250)
			then
			{
				player setVariable ["PlayerScore", (150 + (100*ServerCurrentRound)), false];
			};
			//DATA SYNC BLOCK//////////////////////////////////////////////
			execVM "Local_Scripts\syncPlayerDataSend.sqf"; //Sync player variables to all other machines and server
			///////////////////////////////////////////////////////////////
			["Terminate"] call BIS_fnc_EGSpectator;
			player allowDamage true;
			player enableFatigue true;
			[[getPlayerUID player,false],"Server_Scripts\serverHidePlayer.sqf"] remoteExec ["execVM",2]; //Executes on server only
			
			//Clear the players weapon slots
			PlayerWeaponSlot1 = ["",false,[],[],"",0];
			PlayerWeaponSlot2 = ["",false,[],[],"",0];
			
			//Set the player's loadout to the default loadout. The default loadout has 2 grenades and 2 FAKs
			player setUnitLoadout DefaultLoadout;
		};
		
		//Add up to 2 first aid kits and up to 2 grenades to the players inventory
		_playerUniform = uniform player;
		removeUniform player;
		player addUniform _playerUniform;
		_playerBackpackData = (getUnitLoadout player) select 5;
		_playerVestData = (getUnitLoadout player) select 4;
		removeVest player;
		removeBackpack player;
		player addItem "FirstAidKit";
		player addItem "FirstAidKit";
		player addMagazine "HandGrenade";
		player addMagazine "HandGrenade";
		_playerLoadout = (getUnitLoadout player);
		_playerLoadout set [5,_playerBackpackData];
		_playerLoadout set [4,_playerVestData];
		player setUnitLoadout _playerLoadout;
		
		
		uiNamespace getVariable "Overlay" displayCtrl 21 ctrlSetTextColor [1, 1, 1, 1];
		uiNamespace getVariable "Overlay" displayCtrl 21 ctrlSetText format ["Round: %1",ServerCurrentRound];
		uiNamespace getVariable "Overlay" displayCtrl 21 ctrlShow false;
		sleep 1;
		uiNamespace getVariable "Overlay" displayCtrl 21 ctrlShow true;
		sleep 1;
		uiNamespace getVariable "Overlay" displayCtrl 21 ctrlShow false;
		sleep 1;
		uiNamespace getVariable "Overlay" displayCtrl 21 ctrlShow true;
		sleep 1;
		uiNamespace getVariable "Overlay" displayCtrl 21 ctrlShow false;
		sleep 1;
		uiNamespace getVariable "Overlay" displayCtrl 21 ctrlShow true;
		sleep 1;
		uiNamespace getVariable "Overlay" displayCtrl 21 ctrlShow false;
		sleep 1;
		uiNamespace getVariable "Overlay" displayCtrl 21 ctrlShow true;
		sleep 1;
		uiNamespace getVariable "Overlay" displayCtrl 21 ctrlShow false;
		sleep 1;
		uiNamespace getVariable "Overlay" displayCtrl 21 ctrlShow true;
		sleep 1;
		uiNamespace getVariable "Overlay" displayCtrl 21 ctrlShow false;
		sleep 1;
		uiNamespace getVariable "Overlay" displayCtrl 21 ctrlShow true;
		uiNamespace getVariable "Overlay" displayCtrl 21 ctrlSetTextColor [1, 0, 0, 1];
	};
	
	sleep 0.1;
};