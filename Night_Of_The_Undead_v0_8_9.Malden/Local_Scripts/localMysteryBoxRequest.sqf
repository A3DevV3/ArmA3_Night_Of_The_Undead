private ["_weapon","_hasWeapon","_purchasePrice","_rearmPrice","_amountToCheck","_params"];
_params = _this select 3;
_weapon = _params select 0;
_purchasePrice = _params select 1;

if (Power)
then
{
	if ((player getVariable "PlayerScore") > (_purchasePrice - 1))
	then
	{
		_money = (player getVariable "PlayerScore") - _purchasePrice;
		player setVariable ["PlayerScore",_money,false];
		//DATA SYNC BLOCK//////////////////////////////////////////////
		execVM "Local_Scripts\syncPlayerDataSend.sqf"; //Sync player variables to all other machines and server
		///////////////////////////////////////////////////////////////
		[[clientOwner],"Server_Scripts\serverMysteryBox.sqf"] remoteExec ["execVM",2];
		MysteryBoxZone setPos (getPos trash);
	}
	else
	{
		hint "Not enough money";
	};
}
else
{
	hint "You must turn on the power first!";
};