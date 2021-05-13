if ((GAMESETTINGS getVariable "PointsPerKill") == 25)
then
{
    GAMESETTINGS setVariable ["PointsPerKill", 50, true]; //0 = Easy  |  1 = Normal  |  2 = Hard
}
else
{
    if ((GAMESETTINGS getVariable "PointsPerKill") == 50)
    then
    {
        GAMESETTINGS setVariable ["PointsPerKill", 100, true]; //0 = Easy  |  1 = Normal  |  2 = Hard
    }
    else
    {
        GAMESETTINGS setVariable ["PointsPerKill", 25, true]; //0 = Easy  |  1 = Normal  |  2 = Hard
    };
};