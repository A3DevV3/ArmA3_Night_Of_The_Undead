params ["_playerUID","_bool"];

{
	if ((getPlayerUID _x) == _playerUID)
	then
	{
		_x hideObjectGlobal _bool;
		systemChat "server hide player";
	};
}
forEach allPlayers;