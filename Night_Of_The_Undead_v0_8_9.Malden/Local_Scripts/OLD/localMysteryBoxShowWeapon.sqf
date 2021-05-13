private ["_weaponName","_weaponObject"];

_weaponName = _this select 0;
if (MysteryBoxLocation == 1)
then
{
	_weaponObject = _weaponName createVehicleLocal [8114.802,10159.878,1.439];
	_pos = getPos MysteryBoxWeaponPos;
}
else
{
	_weaponObject = _weaponName createVehicleLocal [8150.197,10099.079,1.411];
	_pos = getPos MysteryBoxWeaponPos2;
};
_weaponObject setPos _pos;
_weaponObject enableSimulation false;
_weaponObject setDamage 1;
sleep 10;

deleteVehicle _weaponObject;