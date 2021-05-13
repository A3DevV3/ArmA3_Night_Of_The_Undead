{
	if (_x getVariable "PerkStamina")
	then
	{
		if (_x  getVariable "PerkJuggernaut")
		then
		{
			if (_x getVariable "PerkPackMule")
			then
			{
				PAPaccessible = true;

				Satchel1 setPosASL Satchel1Pos;
				Satchel2 setPosASL Satchel2Pos;
				Satchel3 setPosASL Satchel3Pos;
				Satchel1Zone setPosASL Satchel1Pos;
				Satchel2Zone setPosASL Satchel2Pos;
				Satchel3Zone setPosASL Satchel3Pos;
			};
		};
	};
} forEach allPlayers;