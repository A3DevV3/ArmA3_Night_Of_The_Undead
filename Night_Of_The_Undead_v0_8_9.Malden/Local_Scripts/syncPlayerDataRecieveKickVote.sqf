params [
	"_voter",
	"_playerName",
	"_votedKickAgainst"
];

systemChat (format ["%1 voted to kick %2", _voter,_playerName]);

{
	if (!(isNull _playerName))
	then
	{
		if ((_x getVariable "PlayerName") == _playerName)
		then
		{
			_x setVariable ["VotedKickAgainst", _votedKickAgainst, false];
		};
	};
} forEach allPlayers;