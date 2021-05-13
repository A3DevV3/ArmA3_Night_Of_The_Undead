//This runs at the end of the game or when the server requests a restart from the lobby

private ["_DBQuery","_timeNow","_timeGap","_serverRestarted"];

_timeNow = (parseNumber ("real_date" callExtension "0"));
_DBQuery = parseNumber (["read", ["restartSystem", "serverRestarted"]] call DATABASE);

_timeGap = _timeNow - _DBQuery;

if (_timeGap > 10799)
then
{
	//Set the inidbi2 server restart flag to true
	["write", ["restartSystem", "serverRestarted", "true"]] call DATABASE;
	
	//Wait 2 seconds for the write operation to completed
	sleep 2;
	
	//If it has been 3 hours or longer since the server last restarted, restart the server
	"NOTUmissionadmin02" serverCommand "#restartserver"; //Restart the mission
}
else
{
	//Otherwise, simply just restart only the mission
	"NOTUmissionadmin02" serverCommand "#reassign"; //Restart the mission
};