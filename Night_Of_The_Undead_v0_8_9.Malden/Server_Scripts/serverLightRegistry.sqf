private [

"_nearestObjects",
"_sortedLightArray",
"_editorLightHalogenArray",
"_papLights",
"_allLights"

];

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

//Set the PAP lights vulnerable
{
	_x allowDamage true;
} forEach _papLights;

//Now turn off all the detected lights by interating through all their hitpoint segments and setting the damage to 0.97
{
	for "_i" from 0 to count getAllHitPointsDamage _x - 1 do
	{
		_x setHitIndex [_i, 0.97];
		//systemChat "setting hit index";
	};
	
	//Patch for the halogen lamps
	if ((typeOf _x) == "Land_LampHalogen_F")
	then
	{
		_x setHitIndex [3, 0.97];
	};
} forEach _sortedLightArray;

//Now turn off all the editor halogen lights by interating through all their hitpoint segments and setting the damage to 0.97
{
	for "_i" from 0 to count getAllHitPointsDamage _x - 1 do
	{
		_x setHitIndex [_i, 0.97];
	};
	_x setHitIndex [3, 0.97];
} forEach _editorLightHalogenArray;

_allLights append _sortedLightArray;
_allLights append _editorLightHalogenArray;

//Turn off mystery box light 1 then make it invulnerable
MysteryBoxLight1 allowDamage true;
for "_i" from 0 to count getAllHitPointsDamage MysteryBoxLight1 - 1 do
{
	MysteryBoxLight1 setHitIndex [_i, 0.97];
};
MysteryBoxLight1 allowDamage false;

//Turn off mystery box light 2 then make it invulnerable
MysteryBoxLight2 allowDamage true;
for "_i" from 0 to count getAllHitPointsDamage MysteryBoxLight2 - 1 do
{
	MysteryBoxLight2 setHitIndex [_i, 0.97];
};
MysteryBoxLight2 allowDamage false;

//Turn off and hide the PAPlights
{
	for "_i" from 0 to count getAllHitPointsDamage _x - 1 do
	{
		_x setHitIndex [_i, 0.97];
		_x hideObjectGlobal true;
	};
} forEach _papLights;

//Set the map lights invulnerable so trolls can't shoot them out. Looking at you munk
{
	_x allowDamage false;
} forEach _allLights;

//Set the pap lights invulnerable
{
	_x allowDamage false;
} forEach _papLights;