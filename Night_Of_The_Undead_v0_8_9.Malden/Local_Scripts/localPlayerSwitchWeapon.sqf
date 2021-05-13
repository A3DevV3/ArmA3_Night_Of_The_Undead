private ["_playerLoadout"];
if (keyPressDelay == 0)
then
{
	keyPressDelay = 1;
	//If the player presses the primary weapon key
	if (((_this select 0) select 1) == 2)
	then
	{
		//If the players current weapon is in slot 1
		if ((currentWeapon player) == (PlayerWeaponSlot1 select 4))
		then
		{
			//If the player has a primary weapon in slot 2, then switch the players weapon to that in slot 2
			if ((PlayerWeaponSlot2 select 0) == "Primary")
			then
			{
				_playerLoadout = getUnitLoadout player;
				
				//Store the A3 weapon slot array to the correct index in the WeaponSlotArray depending on whether it is a primary/launcher/sidearm
				switch (PlayerWeaponSlot1 select 0) do 
				{
					case "Primary": 	{PlayerWeaponSlot1 set [6,(_playerLoadout select 0)]};
					case "Launcher":	{PlayerWeaponSlot1 set [6,(_playerLoadout select 1)]};
					case "Sidearm": 	{PlayerWeaponSlot1 set [6,(_playerLoadout select 2)]};
					default 			{};
				};
				
				//Re-load the players loadout, but this time with the weapon-to-be-removed removed
				player removeWeapon (currentWeapon player);
				_playerLoadout = getUnitLoadout player;
						
				//Now we can take the A3 weapon slot array from the WeaponSlot to be switched to and put it into the correct index in the players loadout
				_playerLoadout set [0, (PlayerWeaponSlot2 select 6)];
				
				//Store the weapon-to-be-switched-from's backpack ammo in the weaponslot-to-be-switched-from
				PlayerWeaponSlot1 set [5, ((_playerLoadout select 5) select 1)];
				
				//Now we clear the players backpack
				(_playerLoadout select 5) set [1,[]];
				
				//Insert the backpack ammo array from PlayerWeaponSlot2 into the players loadout. Remember that the player has a primary in both slots 1 and 2
				(_playerLoadout select 5) set [1,(PlayerWeaponSlot2 select 5)];
				
				player setUnitLoadout _playerLoadout;
				
				//Patch for PAP weapon detection
				if (PlayerWeaponSlot2 select 1)
				then
				{
					player setVariable ["HasPAPWeap", true, false];
					//DATA SYNC BLOCK//////////////////////////////////////////////
					//When player is initializing, define player vars for everyone else
					execVM "Local_Scripts\syncPlayerDataSend.sqf"; //Sync player variables to all other machines and server
					///////////////////////////////////////////////////////////////
				}
				else
				{
					player setVariable ["HasPAPWeap", false, false];
					//DATA SYNC BLOCK//////////////////////////////////////////////
					//When player is initializing, define player vars for everyone else
					execVM "Local_Scripts\syncPlayerDataSend.sqf"; //Sync player variables to all other machines and server
					///////////////////////////////////////////////////////////////
				};
			};
		}
		else //If the players current weapon is in slot 2
		{
			//If the player has a primary weapon in slot 1, then switch the players weapon to that in slot 1
			if ((PlayerWeaponSlot1 select 0) == "Primary")
			then
			{
				_playerLoadout = getUnitLoadout player;
				
				//Store the A3 weapon slot array to the correct index in the WeaponSlotArray depending on whether it is a primary/launcher/sidearm
				switch (PlayerWeaponSlot2 select 0) do 
				{
					case "Primary": 	{PlayerWeaponSlot2 set [6,(_playerLoadout select 0)]};
					case "Launcher":	{PlayerWeaponSlot2 set [6,(_playerLoadout select 1)]};
					case "Sidearm": 	{PlayerWeaponSlot2 set [6,(_playerLoadout select 2)]};
					default 			{};
				};
				
				
				//Reload the players loadout, but this time with the weapon-to-be-removed removed
				player removeWeapon (currentWeapon player);
				_playerLoadout = getUnitLoadout player;
				
				//Now we can take the A3 weapon slot array from the WeaponSlot to be switched to and put it into the correct index in the players loadout
				_playerLoadout set [0, (PlayerWeaponSlot1 select 6)];
				
				//Store the weapon-to-be-switched-from's backpack ammo in the weaponslot-to-be-switched-from
				PlayerWeaponSlot2 set [5, ((_playerLoadout select 5) select 1)];
				
				//Now we clear the players backpack
				(_playerLoadout select 5) set [1,[]];
				
				//Insert the backpack ammo array from PlayerWeaponSlot1 into the players loadout. Remember that the player has a primary in both slots 1 and 2
				(_playerLoadout select 5) set [1,(PlayerWeaponSlot1 select 5)];
				
				player setUnitLoadout _playerLoadout;
				
				//Patch for PAP weapon detection
				if (PlayerWeaponSlot1 select 1)
				then
				{
					player setVariable ["HasPAPWeap", true, false];
					//DATA SYNC BLOCK//////////////////////////////////////////////
					//When player is initializing, define player vars for everyone else
					execVM "Local_Scripts\syncPlayerDataSend.sqf"; //Sync player variables to all other machines and server
					///////////////////////////////////////////////////////////////
				}
				else
				{
					player setVariable ["HasPAPWeap", false, false];
					//DATA SYNC BLOCK//////////////////////////////////////////////
					//When player is initializing, define player vars for everyone else
					execVM "Local_Scripts\syncPlayerDataSend.sqf"; //Sync player variables to all other machines and server
					///////////////////////////////////////////////////////////////
				};
			};
		};
	};
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	if (((_this select 0) select 1) == 3)
	then
	{
		//If the players current weapon is in slot 1
		if ((currentWeapon player) == (PlayerWeaponSlot1 select 4))
		then
		{
			//If the player has a primary weapon in slot 2, then switch the players weapon to that in slot 2
			if ((PlayerWeaponSlot2 select 0) == "Launcher")
			then
			{
				//PATCHED
				_playerLoadout = getUnitLoadout player;
				
				//Store the A3 weapon slot array to the correct index in the WeaponSlotArray depending on whether it is a primary/launcher/sidearm
				switch (PlayerWeaponSlot1 select 0) do 
				{
					case "Primary": 	{PlayerWeaponSlot1 set [6,(_playerLoadout select 0)]};
					case "Launcher":	{PlayerWeaponSlot1 set [6,(_playerLoadout select 1)]};
					case "Sidearm": 	{PlayerWeaponSlot1 set [6,(_playerLoadout select 2)]};
					default 			{};
				};
				
				//Reload the players loadout, but this time with the weapon-to-be-removed removed
				player removeWeapon (currentWeapon player);
				_playerLoadout = getUnitLoadout player;
						
				//Now we can take the A3 weapon slot array from the WeaponSlot to be switched to and put it into the correct index in the players loadout
				_playerLoadout set [1, (PlayerWeaponSlot2 select 6)];
				
				//Store the weapon-to-be-switched-from's backpack ammo in the weaponslot-to-be-switched-from
				PlayerWeaponSlot1 set [5, ((_playerLoadout select 5) select 1)];
				
				//Now we clear the players backpack
				(_playerLoadout select 5) set [1,[]];
				
				//Insert the backpack ammo array from PlayerWeaponSlot2 into the players loadout. Remember that the player has a primary in both slots 1 and 2
				(_playerLoadout select 5) set [1,(PlayerWeaponSlot2 select 5)];
				
				player setUnitLoadout _playerLoadout;
				
				//Patch for player not automatically equipped launchers
				if ((PlayerWeaponSlot2 select 0) == "Launcher")
				then
				{
					player selectWeapon ((PlayerWeaponSlot2 select 3) select 1);
				};
				
				//Patch for PAP weapon detection
				if (PlayerWeaponSlot1 select 1)
				then
				{
					player setVariable ["HasPAPWeap", true, false];
					//DATA SYNC BLOCK//////////////////////////////////////////////
					//When player is initializing, define player vars for everyone else
					execVM "Local_Scripts\syncPlayerDataSend.sqf"; //Sync player variables to all other machines and server
					///////////////////////////////////////////////////////////////
				}
				else
				{
					player setVariable ["HasPAPWeap", false, false];
					//DATA SYNC BLOCK//////////////////////////////////////////////
					//When player is initializing, define player vars for everyone else
					execVM "Local_Scripts\syncPlayerDataSend.sqf"; //Sync player variables to all other machines and server
					///////////////////////////////////////////////////////////////
				};
			};
		}
		else //If the players current weapon is in slot 2
		{
			//If the player has a primary weapon in slot 1, then switch the players weapon to that in slot 1
			if ((PlayerWeaponSlot1 select 0) == "Launcher")
			then
			{
				_playerLoadout = getUnitLoadout player;
				
				//Store the A3 weapon slot array to the correct index in the WeaponSlotArray depending on whether it is a primary/launcher/sidearm
				switch (PlayerWeaponSlot2 select 0) do 
				{
					case "Primary": 	{PlayerWeaponSlot2 set [6,(_playerLoadout select 0)]};
					case "Launcher":	{PlayerWeaponSlot2 set [6,(_playerLoadout select 1)]};
					case "Sidearm": 	{PlayerWeaponSlot2 set [6,(_playerLoadout select 2)]};
					default 			{};
				};
				
				//Reload the players loadout, but this time with the weapon-to-be-removed removed
				player removeWeapon (currentWeapon player);
				_playerLoadout = getUnitLoadout player;
				
				//Now we can take the A3 weapon slot array from the WeaponSlot to be switched to and put it into the correct index in the players loadout
				_playerLoadout set [1, (PlayerWeaponSlot1 select 6)];
				
				//Store the weapon-to-be-switched-from's backpack ammo in the weaponslot-to-be-switched-from
				PlayerWeaponSlot2 set [5, ((_playerLoadout select 5) select 1)];
				
				//Now we clear the players backpack
				(_playerLoadout select 5) set [1,[]];
				
				//Insert the backpack ammo array from PlayerWeaponSlot1 into the players loadout. Remember that the player has a primary in both slots 1 and 2
				(_playerLoadout select 5) set [1,(PlayerWeaponSlot1 select 5)];
				
				player setUnitLoadout _playerLoadout;
				
				//Patch for player not automatically equipped launchers
				if ((PlayerWeaponSlot1 select 0) == "Launcher")
				then
				{
					player selectWeapon ((PlayerWeaponSlot1 select 3) select 1);
				};
				
				//Patch for PAP weapon detection
				if (PlayerWeaponSlot1 select 1)
				then
				{
					player setVariable ["HasPAPWeap", true, false];
					//DATA SYNC BLOCK//////////////////////////////////////////////
					//When player is initializing, define player vars for everyone else
					execVM "Local_Scripts\syncPlayerDataSend.sqf"; //Sync player variables to all other machines and server
					///////////////////////////////////////////////////////////////
				}
				else
				{
					player setVariable ["HasPAPWeap", false, false];
					//DATA SYNC BLOCK//////////////////////////////////////////////
					//When player is initializing, define player vars for everyone else
					execVM "Local_Scripts\syncPlayerDataSend.sqf"; //Sync player variables to all other machines and server
					///////////////////////////////////////////////////////////////
				};
			};
		};
	};
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	if (((_this select 0) select 1) == 4)
	then
	{
		//If the players current weapon is in slot 1
		if ((currentWeapon player) == (PlayerWeaponSlot1 select 4))
		then
		{
			//If the player has a sidearm in slot 2, then switch the players weapon to that in slot 2
			if ((PlayerWeaponSlot2 select 0) == "Sidearm")
			then
			{
				_playerLoadout = getUnitLoadout player;
				
				//Store the A3 weapon slot array to the correct index in the WeaponSlotArray depending on whether it is a primary/launcher/sidearm
				switch (PlayerWeaponSlot1 select 0) do 
				{
					case "Primary": 	{PlayerWeaponSlot1 set [6,(_playerLoadout select 0)]};
					case "Launcher":	{PlayerWeaponSlot1 set [6,(_playerLoadout select 1)]};
					case "Sidearm": 	{PlayerWeaponSlot1 set [6,(_playerLoadout select 2)]};
					default 			{};
				};
				
				//Reload the players loadout, but this time with the weapon-to-be-removed removed
				player removeWeapon (currentWeapon player);
				_playerLoadout = getUnitLoadout player;
						
				//Now we can take the A3 weapon slot array from the WeaponSlot to be switched to and put it into the correct index in the players loadout
				_playerLoadout set [2, (PlayerWeaponSlot2 select 6)];
				
				//Store the weapon-to-be-switched-from's backpack ammo in the weaponslot-to-be-switched-from
				PlayerWeaponSlot1 set [5, ((_playerLoadout select 5) select 1)];
				
				//Now we clear the players backpack
				(_playerLoadout select 5) set [1,[]];
				
				//Insert the backpack ammo array from PlayerWeaponSlot2 into the players loadout. Remember that the player has a primary in both slots 1 and 2
				(_playerLoadout select 5) set [1,(PlayerWeaponSlot2 select 5)];
				
				player setUnitLoadout _playerLoadout;
				
				//Patch for PAP weapon detection
				if (PlayerWeaponSlot2 select 1)
				then
				{
					player setVariable ["HasPAPWeap", true, false];
					//DATA SYNC BLOCK//////////////////////////////////////////////
					//When player is initializing, define player vars for everyone else
					execVM "Local_Scripts\syncPlayerDataSend.sqf"; //Sync player variables to all other machines and server
					///////////////////////////////////////////////////////////////
				}
				else
				{
					player setVariable ["HasPAPWeap", false, false];
					//DATA SYNC BLOCK//////////////////////////////////////////////
					//When player is initializing, define player vars for everyone else
					execVM "Local_Scripts\syncPlayerDataSend.sqf"; //Sync player variables to all other machines and server
					///////////////////////////////////////////////////////////////
				};
			};
		}
		else //If the players current weapon is in slot 2
		{
			//If the player has a secondary weapon in slot 1, then switch the players weapon to that in slot 1
			if ((PlayerWeaponSlot1 select 0) == "Sidearm")
			then
			{
				_playerLoadout = getUnitLoadout player;
				
				//Store the A3 weapon slot array to the correct index in the WeaponSlotArray depending on whether it is a primary/launcher/sidearm
				switch (PlayerWeaponSlot2 select 0) do 
				{
					case "Primary": 	{PlayerWeaponSlot2 set [6,(_playerLoadout select 0)]};
					case "Launcher":	{PlayerWeaponSlot2 set [6,(_playerLoadout select 1)]};
					case "Sidearm": 	{PlayerWeaponSlot2 set [6,(_playerLoadout select 2)]};
					default 			{};
				};
				
				//Reload the players loadout, but this time with the weapon-to-be-removed removed
				player removeWeapon (currentWeapon player);
				_playerLoadout = getUnitLoadout player;
				
				//Now we can take the A3 weapon slot array from the WeaponSlot to be switched to and put it into the correct index in the players loadout
				diag_log "ISSUE HERE?";
				diag_log (PlayerWeaponSlot1 select 6);
				diag_log _playerLoadout;
				_playerLoadout set [2, (PlayerWeaponSlot1 select 6)];
				diag_log _playerLoadout;
				
				//Store the weapon-to-be-switched-from's backpack ammo in the weaponslot-to-be-switched-from
				PlayerWeaponSlot2 set [5, ((_playerLoadout select 5) select 1)];
				
				//Now we clear the players backpack
				(_playerLoadout select 5) set [1,[]];
				
				//Insert the backpack ammo array from PlayerWeaponSlot2 into the players loadout. Remember that the player has a primary in both slots 1 and 2
				(_playerLoadout select 5) set [1,(PlayerWeaponSlot1 select 5)];
				
				player setUnitLoadout _playerLoadout;
				
				//Patch for PAP weapon detection
				if (PlayerWeaponSlot1 select 1)
				then
				{
					player setVariable ["HasPAPWeap", true, false];
					//DATA SYNC BLOCK//////////////////////////////////////////////
					//When player is initializing, define player vars for everyone else
					execVM "Local_Scripts\syncPlayerDataSend.sqf"; //Sync player variables to all other machines and server
					///////////////////////////////////////////////////////////////
				}
				else
				{
					player setVariable ["HasPAPWeap", false, false];
					//DATA SYNC BLOCK//////////////////////////////////////////////
					//When player is initializing, define player vars for everyone else
					execVM "Local_Scripts\syncPlayerDataSend.sqf"; //Sync player variables to all other machines and server
					///////////////////////////////////////////////////////////////
				};
			};
		};
	};
	
	
	
	
	
	
	
	
	
	sleep 0.5;
	keyPressDelay = 0;
};