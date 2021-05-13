private ["_thisZombie"];

if (spawnDelay == 0)
then
{
	spawnDelay = 5;
	_thisZombie = infected createUnit ["O_G_Soldier_F", getMarkerPos "spawnMarkerDebug", [], 0, "FORM"];

	_thisZombie disableAI "FSM";
	_thisZombie disableAI "AUTOTARGET";
	_thisZombie disableAI "TARGET";
	_thisZombie setBehaviour "CARELESS";
	_thisZombie disableAI "MOVE";
	_thisZombie disableAI "ANIM";
	_thisZombie enableFatigue false;
	_thisZombie setVariable ["BIS_noCoreConversations", true];
	_thisZombie disableConversation true;
	_thisZombie setDir 225;

	removeAllWeapons _thisZombie;
	removeAllItems _thisZombie;
	removeAllAssignedItems _thisZombie;
	removeVest _thisZombie;
	removeBackpack _thisZombie;
	removeHeadgear _thisZombie;
	removeGoggles _thisZombie;
	_thisZombie setMimic "hurt";
	while {spawnDelay > 0}
	do
	{
		spawnDelay = spawnDelay - 1;
		sleep 1;
	};
	spawnDelay = 0;
}
else
{
	hint format["[Test zombie spawn spam protection triggered]",spawnDelay];
};