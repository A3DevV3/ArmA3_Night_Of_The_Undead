private [

"_nearestObjects",
"_sortedLightArray",
"_editorLightHalogenArray",
"_papLights",
"_allLights"

];

GeneratorZone setPos (getPos trash);

_allLights = [];
_sortedLightArray = [];
_editorLightHalogenArray = [Lamp1,Lamp2,Lamp3,Lamp4,Lamp5,Lamp6,Lamp7];
_papLights = [PAPlight1,PAPlight2,PAPlight3,PAPlight4];


//Scan all objects within 300 meter radius and add them to _nearestObjects
_nearestObjects = nearestObjects [position PlayerTargetingTrigger, [], 300, true];


//Now sort through _nearestObjects and filter out the classnames specified below
{
	switch (typeOf _x) do
	{
		case "Land_LampHalogen_F": {_sortedLightArray pushBack _x};
		case "Land_LampHarbour_F": {_sortedLightArray pushBack _x};
		case "Land_LampAirport_F": {_sortedLightArray pushBack _x};
		default {};
	}
} forEach _nearestObjects;

_allLights append _sortedLightArray;
_allLights append _editorLightHalogenArray;

//AreaLights is an array of all the big lights so when players turn on the power the map lights up
AreaLights append _allLights;

//Set the map lights vulnerable so we can make changes to them
{
	_x allowDamage true;
} forEach _allLights;

//Now turn on all the detected lights by interating through all their hitpoint segments and setting the damage to 0.97
{
	for "_i" from 0 to count getAllHitPointsDamage _x - 1 do
	{
		_x setHitIndex [_i, 0];
		systemChat "setting hit index";
	};
	
	//Patch for the halogen lamps
	if ((typeOf _x) == "Land_LampHalogen_F")
	then
	{
		_x setHitIndex [3, 0];
	};
} forEach _sortedLightArray;

//Now turn on all the editor halogen lights by interating through all their hitpoint segments and setting the damage to 0.97
{
	for "_i" from 0 to count getAllHitPointsDamage _x - 1 do
	{
		_x setHitIndex [_i, 0];
	};
	_x setHitIndex [3, 0];
} forEach _editorLightHalogenArray;

_allLights append _sortedLightArray;
_allLights append _editorLightHalogenArray;

//Turn on mystery box light 1 then make it invulnerable
MysteryBoxLight1 allowDamage true;
for "_i" from 0 to count getAllHitPointsDamage MysteryBoxLight1 - 1 do
{
	MysteryBoxLight1 setHitIndex [_i, 00];
};
MysteryBoxLight1 allowDamage false;


//Set the map lights invulnerable so trolls can't shoot them out. Looking at you munk
{
	_x allowDamage false;
} forEach _allLights;

[[],"Local_Scripts\localTurnOnPower.sqf"] remoteExec ["execVM",0]; //Executes on all machines
sleep 2;
PowerExplosion1 setDamage 1;
sleep 6;
PowerExplosion2 setDamage 1;
sleep 6;
PowerExplosion3 setDamage 1;