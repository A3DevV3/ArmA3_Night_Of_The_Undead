private ["_door","_playerScore","_total"];
_door = _this select 3;
_playerScore = player getVariable "PlayerScore";
if (_playerScore > 749)
then
{
	_playerScore = _playerScore - 750;
	player setVariable ["PlayerScore", _playerScore, false];
	//DATA SYNC BLOCK//////////////////////////////////////////////
	execVM "Local_Scripts\syncPlayerDataSend.sqf"; //Sync player variables to all other machines and server
	///////////////////////////////////////////////////////////////
	[[_door],"Server_Scripts\serverAreaOpen.sqf"] remoteExec ["execVM",2]; //Executes on server only
}
else
{
	hint "You do not have enough money to unlock this door";
};