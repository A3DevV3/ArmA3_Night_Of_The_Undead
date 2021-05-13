params ["_maxRound"];
ServerCurrentRound = -3; //Game is over
GameOver = true;
["Terminate"] call BIS_fnc_EGSpectator;
[[getPlayerUID player,true],"Server_Scripts\serverHidePlayer.sqf"] remoteExec ["execVM",2]; //Executes on server only
player allowDamage false;
LOCALCAMERA = "camera" camCreate getPos gOCam1Pos1;
LOCALCAMERA cameraEffect ["internal", "BACK"];
LOCALCAMERA camSetTarget getPos gOCam1Tar1;	
playMusic "gameOver";
LoadIcon = true;
execVM "Local_Scripts\localLoadingIcon.sqf";

systemChat " ";
systemChat " ";
systemChat " ";
systemChat " ";
systemChat " ";
systemChat " ";
systemChat " ";
systemChat " ";

uiNamespace getVariable "Overlay" displayCtrl 21 ctrlSetTextColor [1, 1, 1, 1];
uiNamespace getVariable "Overlay" displayCtrl 21 ctrlSetText (format ["Game Over - You survived %1 rounds",_maxRound]);
uiNamespace getVariable "Overlay" displayCtrl 21 ctrlShow true;

LOCALCAMERA camPreparePos getPos gOCam1Pos2;
LOCALCAMERA camPrepareTarget getPos gOCam1Tar2;
LOCALCAMERA camCommitPrepared 13;
sleep 13;

LOCALCAMERA camSetTarget getPos gOCam2Tar1;
LOCALCAMERA camSetPos getPos gOCam2Pos1;
LOCALCAMERA camCommit 0;
LOCALCAMERA camPreparePos getPos gOCam2Pos2;
LOCALCAMERA camPrepareTarget getPos gOCam2Tar2;
LOCALCAMERA camCommitPrepared 13;
sleep 13;