if ((GAMESETTINGS getVariable "ZombieDifficulty") == 1)
then
{
    GAMESETTINGS setVariable ["ZombieDifficulty", 2, true]; //0 = Easy  |  1 = Normal  |  2 = Hard
}
else
{
    if ((GAMESETTINGS getVariable "ZombieDifficulty") == 2)
    then
    {
        GAMESETTINGS setVariable ["ZombieDifficulty", 0, true]; //0 = Easy  |  1 = Normal  |  2 = Hard
    }
    else
    {
        GAMESETTINGS setVariable ["ZombieDifficulty", 1, true]; //0 = Easy  |  1 = Normal  |  2 = Hard
    };
};