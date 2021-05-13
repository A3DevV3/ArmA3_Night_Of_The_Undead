if (GAMESETTINGS getVariable "MachineGunsEnabled")
then
{
    GAMESETTINGS setVariable ["MachineGunsEnabled", false, true];
}
else
{
    GAMESETTINGS setVariable ["MachineGunsEnabled", true, true];
};