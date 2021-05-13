This mission uses inidbi2. initServer.sqf uses 

DATABASE = ["new", "AWD_NOTU_DB"] call OO_INIDBI;
["write", ["Test","Test",1]] call DATABASE;

to setup the database. From that point on, the server
uses the DATABASE global variable to refer to the inidbi2
database. 

The mission is currently optimized to be used
by a dedicated server. You can try hosting it
locally, but I am not sure what will work and
what won't. Theoretically it should, but there
may be a few subtle glitches.