[[
	player getVariable "PlayerScore",
	player getVariable "PlayerName",
	player getVariable "PlayerReady",
	player getVariable "PlayerRespawnWaiting",
	player getVariable "VotedKickAgainst",
	player getVariable "PerkStamina",
	player getVariable "PerkJuggernaut",
	player getVariable "PerkPackMule",
	player getVariable "HasRPG",
	player getVariable "HasC4",
	player getVariable "HasFuel",
	player getVariable "HasPAPWeap"
],"Local_Scripts\syncPlayerDataRecieve.sqf"] remoteExec ["execVM",0]; //Executes on all machines