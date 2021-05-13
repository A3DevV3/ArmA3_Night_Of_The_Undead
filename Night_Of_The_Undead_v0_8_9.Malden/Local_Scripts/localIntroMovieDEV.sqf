private ["_amb"];

LOCALCAMERA = "camera" camCreate getPos MenuCam1Pos1;
LOCALCAMERA cameraEffect ["internal", "BACK"];
LOCALCAMERA camSetTarget getPos MenuCam1Tar1;	

cutRsc ["GUI1000", "PLAIN"];
titleCut ["", "BLACK OUT", 1];
sleep 2;
player setVariable ["PlayerReady",3,true];
[format ["%1 awaiting intro",name player],"Local_Scripts\localSystemChat.sqf"] remoteExec ["execVM",0];

if ((player getVariable "PlayerReady") == 3)
then
{
	introscenery1 hideObjectGlobal true;
	introscenery2 hideObjectGlobal true;
	introscenery3 hideObjectGlobal true;
	introscenery4 hideObjectGlobal true;
	introscenery5 hideObjectGlobal true;
	introscenery6 hideObjectGlobal true;
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
	cutRsc ["GUI50", "BLACK"];

	sleep 3;//3
	
	playMusic "Intro";

	sleep 1; //4
	uiNamespace getVariable "Overlay" displayCtrl 1 ctrlSetTextColor [1, 1, 1, 1];
	uiNamespace getVariable "Overlay" displayCtrl 1 ctrlSetText "Advanced Warfare Designs presents...";
	uiNamespace getVariable "Overlay" displayCtrl 1 ctrlShow true;
		
	call AWDxNOTU_fnc_LUIFRefreshGameSettings;

	LOCALCAMERA camSetPos getPos introcampos11;
	LOCALCAMERA camSetTarget getPosATL introcamtar11;
	_amb = "C_Van_02_medevac_F" createVehicleLocal [8324.305, 10151.365, 1];
	_amb setDir 268.56;
	_amb setPilotLight true; 
	_amb animate ["lights_em_hide",1];
	_amb allowDamage false;
	sleep 7.5; //11.5
	LoadIcon = false;
	uiNamespace getVariable "Overlay" displayCtrl 1 ctrlShow false;
	sleep 1; //12.5

	titleCut ["", "BLACK IN", 4];
	LOCALCAMERA camCommit 0;
	LOCALCAMERA camPreparePos getPos introcampos12;
	LOCALCAMERA camPrepareTarget getPos introcamtar12;
	LOCALCAMERA camCommitPrepared 5;
	sleep 2;
	_amb setVelocity [-35.5, -4.1, 10];
	sleep 2.5; //17
	//titleCut ["", "BLACK OUT", 0.001];
	cutRsc ["GUI50", "BLACK"];
	//Dev credit
	uiNamespace getVariable "Overlay" displayCtrl 2 ctrlSetTextColor [1, 1, 1, 1];
	uiNamespace getVariable "Overlay" displayCtrl 2 ctrlSetText "Dev [Project lead] [Programming]";
	uiNamespace getVariable "Overlay" displayCtrl 2 ctrlShow true;
	
	
	sleep 2; //19
	_amb setPos [8276.433, 10096.753, 1];
	LOCALCAMERA camsetPos getPosATL REFA;
	LOCALCAMERA camSetTarget getPosATL introcampos22;
	LOCALCAMERA camCommit 0;
	sleep 2; //21
	uiNamespace getVariable "Overlay" displayCtrl 2 ctrlShow false;
	titleCut ["", "BLACK IN", 0.001];
	LOCALCAMERA camPreparePos getPosATL introcampos22;
	LOCALCAMERA camPrepareTarget getPosATL introcampos22;
	LOCALCAMERA camCommitPrepared 3.75;
	sleep 2; //23
	LOCALCAMERA camPreparePos getPosATL introcampos22;
	LOCALCAMERA camPrepareTarget getPosATL introcamtar22;
	LOCALCAMERA camCommitPrepared 2;
	sleep 0.5;
	_amb setPos [8246.641, 10145.6, 2]; 
	_amb setVectorDirAndUp [[1,0.9,0],[-0.9,1,0]]; 
	_amb setVelocity [-32, 0, 0];
	sleep 1.25;
	cutRsc ["GUI50", "BLACK"];
	//Rest credit
	uiNamespace getVariable "Overlay" displayCtrl 2 ctrlSetTextColor [1, 1, 1, 1];
	uiNamespace getVariable "Overlay" displayCtrl 2 ctrlSetText "Prohuntersx [Level design]	    Bluebär [AI Design]     Predator [Tester]     Ace [Tester]     M. Mro [Tester]     Treyarch|EA|Dice [Sound]";
	uiNamespace getVariable "Overlay" displayCtrl 2 ctrlShow true;
	introscenery1 hideObjectGlobal false;
	introscenery2 hideObjectGlobal false;
	introscenery3 hideObjectGlobal false;
	introscenery4 hideObjectGlobal false;
	introscenery5 hideObjectGlobal false;
	introscenery6 hideObjectGlobal false;
	sleep 1.5;
	LOCALCAMERA camsetPos getPosATL introcampos31;
	LOCALCAMERA camSetTarget getPosATL introcampos32;
	LOCALCAMERA camCommit 0;
	sleep 2.5;
	uiNamespace getVariable "Overlay" displayCtrl 2 ctrlShow false;
	uiNamespace getVariable "Overlay" displayCtrl 3 ctrlShow false;
	uiNamespace getVariable "Overlay" displayCtrl 4 ctrlShow false;
	titleCut ["", "BLACK IN", 0.001];
	LOCALCAMERA camPreparePos getPosATL introcampos32;
	LOCALCAMERA camPrepareTarget getPosATL introcamtar31;
	LOCALCAMERA camCommitPrepared 5;
	sleep 5;
	LOCALCAMERA camPreparePos getPosATL introcamtar31;
	LOCALCAMERA camPrepareTarget getPosATL introcampos33;
	LOCALCAMERA camCommitPrepared 1.5;
	sleep 1.5;
	LOCALCAMERA camPreparePos getPosATL introcampos33;
	LOCALCAMERA camPrepareTarget getPosATL introcampos34;
	LOCALCAMERA camCommitPrepared 1.5;
	sleep 1.5;
	LOCALCAMERA camPrepareTarget getPosATL introcamtar32;
	LOCALCAMERA camCommitPrepared 1;
	sleep 1;
	LOCALCAMERA camPreparePos getPosATL introcampos34;
	LOCALCAMERA camPrepareTarget getPosATL introcamtar32;
	LOCALCAMERA camCommitPrepared 0.5;
	sleep 0.5;
	deleteVehicle _amb;
	cutRsc ["GUI50", "BLACK"];
	//Dev credit
	uiNamespace getVariable "Overlay" displayCtrl 1 ctrlSetTextColor [1, 1, 1, 1];
	uiNamespace getVariable "Overlay" displayCtrl 1 ctrlSetText "Night of the Undead";
	uiNamespace getVariable "Overlay" displayCtrl 1 ctrlShow true;
	sleep 1;
	LoadIcon = true;
	execVM "Local_Scripts\localLoadingIcon.sqf";
	sleep 2;
	uiNamespace getVariable "Overlay" displayCtrl 1 ctrlShow false;
	cutRsc ["GUI1000", "BLACK"];
	uiNamespace getVariable "Overlay" displayCtrl 1 ctrlShow false;
	uiNamespace getVariable "Overlay" displayCtrl 2 ctrlShow false;
	uiNamespace getVariable "Overlay" displayCtrl 3 ctrlShow false;
	uiNamespace getVariable "Overlay" displayCtrl 4 ctrlShow false;
	uiNamespace getVariable "Overlay" displayCtrl 5 ctrlShow false;
	uiNamespace getVariable "Overlay" displayCtrl 6 ctrlShow false;
	uiNamespace getVariable "Overlay" displayCtrl 7 ctrlShow false;
	uiNamespace getVariable "Overlay" displayCtrl 8 ctrlShow false;
	uiNamespace getVariable "Overlay" displayCtrl 9 ctrlShow false;
	uiNamespace getVariable "Overlay" displayCtrl 10 ctrlShow false;
	uiNamespace getVariable "Overlay" displayCtrl 11 ctrlShow false;
	uiNamespace getVariable "Overlay" displayCtrl 12 ctrlShow false;
	uiNamespace getVariable "Overlay" displayCtrl 13 ctrlShow false;
	uiNamespace getVariable "Overlay" displayCtrl 14 ctrlShow false;
	uiNamespace getVariable "Overlay" displayCtrl 15 ctrlShow false;
	uiNamespace getVariable "Overlay" displayCtrl 16 ctrlShow false;
	uiNamespace getVariable "Overlay" displayCtrl 17 ctrlShow false;
	uiNamespace getVariable "Overlay" displayCtrl 18 ctrlShow false;
	uiNamespace getVariable "Overlay" displayCtrl 19 ctrlShow false;
	uiNamespace getVariable "Overlay" displayCtrl 20 ctrlShow false;
	uiNamespace getVariable "Overlay" displayCtrl 21 ctrlShow false;
	uiNamespace getVariable "Overlay" displayCtrl 22 ctrlShow false;
	uiNamespace getVariable "Overlay" displayCtrl 23 ctrlShow false;
	uiNamespace getVariable "Overlay" displayCtrl 24 ctrlShow false;
	uiNamespace getVariable "Overlay" displayCtrl 25 ctrlShow false;
	uiNamespace getVariable "Overlay" displayCtrl 26 ctrlShow false;
	uiNamespace getVariable "Overlay" displayCtrl 27 ctrlShow false;
	uiNamespace getVariable "Overlay" displayCtrl 28 ctrlShow false;
};