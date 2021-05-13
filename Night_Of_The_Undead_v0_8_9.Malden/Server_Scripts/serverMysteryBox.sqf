private 
[
	"_weapons",
	
	"_owner",
	"_randomElement",
	"_temp",
	"_temp1",
	"_weaponObject",
	"_pos"
];

//Check to make sure another player isn't rolling. If they are, MysteryBoxActive should be 1
if (MysteryBoxActive == 0)
then
{
	MysteryBoxActive = 1;
	_owner = _this select 0;

	//This "turns on" the light that shines down onto the mystery box when a player is rolling by moving it to/from the trash area
	if (MysteryBoxLocation == 1)
	then
	{
		MysteryBoxRollLight setPosASL [(getPos MysteryBoxWeaponPos1) select 0,(getPos MysteryBoxWeaponPos1) select 1,4.792];
		MysteryBoxRollLight setVectorDir [90,0,0]; 
	}
	else
	{
		MysteryBoxRollLight setPosASL [(getPos MysteryBoxWeaponPos2) select 0,(getPos MysteryBoxWeaponPos2) select 1,4.792];
		MysteryBoxRollLight setVectorDir [90,0,0]; 
	};
	
	//Show 8 random weapons at the mysterybox over a period of 4 seconds
	for "_x" from 1 to 8 do
	{
		_randomElement = selectRandom WEAPONSDB;
		_temp = _randomElement select 6;
		if (_x > 1)
		then
		{
			deleteVehicle _weaponObject;
		};
		
		if (MysteryBoxLocation == 1)
		then
		{
			[[_temp,MysteryBoxWeaponPos1,0.5], "Local_Scripts\localMysteryBoxShowWeapon.sqf"] remoteExec ["execVM",-2];
		}
		else
		{
			[[_temp,MysteryBoxWeaponPos2,0.5], "Local_Scripts\localMysteryBoxShowWeapon.sqf"] remoteExec ["execVM",-2];
		};

		sleep 0.5;
	};
	
	sleep 0.5;
	_randomElement = selectRandom WEAPONSDB;
	_temp = _randomElement select 6;

	if (MysteryBoxLocation == 1)
	then
	{
		MysteryBoxGrab setPos (getPos MysteryBoxTriggerLocation);
		[[_temp,MysteryBoxWeaponPos1,10], "Local_Scripts\localMysteryBoxShowWeapon.sqf"] remoteExec ["execVM",-2];
	}
	else
	{
		MysteryBoxGrab setPos (getPos MysteryBoxTriggerLocation2);
		[[_temp,MysteryBoxWeaponPos2,10], "Local_Scripts\localMysteryBoxShowWeapon.sqf"] remoteExec ["execVM",-2];
	};

	[[_randomElement], "Local_Scripts\localMysteryBoxGrab.sqf"] remoteExec ["execVM",_owner];
	sleep 10;
	
	//Move the overhead light back to trash
	if (MysteryBoxLocation == 1)
	then
	{
		MysteryBoxRollLight setPosASL [(getPos trash) select 0,(getPos trash) select 1,4.792];
	}
	else
	{
		MysteryBoxRollLight setPosASL [(getPos trash) select 0,(getPos trash) select 1,4.792];
	};
	
	MysteryBoxUseCount = MysteryBoxUseCount + 1;
	MysteryBoxGrab setPos (getPos trash);
	if (MysteryBoxUseCount > 8)
	then
	{
		if (MysteryBoxLocation == 1)
		then
		{
			MysteryBoxLocation = 2;
			//Turn off mystery box light 1 then make it invulnerable
			MysteryBoxLight1 allowDamage true;
			for "_i" from 0 to count getAllHitPointsDamage MysteryBoxLight1 - 1 do
			{
				MysteryBoxLight1 setHitIndex [_i, 0.97];
			};
			MysteryBoxLight1 allowDamage false;
			//Turn on mystery box light 2 then make it invulnerable
			MysteryBoxLight2 allowDamage true;
			for "_i" from 0 to count getAllHitPointsDamage MysteryBoxLight2 - 1 do
			{
				MysteryBoxLight2 setHitIndex [_i, 0];
			};
			MysteryBoxLight2 allowDamage false;
		}
		else
		{
			MysteryBoxLocation = 1;
			//Turn on mystery box light 1 then make it invulnerable
			MysteryBoxLight1 allowDamage true;
			for "_i" from 0 to count getAllHitPointsDamage MysteryBoxLight1 - 1 do
			{
				MysteryBoxLight1 setHitIndex [_i, 0];
			};
			MysteryBoxLight1 allowDamage false;
			//Turn off mystery box light 2 then make it invulnerable
			MysteryBoxLight2 allowDamage true;
			for "_i" from 0 to count getAllHitPointsDamage MysteryBoxLight2 - 1 do
			{
				MysteryBoxLight2 setHitIndex [_i, 0.97];
			};
			MysteryBoxLight2 allowDamage false;
		};
		MysteryBoxUseCount = 0;
	sleep 15;
	};
	if (MysteryBoxLocation == 1)
	then
	{
		MysteryBoxZone setPos (getPos MysteryBoxTriggerLocation);
	}
	else
	{
		MysteryBoxZone setPos (getPos MysteryBoxTriggerLocation2);
	};
	MysteryBoxActive = 0;
};