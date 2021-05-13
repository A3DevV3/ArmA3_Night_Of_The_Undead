params ["_playerToPromote","_playerCount"];
_playerCount = count (call BIS_fnc_listPlayers);
if (_playerToPromote <= _playerCount)
then
{
    ((call BIS_fnc_listPlayers) select (_playerToPromote - 1)) setVariable ["PlayerHost", true, true];
    player setVariable ["PlayerHost", false, true];
    [[format ["%1 has made %2 gamehost,name player,((call BIS_fnc_listPlayers) select (_playerToPromote - 1)) getVariable "PlayerName"]],"Local_Scripts\localSystemChat.sqf"] remoteExec ["execVM",0];
};
RefreshUI = true;