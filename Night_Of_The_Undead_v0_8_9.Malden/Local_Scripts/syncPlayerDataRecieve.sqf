//Synchronization for clients to each other and server
//Player name is exclude as it is broadcasted in initPlayerLocal
//Player respawn waiting is excluding as it is updated via "k
params [
	"_playerScore",
	"_playerName",
	"_playerReady",
	"_playerRespawnWaiting",
	"_votedKickAgainst",
	"_perkStamina",
	"_perkJuggernaut",
	"_perkPackMule",
	"_hasRPG",
	"_hasC4",
	"_hasFuel",
	"_hasPAPWeap"
];

//systemChat (format ["Recieved data sync block for: %1", _playerName]);

{
	if ((_x getVariable "PlayerName") == _playerName)
	then
	{
		_x setVariable ["PlayerScore", _playerScore, false];
		_x setVariable ["PlayerReady", _playerReady, false];
		_x setVariable ["PlayerRespawnWaiting", _playerRespawnWaiting, false];
		_x setVariable ["VotedKickAgainst", _votedKickAgainst, false];
		_x setVariable ["PerkStamina", _perkStamina, false];
		_x setVariable ["PerkJuggernaut", _perkJuggernaut, false];
		_x setVariable ["PerkPackMule", _perkPackMule, false];
		_x setVariable ["HasRPG", _hasRPG, false];
		_x setVariable ["HasC4", _hasC4, false];
		_x setVariable ["HasFuel", _hasFuel, false];
		_x setVariable ["HasPAPWeap", _hasPAPWeap, false];
	};
} forEach allPlayers;