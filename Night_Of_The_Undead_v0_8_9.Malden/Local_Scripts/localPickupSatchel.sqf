if (player getVariable "HasC4")
then
{
	hint "You cannot pick up more than one satchel";
}
else
{
	hint "You have picked up the satchel";
	[[player],"Server_Scripts\serverPickUpSatchelRequest.sqf"] remoteExec ["execVM",2];
};