private [
	"_manEntities",
	"_zombies"
];
//Zombie Hit Manager
_zombies = [];
while {true}
do
{
		//The first time this runs, it will generate a list of all active alive zombies within the map (playable area)
		//Subsequent runs will serve as a monitoring system to add and remove zombies as they are spawned by the core
		//Game/Round manager subsystems and as players kill them
		_manEntities = (getPosATL zombieDetectArea) nearEntities ["Man", 135];
		{
			if (typeOf _x == "O_G_Soldier_F") 
			then 
			{
				if (alive _x) 
				then 
				{
					if (!(_x in _zombies)) 
					then 
					{
						_zombies pushBack _x;
						_x addEventHandler ["Hit", {
							params ["_unit", "_source", "_damage", "_instigator"];
							if (!(faction _unit == "BLU_F"))
							then
							{
								_instigator setVariable ["PlayerScore",((_instigator getVariable "PlayerScore") + 10), false]; //This updates player scores locally
							};
						}];
					};
				}
				else
				{
			
					if (_x in _zombies) 
					then 
					{
						_zombies deleteAt (_zombies find _x);
					};
				};
			};
		}
		forEach _manEntities;
	sleep 1;
};