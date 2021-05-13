params ["_player"];
[[
	_player getVariable "PlayerScore",
	_player getVariable "PlayerName",
	_player getVariable "PlayerReady",
	_player getVariable "PlayerRespawnWaiting",
	_player getVariable "VotedKickAgainst",
	_player getVariable "PerkStamina",
	_player getVariable "PerkJuggernaut",
	_player getVariable "PerkPackMule",
	_player getVariable "HasRPG",
	_player getVariable "HasC4",
	_player getVariable "HasFuel",
	_player getVariable "HasPAPWeap"
],"Local_Scripts\syncPlayerDataRecieve.sqf"] remoteExec ["execVM",0]; //Executes on all machines