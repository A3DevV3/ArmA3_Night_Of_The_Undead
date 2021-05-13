private ["_weapon","_hasWeapon","_purchasePrice","_rearmPrice","_amountToCheck","_params"];
_params = _this select 3;
_weapon = _params select 0;
_purchasePrice = _params select 1;
MysteryBoxZone setPos (getPos trash);

if ((player getVariable "PlayerScore") > _purchasePrice)
then
{
	_money = (player getVariable "PlayerScore") - _amountToCheck;
	player setVariable ["PlayerScore",_money,true];
	[[clientOwner],"Server_Scripts\serverMysteryBox.sqf"] remoteExec ["execVM",2];
}
else
{
	hint "Not enough money";
};