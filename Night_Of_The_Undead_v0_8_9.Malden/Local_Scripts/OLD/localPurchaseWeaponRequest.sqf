private ["_weapon","_hasWeapon","_purchasePrice","_rearmPrice","_amountToCheck","_params"];
_params = _this select 3;
_weapon = _params select 0;
_purchasePrice = _params select 1;
_rearmPrice = _params select 2;
_hasWeapon = player hasWeapon _weapon;
if (_hasWeapon)
then
{
	_amountToCheck = _rearmPrice;
}
else
{
	_amountToCheck = _purchasePrice;
};

for "_x" from 1 to (count Players) do 
{ 
	_temp = Players select (_x - 1);
	if (((_temp select 0) == (clientOwner)) && (!((_temp select 2) < _amountToCheck))) exitWith {[[clientOwner,_weapon,_hasWeapon,_amountToCheck],"Server_Scripts\serverPurchaseWeaponRequestHandler.sqf"] remoteExec ["execVM",2];};
	if (((_temp select 0) == (clientOwner)) && ((_temp select 2) < _amountToCheck))
	then
	{
		if (player hasWeapon _weapon)
		then
		{
			hint "Not enough money to rearm";
		}
		else
		{
			hint "Not enough money to purchase";
		};
	};
};