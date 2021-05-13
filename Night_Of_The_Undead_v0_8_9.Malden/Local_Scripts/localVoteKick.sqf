params ["_playerVotedKickAgainst","_playerCount","_VotedKickArray"];
_playerCount = count (call BIS_fnc_listPlayers);

if (_playerVotedKickAgainst <= _playerCount)
then
{
	//Get the array attached to the player who has been voted against that contains the steamIDs of everyone who voted to kick him
	_VotedKickArray = ((call BIS_fnc_listPlayers) select (_playerVotedKickAgainst - 1)) getVariable "VotedKickAgainst";
	
	if ((getPlayerUID player) in _VotedKickArray)
	then
	{
		systemChat "You already voted to kick this player";
	}
	else
	{
		systemChat "Voted to kick";
		_VotedKickArray append [(getPlayerUID player)];
		((call BIS_fnc_listPlayers) select (_playerVotedKickAgainst - 1)) setVariable ["VotedKickAgainst",_VotedKickArray,false];
		[[
			player getVariable "PlayerName",
			((call BIS_fnc_listPlayers) select (_playerVotedKickAgainst - 1)) getVariable "PlayerName",
			((call BIS_fnc_listPlayers) select (_playerVotedKickAgainst - 1)) getVariable "VotedKickAgainst"
		],"Local_Scripts\syncPlayerDataRecieveKickVote.sqf"] remoteExec ["execVM",0]; //Executes on all machines
	};
};
RefreshUI = true;