private 
[
	"_perk",
	"_purchasePrice",
	"_money",
	"_weapon",
	"_hasWeapon",
	"_rearmPrice",
	"_amountToCheck",
	"_params",
	
	
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
_perk = _params select 0;
_purchasePrice = _params select 1;

if (Power)
then
{
	if 	((currentWeapon player) == "")
	then
	{
		hint "You don't have a weapon to Pack-A-Punch!";
	}
	else
	{
		if ((player getVariable "PlayerScore") > (_purchasePrice - 1)) //If player has the money
		then
		{	
			//PAP the players primary weapon
			_weaponsDBSize = count WEAPONSDB;
			_weaponDBDataBlock = [];
			
			//Get the players current weapon
			_weapon = currentWeapon player;
			
			//Using the players current weapon classname, load the respective weapon block data from the weapon DB
			for "_x" from 1 to _weaponsDBSize
			do
			{
				if (((WEAPONSDB select (_x - 1)) select 1) == _weapon)
				then
				{
					_weaponDBDataBlock append (WEAPONSDB select (_x - 1));
				};
			};
			
			_3ClassType = (_weaponDBDataBlock select 7);
			_PAPBoolean = true;
			_UnitLoadoutArrayBlock = [];
			_UnitLoadoutArrayBlock append [_weapon,"","",""];
			_UnitLoadoutArrayBlock2 = [];
			//(_weaponDBDataBlock select 5) loads PAP ammo into the weapons clip
			_UnitLoadoutArrayBlock2 pushBack [(_weaponDBDataBlock select 5),(_weaponDBDataBlock select 4)];
			_UnitLoadoutArrayBlock append _UnitLoadoutArrayBlock2;
			_UnitLoadoutArrayBlock pushBack [];
			_UnitLoadoutArrayBlock append [""];
			
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
			
			//Unpack the players loadout information
			_playerLoadout = getUnitLoadout player;
			_playerLoadoutBackpackBlock = _playerLoadout select 5;
			_playerLoadoutBackpackInventory = _playerLoadoutBackpackBlock select 2;
			
				if ((currentWeapon player) == (PlayerWeaponSlot1 select 4))
				then
				{
					if (!(PlayerWeaponSlot1 select 1))
					then
					{
						_money = (player getVariable "PlayerScore") - _purchasePrice;
						player setVariable ["PlayerScore",_money,false];
						//When player is killed, need to inform all others that he is now waiting to respawn
						execVM "Local_Scripts\syncPlayerDataSend.sqf"; //Sync player variables to all other machines and server
						///////////////////////////////////////////////////////////////
						player enableStamina false;
						hint "You have Pack-A-Punched your active weapon!";
						
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
						_backPackAmmoPack  append [(_weaponDBDataBlock select 5)]; //Load PAP ammo instead of standard ammo
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
						
						player setVariable ["HasPAPWeap", true, false];

						//DATA SYNC BLOCK//////////////////////////////////////////////
						//When player is initializing, define player vars for everyone else
						execVM "Local_Scripts\syncPlayerDataSend.sqf"; //Sync player variables to all other machines and server
						///////////////////////////////////////////////////////////////
					}
					else
					{
						hint "You have already Pack-A-Punched this weapon";
					};
				};
				if ((currentWeapon player) == (PlayerWeaponSlot2 select 4))
				then
				{
					if (!(PlayerWeaponSlot2 select 1))
					then
					{
						_money = (player getVariable "PlayerScore") - _purchasePrice;
						player setVariable ["PlayerScore",_money,false];
						//When player is killed, need to inform all others that he is now waiting to respawn
						execVM "Local_Scripts\syncPlayerDataSend.sqf"; //Sync player variables to all other machines and server
						///////////////////////////////////////////////////////////////
						player enableStamina false;
						hint "You have Pack-A-Punched your active weapon!";
						
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
						_backPackAmmoPack  append [(_weaponDBDataBlock select 5)]; //Load PAP ammo instead of standard ammo
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
						
						player setVariable ["HasPAPWeap", true, false];

						//DATA SYNC BLOCK//////////////////////////////////////////////
						//When player is initializing, define player vars for everyone else
						execVM "Local_Scripts\syncPlayerDataSend.sqf"; //Sync player variables to all other machines and server
						///////////////////////////////////////////////////////////////
					}
					else
					{
						hint "You have already Pack-A-Punched this weapon";
					};
				};
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
		}
		else
		{
			hint "Not enough money to Pack-A-Punch";
		};
	};
}
else
{
	hint "You must turn on the power first!";
};