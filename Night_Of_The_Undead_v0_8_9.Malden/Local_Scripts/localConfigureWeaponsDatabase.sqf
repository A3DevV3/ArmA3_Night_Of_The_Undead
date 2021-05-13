private [
	"_CAR95",
	"_GM6Lynx",
	"_LIM85",
	"_Mk20",
	"_Mk200",
	"_MXC",
	"_SPAR16",
	"_TRG20",
	"_Vermin",
	"_RPG7",
	"_4Five",
	"_P07",
	"_Zubr",
	
	
	"_weapons"
];

//Format 
//					0							1								2							3							4				5									6									7		8
// VAR NAME = 	[ WEAPON NAME 			| WEAPON TYPE NAME 				| STANDARD AMMO 			| STANDARD MAG COUNT 		| CLIP SIZE 		| PAP AMMO 							|Equipment Name (MysteryBox)		|Type		|PackMuleMagCount]
_CAR95 = 		["CAR-95 5.8 mm",		"arifle_CTAR_blk_F",			"30Rnd_580x42_Mag_F",		4,							30,					"30Rnd_762x39_Mag_Tracer_Green_F"	,"Weapon_arifle_CTAR_blk_F",		"Primary",	6];
_GM6Lynx = 		["GM6 Lynx 12.7 mm",	"srifle_GM6_F",					"5Rnd_127x108_Mag",			2,							5,					"5Rnd_127x108_APDS_Mag"				,"Weapon_srifle_GM6_F",				"Primary",	4];
_LIM85 = 		["LIM-85 5.56 mm",		"LMG_03_F",						"200Rnd_556x45_Box_F",		1,							200,				"Weapon_LMG_03_F"					,"200Rnd_556x45_Box_Tracer_Red_F",	"Primary",	2];
_Mk20 = 		["Mk20 5.56 mm",		"arifle_Mk20_F",				"30Rnd_556x45_Stanag",		4,							30,					"30Rnd_762x39_Mag_Tracer_Green_F"	,"Weapon_arifle_Mk20_plain_F",		"Primary",	6];
_Mk200 = 		["Mk200 6.5 mm",		"LMG_Mk200_F",					"200Rnd_65x39_cased_Box",	1,							200,				"200Rnd_65x39_cased_Box_Tracer_Red"	,"Weapon_LMG_Mk200_F",				"Primary",	2];
_MXC = 			["MXC 6.5 mm",			"arifle_MXC_F",					"100Rnd_65x39_caseless_mag",2,							100,				"100Rnd_65x39_caseless_mag_Tracer"	,"Weapon_arifle_MXC_Black_F",		"Primary",	4];
_SPAR16 = 		["SPAR-16 5.56 mm",		"arifle_SPAR_01_blk_F",			"150Rnd_556x45_Drum_Mag_F",	1,							150,				"150Rnd_556x45_Drum_Mag_Tracer_F"	,"Weapon_arifle_SPAR_01_blk_F",		"Primary",	2];
_TRG20 = 		["TRG-20 5.56 mm",		"arifle_TRG20_F",				"30Rnd_556x45_Stanag",		4,							30,					"30Rnd_556x45_Stanag_Tracer_Red"	,"Weapon_arifle_TRG20_F",			"Primary",	6];
_Vermin = 		["Vermin SMG .45 ACP",	"SMG_01_F",						"30Rnd_45ACP_Mag_SMG_01",	4,							30,					"30Rnd_45ACP_Mag_SMG_01_Tracer_Red"	,"Weapon_SMG_01_F",					"Primary",	6];
_RPG7 = 		["RPG-7",				"launch_RPG7_F",				"RPG7_F",					2,							1,					"RPG7_F"							,"Weapon_launch_RPG7_F",			"Launcher",	3];
_4Five = 		["4-five .45 ACP",		"B_Patrol_Soldier_Pistol_F",	"11Rnd_45ACP_Mag",			3,							11,					"11Rnd_45ACP_Mag"					,"Weapon_hgun_Pistol_heavy_01_F",	"Sidearm",	5];
_P07 = 			["P07 9 mm",			"hgun_P07_khk_F",				"16Rnd_9x21_Mag",			3,							16,					"16Rnd_9x21_Mag"					,"Weapon_hgun_P07_khk_F",			"Sidearm",	4];
_Zubr = 		["Zubr .45 ACP",		"hgun_Pistol_heavy_02_F",		"6Rnd_45ACP_Cylinder",		3,							6,					"6Rnd_45ACP_Cylinder"				,"Weapon_hgun_Pistol_heavy_02_F",	"Sidearm",	5];

_weapons = [];
_weapons pushBack _CAR95;
_weapons pushBack _GM6Lynx;
//_weapons pushBack _LIM85; //Main belt has yellow tracers staggered | Remove for now as it poses problems with PAP
_weapons pushBack _Mk20;
_weapons pushBack _Mk200; //Main belt has yellow tracers staggered
_weapons pushBack _MXC;
_weapons pushBack _SPAR16;
_weapons pushBack _TRG20;
_weapons pushBack _Vermin;
_weapons pushBack _RPG7;
_weapons pushBack _4Five;
_weapons pushBack _P07;
_weapons pushBack _Zubr;

WEAPONSDB = _weapons;