private [
	"_weapon",
	"_hasWeapon",
	"_ADR97",
	"_AK12",
	"_AKM",
	"_AKS",
	"_CAR95",
	"_CMR",
	"_Cyrus",
	"_GM6Lynx",
	"_Katiba",
	"_LIM85",
	"_M230",
	"_MK1EMR",
	"_Mk14",
	"_Mk18ABR",
	"_Mk20",
	"_Mk200",
	"_MX",
	"_MXC",
	"_MXM",
	"_Navid",
	"_Rahim",
	"_SPAR16",
	"_SPAR16S",
	"_SPAR17",
	"_SPMG338",
	"_Sting",
	"_TRG20",
	"_Type115",
	"_Vermin",
	"_PDW",
	"_Protector",
	
	"_RPG7",
	"_4Five",
	"_P07",
	"_PM",
	"_Rook",
	"_Zubr",
	"_weapons",
	"_playerVest",
	"_playerVestInventory",
	"_playerBackpackData",
	"_playerUniformData",
	"_playerLoadout",
	"_playerBackpack",
	"_playerVestData"

];

_ADR97 = ["ADR-97 TR 5.7 mm","SMG_03_TR_black","50Rnd_570x28_SMG_03",6,"Weapon_SMG_03_TR_black"];
_AK12 = ["AK-12 7.62 mm","arifle_AK12_F","30Rnd_762x39_Mag_F",10,"Weapon_arifle_AK12_F"];
_AKM = ["AKM 7.62 mm","arifle_AKM_F","30Rnd_762x39_Mag_F",10,"Weapon_arifle_AKM_F"];
_AKS = ["AKS-74U 5.45 mm","arifle_AKS_F","30Rnd_545x39_Mag_F",10,"Weapon_arifle_CTAR_blk_F"];
_CAR95 = ["CAR-95 5.8 mm","arifle_CTAR_blk_F","30Rnd_580x42_Mag_F",3,"Weapon_arifle_CTAR_blk_F"];
_CMR = ["CMR-76 6.5 mm","srifle_DMR_07_blk_F","20Rnd_650x39_Cased_Mag_F",15,"Weapon_srifle_DMR_07_blk_F"];
_Cyrus = ["Cyrus 9.3 mm","srifle_DMR_05_blk_F","10Rnd_93x64_DMR_05_Mag",15,"Weapon_srifle_DMR_05_blk_F"];
_GM6Lynx = ["GM6 Lynx 12.7 mm","srifle_GM6_ghex_F","5Rnd_127x108_Mag",15,"Weapon_srifle_GM6_ghex_F"];
_Katiba = ["Katiba 6.5 mm","arifle_Katiba_F","30Rnd_65x39_caseless_green",10,"Weapon_arifle_Katiba_F"];
_LIM85 = ["LIM-85 5.56 mm","LMG_03_F","200Rnd_556x45_Box_F",2,"Weapon_LMG_03_F"];
_M230 = ["M320 LRR .408","srifle_LRR_F","7Rnd_408_Mag",10,"Weapon_srifle_LRR_F"];
_MK1EMR = ["Mk-I EMR 7.62 mm","srifle_DMR_03_F","20Rnd_762x51_Mag",10,"Weapon_srifle_DMR_03_F"];
_Mk14  = ["Mk14 7.62 mm","srifle_DMR_06_camo_F","20Rnd_762x51_Mag",10,"Weapon_srifle_DMR_06_camo_F"];
_Mk18ABR = ["Mk18 ABR 7.62 mm","srifle_EBR_MRCO_LP_BI_F","20Rnd_762x51_Mag",10,"Weapon_srifle_EBR_F"];
_Mk20 = ["Mk20 5.56 mm","arifle_Mk20_F","30Rnd_556x45_Stanag",10,"Weapon_LMG_Mk200_F"];
_Mk200 = ["Mk200 6.5 mm","LMG_Mk200_F","200Rnd_65x39_cased_Box",2,"Weapon_LMG_Mk200_F"];
_MXC = ["MXC 6.5 mm","arifle_MXC_F","30Rnd_65x39_caseless_mag",10,"Weapon_arifle_MXC_Black_F"];
_MXM = ["MXM 6.5 mm","arifle_MXM_F","30Rnd_65x39_caseless_mag",10,"Weapon_arifle_MXM_Black_F"];
_Navid = ["Navid 9.3 mm","MMG_01_hex_F","150Rnd_93x64_Mag",2,"Weapon_MMG_01_hex_F"];
_Rahim = ["Rahim 7.62 mm","srifle_DMR_01_F","10Rnd_762x54_Mag",10,"Weapon_srifle_DMR_01_F"];
_SPAR16 = ["SPAR-16 5.56 mm","arifle_SPAR_01_blk_F","30Rnd_556x45_Stanag",10,"Weapon_arifle_SPAR_01_blk_F"];
_SPAR16S = ["SPAR-16S 5.56 mm","arifle_SPAR_02_blk_F","150Rnd_556x45_Drum_Mag_F",2,"Weapon_arifle_SPAR_02_blk_F"];
_SPAR17 = ["SPAR-17 7.62 mm","arifle_SPAR_03_blk_F","20Rnd_762x51_Mag",10,"Weapon_arifle_SPAR_03_blk_F"];
_SPMG338 = ["SPMG .338","MMG_02_camo_F","130Rnd_338_Mag",2,"Weapon_MMG_02_camo_F"];
_Sting = ["Sting 9 mm","SMG_02_F","30Rnd_9x21_Mag_SMG_02",10];
_TRG20 = ["TRG-20 5.56 mm","arifle_TRG20_F","30Rnd_556x45_Stanag",10,"Weapon_arifle_TRG20_F"];
_Type115 = ["Type 115 6.5 mm","arifle_ARX_blk_F","30Rnd_65x39_caseless_green",10,"Weapon_arifle_ARX_blk_F"];
_Vermin = ["Vermin SMG .45 ACP","SMG_01_F","30Rnd_45ACP_Mag_SMG_01",10,"Weapon_SMG_01_F"];
_PDW = ["PDW2000 9 mm","hgun_PDW2000_F","30Rnd_9x21_Mag",10,"Weapon_hgun_PDW2000_F"];
_Protector = ["Protector 9 mm","SMG_05_F","30Rnd_9x21_Mag_SMG_02",10,"Weapon_SMG_05_F"];
_RPG7 = ["RPG-7","launch_RPG7_F","RPG7_F",2,"Weapon_launch_RPG7_F"];
_4Five = ["4-five .45 ACP","B_Patrol_Soldier_Pistol_F","11Rnd_45ACP_Mag",4,"Weapon_hgun_Pistol_heavy_01_F"];
_P07 = ["P07 9 mm","hgun_P07_khk_F","16Rnd_9x21_Mag",4,"Weapon_hgun_P07_khk_F"];
_PM = ["PM 9 mm","hgun_Pistol_01_F","10Rnd_9x21_Mag",4,"Weapon_hgun_Pistol_01_F"];
_Rook = ["Rook-40 9 mm","hgun_Rook40_F","16Rnd_9x21_Mag",4,"Weapon_hgun_Rook40_F"];
_Zubr = ["Zubr .45 ACP","hgun_Pistol_heavy_02_Yorris_F","6Rnd_45ACP_Cylinder",4,"Weapon_hgun_Pistol_heavy_02_F"];

_weapons = [];
_weapons pushBack _ADR97;
_weapons pushBack _AK12;
_weapons pushBack _AKM;
_weapons pushBack _AKS;
_weapons pushBack _CAR95;
_weapons pushBack _CMR;
_weapons pushBack _Cyrus;
_weapons pushBack _GM6Lynx;
_weapons pushBack _Katiba;
_weapons pushBack _LIM85;
_weapons pushBack _M230;
_weapons pushBack _MK1EMR;
_weapons pushBack _Mk14;
_weapons pushBack _Mk18ABR;
_weapons pushBack _Mk20;
_weapons pushBack _Mk200;
_weapons pushBack _MXC;
_weapons pushBack _MXM;
_weapons pushBack _Navid;
_weapons pushBack _Rahim;
_weapons pushBack _SPAR16;
_weapons pushBack _SPAR16S;
_weapons pushBack _SPAR17;
_weapons pushBack _SPMG338;
_weapons pushBack _Sting;
_weapons pushBack _TRG20;
_weapons pushBack _Type115;
_weapons pushBack _Vermin;
_weapons pushBack _PDW;
_weapons pushBack _Protector;
//_weapons pushBack _RPG7;
_weapons pushBack _4Five;
_weapons pushBack _P07;
_weapons pushBack _PM;
_weapons pushBack _Rook;
_weapons pushBack _Zubr;

_weapon = _this select 0;
_hasWeapon = _this select 1;
diag_log "initial debug";
diag_log _weapon;
diag_log _hasWeapon;
if (_hasWeapon)
then
{
	for "_x" from 1 to (count _weapons) do 
	{ 
		_temp = _weapons select (_x - 1);
		if (_temp select 1 == _weapon)
		then
		{
			if ((_temp select 1) == "launch_RPG7_F")
			then
			{
			}
			else
			{
				if  ((_weapon == "hgun_P07_khk_F") || (_weapon == "B_Patrol_Soldier_Pistol_F") || (_weapon == "hgun_Pistol_01_F") || (_weapon == "hgun_Rook40_F") || (_weapon == "hgun_Pistol_heavy_02_Yorris_F"))
				then
				{
					_playerVest = vest player;
					removeVest player;
					player addvest _playerVest;
					_playerBackpackData = (getUnitLoadout player) select 5;
					_playerUniformData = (getUnitLoadout player) select 3;
					removeBackpack player;
					removeUniform player;
					for "_x" from 1 to (_temp select 3) do
					{
						player addMagazine (_temp select 2);
					};
					_playerLoadout = (getUnitLoadout player);
					_playerLoadout set [5,_playerBackpackData];
					_playerLoadout set [3,_playerUniformData];
					player setUnitLoadout _playerLoadout;
					
					
					
				}
				else
				{
					_playerBackpack = backpack player;
					removeBackpack player;
					player addBackpack _playerBackpack;
					_playerVestData = (getUnitLoadout player) select 4;
					_playerUniformData = (getUnitLoadout player) select 3;
					removeVest player;
					removeUniform player;
					for "_x" from 1 to (_temp select 3) do
					{
						player addMagazine (_temp select 2);
					};
					_playerLoadout = (getUnitLoadout player);
					_playerLoadout set [4,_playerVestData];
					_playerLoadout set [3,_playerUniformData];
					player setUnitLoadout _playerLoadout;
				};
			};
		};
	};
}
else
{
for "_x" from 1 to (count _weapons) do 
	{ 
		_temp = _weapons select (_x - 1);
		diag_log "add debug";
		diag_log _temp select 1;
		diag_log _weapon;
		if (_temp select 1 == _weapon)
		then
		{
			if ((_temp select 1) == "launch_RPG7_F")
			then
			{
			}
			else
			{
				if  ((_weapon == "hgun_P07_khk_F") || (_weapon == "B_Patrol_Soldier_Pistol_F") || (_weapon == "hgun_Pistol_01_F") || (_weapon == "hgun_Rook40_F") || (_weapon == "hgun_Pistol_heavy_02_Yorris_F"))
				then
				{
					_playerVest = vest player;
					removeVest player;
					player addvest _playerVest;
					_playerBackpackData = (getUnitLoadout player) select 5;
					_playerUniformData = (getUnitLoadout player) select 3;
					removeBackpack player;
					removeUniform player;
					for "_x" from 1 to (_temp select 3) do
					{
						player addMagazine (_temp select 2);
					};
					_playerLoadout = (getUnitLoadout player);
					_playerLoadout set [5,_playerBackpackData];
					_playerLoadout set [3,_playerUniformData];
					player setUnitLoadout _playerLoadout;
					
					
					
				}
				else
				{
					_playerBackpack = backpack player;
					removeBackpack player;
					player addBackpack _playerBackpack;
					_playerVestData = (getUnitLoadout player) select 4;
					_playerUniformData = (getUnitLoadout player) select 3;
					removeVest player;
					removeUniform player;
					for "_x" from 1 to (_temp select 3) do
					{
						player addMagazine (_temp select 2);
					};
					_playerLoadout = (getUnitLoadout player);
					_playerLoadout set [4,_playerVestData];
					_playerLoadout set [3,_playerUniformData];
					player setUnitLoadout _playerLoadout;
				};
			};
		};
	};
	player addWeapon _weapon;
};