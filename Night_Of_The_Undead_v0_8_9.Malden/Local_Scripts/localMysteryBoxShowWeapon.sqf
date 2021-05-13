private ["_weaponObject"];

params 
[

	"_weapon",
	"_mysteryBoxLocation",
	"_duration"

];

_weaponObject = _weapon createVehicleLocal (getPos MysteryBoxWeaponSpawn);
_weaponObject setPosASL (getPosASL _mysteryBoxLocation);
_weaponObject enableSimulation false;
_weaponObject setDamage 1;
sleep _duration;
deleteVehicle _weaponObject;