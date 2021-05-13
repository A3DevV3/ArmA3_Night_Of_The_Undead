private 
[
	"_perk",
	"_purchasePrice",
	"_money"
];

_params = _this select 3;
_perk = _params select 0;
_purchasePrice = _params select 1;

if (Power)
then
{
	if 	(player getVariable "PerkJuggernaut")
	then
	{
		hint "You already have this perk";
	}
	else
	{
		if ((player getVariable "PlayerScore") > (_purchasePrice - 1)) //If player has the money
		then
		{
			_money = (player getVariable "PlayerScore") - _purchasePrice;
			player setVariable ["PlayerScore",_money,false];
			player setVariable ["PerkJuggernaut",true,false];
			//When player is killed, need to inform all others that he is now waiting to respawn
			execVM "Local_Scripts\syncPlayerDataSend.sqf"; //Sync player variables to all other machines and server
			///////////////////////////////////////////////////////////////
			hint "You have purchased Juggernaut! You're so strong!";
		}
		else
		{
			hint "Not enough money to purchase";
		};
	};
}
else
{
	hint "You must turn on the power first!";
};