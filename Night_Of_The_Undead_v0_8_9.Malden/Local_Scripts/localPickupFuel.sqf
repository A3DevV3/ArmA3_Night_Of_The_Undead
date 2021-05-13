if (player getVariable "HasFuel")
then
{
	hint "You cannot pick up more than one fuel can";
}
else
{
	hint "You have picked up the fuel can";
	[[player],"Server_Scripts\serverPickUpFuelRequest.sqf"] remoteExec ["execVM",2];
};