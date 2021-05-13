private ["_DBQuery","_timeNow","_timeGap","_serverRestarted"];

_timeNow = (parseNumber ("real_date" callExtension "0"));
_DBQuery = parseNumber (["read", ["restartSystem", "serverRestarted"]] call DATABASE);

if ((typeName _DBQuery) == "BOOL") //This runs when inidbi2 extension returns a boolean, which means the database does not exist. Follow server restart procedure in this case
then
{
		//Register the server boot time after the start
		["write", ["restartSystem", "lastServerRestart", ("real_date" callExtension "0")]] call DATABASE;
		sleep 2;
		//Set the inidbi2 server restart flag to false
		["write", ["restartSystem", "serverRestarted", "false"]] call DATABASE;
		sleep 2;
}
else
{
	//This runs when inidbi2 extension returns a string, which means the database does exists. If the returned string is "true", the a server restart was registered into the DB before the restart
	if ((["read", ["restartSystem", "serverRestarted"]] call DATABASE) == "true")
	then
	{ //A server restart just occurred
		_serverRestarted = true;
		
		//Register the server boot time after the restart via inidbi2
		["write", ["restartSystem", "lastServerRestart", ("real_date" callExtension "0")]] call DATABASE;
		sleep 2;
		//Set the inidbi2 server restart flag to false
		["write", ["restartSystem", "serverRestarted", "false"]] call DATABASE;
		sleep 2;
	}
	else
	{ //A mission restart just occurred
		_serverRestarted = false;
	};
};