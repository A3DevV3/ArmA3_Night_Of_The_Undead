if (GAMESETTINGS getVariable "SpecialWeaponsEnabled")
then
{
    GAMESETTINGS setVariable ["SpecialWeaponsEnabled", false, true];
}
else
{
    GAMESETTINGS setVariable ["SpecialWeaponsEnabled", true, true];
};