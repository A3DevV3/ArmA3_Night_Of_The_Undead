private 
[
	"_weapon",
	"_hasWeapon",
	"_purchasePrice",
	"_rearmPrice",
	"_amountToCheck",
	"_params",
	"_money",
	
	
	//This stuff is for weapon system information processing
	"_weaponsDBSize",
	"_weaponDBDataBlock",
	"_weaponSlotDataBlockConstruct",
	"_playerLoadout",
	"_playerLoadoutBackpackBlock",
	"_playerLoadoutBackpackInventory",
	
	"_3ClassType",
	"_PAPBoolean",
	"_UnitLoadoutArrayBlock",
	"_UnitLoadoutArrayBlock2",
	"_WeaponsDBEntry",
	
	"_backPackAmmoPack",
	
	"_addWeaponOrAmmo"
];
_params = _this select 3;
_weapon = _params select 0;
_purchasePrice = _params select 1;
_rearmPrice = _params select 2;

_weaponsDBSize = count WEAPONSDB;
_weaponDBDataBlock = [];

_addWeaponOrAmmo = false;

//Retrieve the weapon-in-question's datablock from  WEAPONSDB
diag_log _weaponsDBSize;
for "_x" from 1 to _weaponsDBSize
do
{
	if (((WEAPONSDB select (_x - 1)) select 1) == _weapon)
	then
	{
		_weaponDBDataBlock append (WEAPONSDB select (_x - 1));
	};
};

diag_log "DEBUG";
diag_log (_weaponDBDataBlock select 7);
_3ClassType = (_weaponDBDataBlock select 7);
_PAPBoolean = false;
_UnitLoadoutArrayBlock = [];
_UnitLoadoutArrayBlock append [_weapon,"","",""];
_UnitLoadoutArrayBlock2 = [];
_UnitLoadoutArrayBlock2 pushBack [(_weaponDBDataBlock select 2),(_weaponDBDataBlock select 4)];
_UnitLoadoutArrayBlock append _UnitLoadoutArrayBlock2;
_UnitLoadoutArrayBlock pushBack [];
_UnitLoadoutArrayBlock append [""];

diag_log "Build block";
diag_log _UnitLoadoutArrayBlock;


//Construct the weaponSlotDataBlock - this is used by NOTU systems
//format is ["3ClassType",PAPBoolean,[UnitLoadoutArrayBlock],[WeaponsDBEntry],weaponClassname,weaponSlotBackpackData
_weaponSlotDataBlockConstruct = [];
_weaponSlotDataBlockConstruct append [_3ClassType]; //0
_weaponSlotDataBlockConstruct append [_PAPBoolean]; //1
_weaponSlotDataBlockConstruct pushBack _UnitLoadoutArrayBlock; //2

//Pack mule perk patch
if (player getVariable "PerkPackMule")
then
{
	_weaponDBDataBlock set [3,(_weaponDBDataBlock select 8)];
};

_weaponSlotDataBlockConstruct pushBack _weaponDBDataBlock;//3
_weaponSlotDataBlockConstruct append [_weapon]; //4
_weaponSlotDataBlockConstruct pushBack []; //5
_weaponSlotDataBlockConstruct pushBack []; //6 - This is for A3 weapon slot information

diag_log "_weaponSlotDataBlockConstruct";
diag_log _weaponSlotDataBlockConstruct;


//Unpack the players loadout information
_playerLoadout = getUnitLoadout player;
_playerLoadoutBackpackBlock = _playerLoadout select 5;
_playerLoadoutBackpackInventory = _playerLoadoutBackpackBlock select 2;

//Used for debug
//PlayerWeaponSlot1 = ["",false,[],[]];

diag_log "_weapon";
diag_log _weapon;
diag_log PlayerWeaponSlot1;
diag_log PlayerWeaponSlot2;

//Patch to fix potential issues with players not having a weapon and not being able to get one
if ((currentWeapon player) == "")
then
{
	PlayerWeaponSlot1 = ["",false,[],[],"",0];
	PlayerWeaponSlot2 = ["",false,[],[],"",0];
	
	//Run twice to make sure because if this does not work, then game is unplayable for the player.
	PlayerWeaponSlot1 = ["",false,[],[],"",0];
	PlayerWeaponSlot2 = ["",false,[],[],"",0];
};

if (((PlayerWeaponSlot1 select 4) == _weapon) || ((PlayerWeaponSlot2 select 4) == _weapon))
then
{
	//If player has the weapon in question and has it active, then assume its because they want to purchase ammo
	if ((currentWeapon player) == _weapon)
	then
	{
		_amountToCheck = _rearmPrice;
		if ((player getVariable "PlayerScore") > (_amountToCheck - 1)) //If player has the money
		then
		{
			_money = (player getVariable "PlayerScore") - _amountToCheck;
			player setVariable ["PlayerScore",_money,false];
			//When player is killed, need to inform all others that he is now waiting to respawn
			execVM "Local_Scripts\syncPlayerDataSend.sqf"; //Sync player variables to all other machines and server
			///////////////////////////////////////////////////////////////
			_addWeaponOrAmmo = true;
		}
		else
		{
			hint "Not enough money to rearm";
		};
	}
	else
	{
		hint "You already have this weapon | If you want to rearm it, it must be your active weapon";
	};
}
else //Otherwise assume its because they want to buy it
{
	_amountToCheck = _purchasePrice;
	if ((player getVariable "PlayerScore") > (_amountToCheck - 1)) //If player has the money
	then
	{
		_money = (player getVariable "PlayerScore") - _amountToCheck;
		player setVariable ["PlayerScore",_money,false];
		//When player is killed, need to inform all others that he is now waiting to respawn
		execVM "Local_Scripts\syncPlayerDataSend.sqf"; //Sync player variables to all other machines and server
		///////////////////////////////////////////////////////////////
		_addWeaponOrAmmo = true;
	}
	else
	{
		hint "Not enough money to buy";
	};
};


if (_addWeaponOrAmmo)
then
{
	//Returns true if the player has the weapon.
	//This means they're rearming it
	if (((PlayerWeaponSlot1 select 4) == _weapon) || ((PlayerWeaponSlot2 select 4) == _weapon))
	then
	{
		//Only rearm the weapon if it is in the active weapon slot, i.e the player has it out
		if ((currentWeapon player) == _weapon)
		then
		{
			if ((PlayerWeaponSlot1 select 4) == _weapon)
			then
			{
				PlayerWeaponSlot1 = [];
				PlayerWeaponSlot1 append _weaponSlotDataBlockConstruct;

				_playerLoadout = getUnitLoadout player;
				switch (PlayerWeaponSlot1 select 0) do 
				{
					case "Primary": 	{_playerLoadout set [0, (_weaponSlotDataBlockConstruct select 2)]};
					case "Launcher":	{_playerLoadout set [1, (_weaponSlotDataBlockConstruct select 2)]};
					case "Sidearm": 	{_playerLoadout set [2, (_weaponSlotDataBlockConstruct select 2)]};
					default 			{};
				};
				
				//Clear the players backpack
				(_playerLoadout select 5) set [1,[]];
				
				//Assemble an array with the mag type, # of mags, and # of rounds per mag.
				_backPackAmmoPack = [];
				_backPackAmmoPack  append [(_weaponDBDataBlock select 2)];
				_backPackAmmoPack  append [(_weaponDBDataBlock select 3)];
				_backPackAmmoPack  append [(_weaponDBDataBlock select 4)];
				
				//Insert the array into the players loadout
				((_playerLoadout select 5) select 1) pushBack _backPackAmmoPack;
				player setUnitLoadout _playerLoadout;
				
				//Patch for player not automatically equipped launchers
				if ((PlayerWeaponSlot1 select 0) == "Launcher")
				then
				{
					player selectWeapon _weapon;
				};
			};
			if ((PlayerWeaponSlot2 select 4) == _weapon)
			then
			{
				PlayerWeaponSlot2 = [];
				PlayerWeaponSlot2 append _weaponSlotDataBlockConstruct;

				_playerLoadout = getUnitLoadout player;
				switch (PlayerWeaponSlot2 select 0) do 
				{
					case "Primary": 	{_playerLoadout set [0, (_weaponSlotDataBlockConstruct select 2)]};
					case "Launcher":	{_playerLoadout set [1, (_weaponSlotDataBlockConstruct select 2)]};
					case "Sidearm": 	{_playerLoadout set [2, (_weaponSlotDataBlockConstruct select 2)]};
					default 			{};
				};
				
				//Clear the players backpack
				(_playerLoadout select 5) set [1,[]];
				
				//Assemble an array with the mag type, # of mags, and # of rounds per mag.
				_backPackAmmoPack = [];
				_backPackAmmoPack  append [(_weaponDBDataBlock select 2)];
				_backPackAmmoPack  append [(_weaponDBDataBlock select 3)];
				_backPackAmmoPack  append [(_weaponDBDataBlock select 4)];
				
				//Insert the NEW backpack ammo array into the players loadout
				((_playerLoadout select 5) select 1) pushBack _backPackAmmoPack;
				player setUnitLoadout _playerLoadout;
				
				//Patch for player not automatically equipping launchers
				if ((PlayerWeaponSlot2 select 0) == "Launcher")
				then
				{
					player selectWeapon _weapon;
				};
			};
		};
	}
	else
	{
		//The player does not have the weapon, it needs to be added
		//There are 3 major cases that can follow
		//Case 1: The player has no weapon and the weapon should be added to the first slot
		//Case 2: The player has a weapon in slot 1 and thus add it to slot 2
		//Case 3: the player has a weapon in both slots and thus add the weapon to the current slot, replacing the active weapon
		//For this case, use currentWeapon player to detect what slot is active
		//Case 1
		if ((currentWeapon player) == "") //Player has no weapon, add the weapon to slot 1. We can assume this because
		then							  //the player must have a weapon active if either weapon slot is filled
		{
			PlayerWeaponSlot1 = [];
			PlayerWeaponSlot1 append _weaponSlotDataBlockConstruct;
			
			_playerLoadout = getUnitLoadout player;
			
			//Set the weapon array information to the correct slot in player loadout, depending on if its a primary/launcher/sidearm
			switch (PlayerWeaponSlot1 select 0) do 
			{
				case "Primary": 	{_playerLoadout set [0, (_weaponSlotDataBlockConstruct select 2)]};
				case "Launcher":	{_playerLoadout set [1, (_weaponSlotDataBlockConstruct select 2)]};
				case "Sidearm": 	{_playerLoadout set [2, (_weaponSlotDataBlockConstruct select 2)]};
				default 			{};
			};
			
			//Clear the players backpack
			(_playerLoadout select 5) set [1,[]];
			
			//Assemble an array with the mag type, # of mags, and # of rounds per mag.
			_backPackAmmoPack = [];
			_backPackAmmoPack  append [(_weaponDBDataBlock select 2)];
			_backPackAmmoPack  append [(_weaponDBDataBlock select 3)];
			_backPackAmmoPack  append [(_weaponDBDataBlock select 4)];
			
			//Insert the NEW backpack ammo array into the players loadout
			((_playerLoadout select 5) select 1) pushBack _backPackAmmoPack;
			player setUnitLoadout _playerLoadout;
			
			//Patch for player not automatically equipping launchers
			if ((PlayerWeaponSlot1 select 0) == "Launcher")
			then
			{
				player selectWeapon _weapon;
			};
		}
		else //Otherwise the player has a weapon in a slot, check if slot 2 is empty, and if it is, put it there
		{
			if ((PlayerWeaponSlot2 select 4) == "") //Returns true if the second slot is empty
			then
			{
				PlayerWeaponSlot2 = [];
				PlayerWeaponSlot2 append _weaponSlotDataBlockConstruct;
				
				_playerLoadout = getUnitLoadout player;
				
				//Store the first weapon slot A3 weapon slot information as we'll be automatically switching the player to weaponslot2. A3 weapon slot info goes in element 6 (first index 0) of the weapon slot array
				switch (PlayerWeaponSlot1 select 0) do 
				{
					case "Primary": 	{PlayerWeaponSlot1 set [6,(_playerLoadout select 0)]; diag_log (_playerLoadout select 0);};
					case "Launcher":	{PlayerWeaponSlot1 set [6,(_playerLoadout select 1)]; diag_log (_playerLoadout select 1);};
					case "Sidearm": 	{PlayerWeaponSlot1 set [6,(_playerLoadout select 2)]; diag_log (_playerLoadout select 2);};
					default 			{};
				};
				
				//Now that the A3 weapon slot info has been stored into the weapon slot, we can remove the active weapon via removeWeapon, then reload the players loadout now with the A3 slot info emtpy
				player removeWeapon (currentWeapon player);
				_playerLoadout = getUnitLoadout player;
				
				//Assign the generated A3 weapon slot array based off the argued weapon classname into the correct position in the players loadout array | which is index 0,1, or 2 depending on primary/launcher/sidearm
				switch (PlayerWeaponSlot2 select 0) do 
				{
					case "Primary": 	{_playerLoadout set [0, (_weaponSlotDataBlockConstruct select 2)]; diag_log (_weaponSlotDataBlockConstruct select 2);};
					case "Launcher":	{_playerLoadout set [1, (_weaponSlotDataBlockConstruct select 2)]; diag_log (_weaponSlotDataBlockConstruct select 2);};
					case "Sidearm": 	{_playerLoadout set [2, (_weaponSlotDataBlockConstruct select 2)]; diag_log (_weaponSlotDataBlockConstruct select 2);};
					default 			{};
				};
				
				//Store the first weapon backpack ammo array into PlayerWeaponSlot1 so that when the player switches back to it they'll have the correct ammo information
				PlayerWeaponSlot1 set [5, ((_playerLoadout select 5) select 1)];
				
				//Now we can clear the players backpack
				(_playerLoadout select 5) set [1,[]];
				
				//Assemble an array with the mag type, # of mags, and # of rounds per mag.
				_backPackAmmoPack = [];
				_backPackAmmoPack  append [(_weaponDBDataBlock select 2)];
				_backPackAmmoPack  append [(_weaponDBDataBlock select 3)];
				_backPackAmmoPack  append [(_weaponDBDataBlock select 4)];
				
				//Insert the NEW backpack ammo array into the players loadout
				((_playerLoadout select 5) select 1) pushBack _backPackAmmoPack;
				
				player setUnitLoadout _playerLoadout;
				
				//Patch for player not automatically equipping launchers
				if ((PlayerWeaponSlot2 select 0) == "Launcher")
				then
				{
					player selectWeapon _weapon;
				};
			}
			else //THIS MEANS PLAYER HAS A WEAPON IN BOTH SLOTS. WE NOW REPLACE THE DATA FOR THE ACTIVE SLOT
			{
				//IF THE PLAYERS CURRENT WEAPON IS THAT OF SLOT 1, REPLACE SLOT 1
				//We do not need to store the slot information since the player is getting a new weapon
				if ((currentWeapon player) == (PlayerWeaponSlot1 select 4))
				then
				{;
					PlayerWeaponSlot1 = [];
					PlayerWeaponSlot1 append _weaponSlotDataBlockConstruct;
					
					//Remove the A3 weapon slot information from the unit loadout array by using removeWeapon first
					player removeWeapon (currentWeapon player);
					_playerLoadout = getUnitLoadout player;
					
					//Set the weapon array information to the correct slot in player loadout, depending on if its a primary/launcher/sidearm
					switch (PlayerWeaponSlot1 select 0) do 
					{
						case "Primary": 	{_playerLoadout set [0, (_weaponSlotDataBlockConstruct select 2)]};
						case "Launcher":	{_playerLoadout set [1, (_weaponSlotDataBlockConstruct select 2)]};
						case "Sidearm": 	{_playerLoadout set [2, (_weaponSlotDataBlockConstruct select 2)]};
						default 			{};
					};
					
					//Now we clear the players backpack
					(_playerLoadout select 5) set [1,[]];
					
					//Assemble an array with the mag type, # of mags, and # of rounds per mag.
					_backPackAmmoPack = [];
					_backPackAmmoPack  append [(_weaponDBDataBlock select 2)];
					_backPackAmmoPack  append [(_weaponDBDataBlock select 3)];
					_backPackAmmoPack  append [(_weaponDBDataBlock select 4)];
					
					//Insert the NEW backpack ammo array into the players loadout
					((_playerLoadout select 5) select 1) pushBack _backPackAmmoPack;
					
					player setUnitLoadout _playerLoadout;
					
					//Patch for player not automatically equipping launchers
					if ((PlayerWeaponSlot1 select 0) == "Launcher")
					then
					{
						player selectWeapon _weapon;
					};
				}
				else //OTHERWISE PLAYERS CURRENT WEAPON IS THAT OF SLOT 2, REPLACE SLOT 2
				{
					PlayerWeaponSlot2 = [];
					PlayerWeaponSlot2 append _weaponSlotDataBlockConstruct;
					
					//Remove the A3 weapon slot information from the unit loadout array by using removeWeapon first
					player removeWeapon (currentWeapon player);
					_playerLoadout = getUnitLoadout player;
					
					//Set the weapon array information to the correct slot in player loadout, depending on if its a primary/launcher/sidearm
					switch (PlayerWeaponSlot2 select 0) do 
					{
						case "Primary": 	{_playerLoadout set [0, (_weaponSlotDataBlockConstruct select 2)]};
						case "Launcher":	{_playerLoadout set [1, (_weaponSlotDataBlockConstruct select 2)]};
						case "Sidearm": 	{_playerLoadout set [2, (_weaponSlotDataBlockConstruct select 2)]};
						default 			{};
					};
					
					//Now we clear the players backpack
					(_playerLoadout select 5) set [1,[]];
					
					//Assemble an array with the mag type, # of mags, and # of rounds per mag.
					_backPackAmmoPack = [];
					_backPackAmmoPack  append [(_weaponDBDataBlock select 2)];
					_backPackAmmoPack  append [(_weaponDBDataBlock select 3)];
					_backPackAmmoPack  append [(_weaponDBDataBlock select 4)];
					
					//Insert the NEW backpack ammo array into the players loadout
					((_playerLoadout select 5) select 1) pushBack _backPackAmmoPack;
					
					player setUnitLoadout _playerLoadout;
					
					//Patch for player not automatically equipping launchers
					if ((PlayerWeaponSlot2 select 0) == "Launcher")
					then
					{
						player selectWeapon _weapon;
					};
				};
			};
		};

			diag_log "Player weapon slots";
			diag_log PlayerWeaponSlot1;
			diag_log PlayerWeaponSlot2;
	};
};