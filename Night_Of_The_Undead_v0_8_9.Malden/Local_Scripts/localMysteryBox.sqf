//This script is now obsolete

private [

	"_randomElement",
	"_temp",
	"_weaponObject",
	"_pos"

];

params [

	"_mysteryBoxLocation"
	
];

for "_x" from 1 to 8 do
{
	_randomElement = selectRandom WEAPONSDB;
	_temp = _randomElement select 6;
	if (_x > 1)
	then
	{
		deleteVehicle _weaponObject;
	};
	
	if (_mysteryBoxLocation == 1)
	then
	{
		_weaponObject = _temp createVehicleLocal [8114.802,10159.878,1.439];
	}
	else
	{
		_weaponObject = _temp createVehicleLocal [8150.197,10099.079,1.411];
	};

	_weaponObject enableSimulation false;
	_weaponObject setDamage 1;
	sleep 0.5;
};
deleteVehicle _weaponObject;