
/*

JSP_Garrison_Radius Script
Version 1.2
by Jakerod
------------
Parameter Set-Up
This area sets up the parameters.

	markername = the marker that you want the radius to be centered around.

	percentBuildGar = the percentage of buildings that you want to have men in. (ex. .1 means me will be in 10% of the buildings)

	percentPosGar = the percentage of positions that men will appear in (ex. .1 means that men will be in 10% of possible positions within the radius)

	minSkillValue = the minimum amount of skill you want the units to have.

	maxSkillValue = the maximum amount of skill you want the units to have.

	factionselection = the faction that one wishes the men to be part of.
	
		Possible Actions Are:

			0 - Takistan Militia
			1 - Takistan Army
			2 - Takistan Militia and Takistan Army
			3 - Takistan Locals
			4 - Takistan Miltia and Takistan Locals (Allied)
			5 - US Army
			6 - UK Army
			7 - CDF
			8 - Chedaki (Insurgents)
			9 - NAPA (Guerillas)	
			10 - Russian Army
			11 - US Marines
			12 - Czech Army
			13 - United Nations (UNO)
			14 - PMC

	initialSpawn = the marker at which the units spawn at before they are teleported into their positions (put this far away).
	PosWindowOnOff = tells whether men should be at windows (0 means No; 1 means Yes)
	PosDoorsOnOff = tells whether men should be at doors (0 means No; 1 means Yes)
	PosRoofOnOff = tells whether men should be on rooftops (0 means No; 1 means Yes)
	PosBalconyOnOff = tells whether men should be on balconies (0 means No; 1 means Yes)

***The additional variables are placeholders for ones that appear later.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

_markername = _this select 0;
_radius_check = _this select 1;
_percentBuildGar = _this select 2; 
_percentPosGar = _this select 3; 
_minSkillValue = _this select 4;
_maxSkillValue = _this select 5; 
_factionselection = _this select 6;
_initialSpawn = _this select 7;
_PosWindowOnOff = _this select 8;
_PosDoorOnOff = _this select 9;
_PosRoofOnOff = _this select 10;
_PosBalconyOnOff = _this select 11;

_sqdPosPos = 0;
_rifPosPos = 0;
_atPosPos = 0;
_mgPosPos = 0;
_atmgPosPos = 0;
_snipPosPos = 0;
_unitrank = "Corporal";

/*
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		END OF PARAMETER SET-UP
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	Building Set-Up Section
	---------------------------------------
		This area defines the types of buildings that will be filled and their array names.
		If adding a custom building into the possibilities you must create a unique array name and then set the classname

			Example:
				_unique_array_name = (getmarkerpos _markername) nearObjects ["class name of object, must be in quotes", _radius_check];
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

_buildinglist = (getmarkerpos _markername) nearObjects ["house", _radius_check];
_HL_1_list = (getmarkerpos _markername) nearObjects ["Land_House_L_1_EP1", _radius_check];
_HL_1d_list = (getmarkerpos _markername) nearObjects ["Land_House_L_1_dam_EP1", _radius_check];
_HL_3_list = (getmarkerpos _markername) nearObjects ["Land_House_L_3_EP1", _radius_check];
_HL_3d_list = (getmarkerpos _markername) nearObjects ["Land_House_L_3_dam_EP1", _radius_check];
_HL_4_list = (getmarkerpos _markername) nearObjects ["Land_House_L_4_EP1", _radius_check];
_HL_4d_list = (getmarkerpos _markername) nearObjects ["Land_House_L_4_dam_EP1", _radius_check];
_HL_6_list = (getmarkerpos _markername) nearObjects ["Land_House_L_6_EP1", _radius_check];
_HL_6d_list = (getmarkerpos _markername) nearObjects ["Land_House_L_6_dam_EP1", _radius_check];
_HL_7_list = (getmarkerpos _markername) nearObjects ["Land_House_L_7_EP1", _radius_check];
_HL_7d_list = (getmarkerpos _markername) nearObjects ["Land_House_L_7_dam_EP1", _radius_check];
_HL_8_list = (getmarkerpos _markername) nearObjects ["Land_House_L_8_EP1", _radius_check];
_HL_8d_list = (getmarkerpos _markername) nearObjects ["Land_House_L_8_dam_EP1", _radius_check];
_HL_9_list = (getmarkerpos _markername) nearObjects ["Land_House_L_9_EP1", _radius_check];
_HK_1_list = (getmarkerpos _markername) nearObjects ["Land_House_K_1_EP1", _radius_check];
_HK_3_list = (getmarkerpos _markername) nearObjects ["Land_House_K_3_EP1", _radius_check];
_HK_5_list = (getmarkerpos _markername) nearObjects ["Land_House_K_5_EP1", _radius_check];
_HK_6_list = (getmarkerpos _markername) nearObjects ["Land_House_K_6_EP1", _radius_check];
_HK_7_list = (getmarkerpos _markername) nearObjects ["Land_House_K_7_EP1", _radius_check];
_HK_8_list = (getmarkerpos _markername) nearObjects ["Land_House_K_8_EP1", _radius_check];
_HC_1_list = (getmarkerpos _markername) nearObjects ["Land_House_C_1_EP1", _radius_check];
_HC_1_list = (getmarkerpos _markername) nearObjects ["Land_House_C_1_EP1", _radius_check];
_HC_1v2_list = (getmarkerpos _markername) nearObjects ["Land_House_C_1_v2_EP1", _radius_check];
_HC_2_list = (getmarkerpos _markername) nearObjects ["Land_House_C_2_EP1", _radius_check];
_HC_3_list = (getmarkerpos _markername) nearObjects ["Land_House_C_3_EP1", _radius_check];
_HC_4_list = (getmarkerpos _markername) nearObjects ["Land_House_C_4_EP1", _radius_check];
_HC_5_list = (getmarkerpos _markername) nearObjects ["Land_House_C_5_EP1", _radius_check];
_HC_5v1_list = (getmarkerpos _markername) nearObjects ["Land_House_C_5_v1_EP1", _radius_check];
_HC_5v2_list = (getmarkerpos _markername) nearObjects ["Land_House_C_5_v2_EP1", _radius_check];
_HC_5v3_list = (getmarkerpos _markername) nearObjects ["Land_House_C_5_v3_EP1", _radius_check];
_HC_9_list = (getmarkerpos _markername) nearObjects ["Land_House_C_9_EP1", _radius_check];
_HC_10_list = (getmarkerpos _markername) nearObjects ["Land_House_C_10_EP1", _radius_check];
_HC_11_list = (getmarkerpos _markername) nearObjects ["Land_House_C_11_EP1", _radius_check];
_HC_12_list = (getmarkerpos _markername) nearObjects ["Land_House_C_12_EP1", _radius_check];
_HMB_1_list =  (getmarkerpos _markername) nearObjects ["Land_Mil_Barracks_i_EP1", _radius_check];
_HFS_1_list = (getmarkerpos _markername) nearObjects ["Land_Ind_FuelStation_Build_EP1", _radius_check];
_HFS_2_list = (getmarkerpos _markername) nearObjects ["Land_FuelStation_Build_PMC", _radius_check];
_HIG_1_list = (getmarkerpos _markername) nearObjects ["Land_Ind_Garage01_EP1", _radius_check];
_HIS_1_list = (getmarkerpos _markername) nearObjects ["Land_Shed_Ind02", _radius_check];
_HMQT_1_list =  (getmarkerpos _markername) nearObjects ["Land_A_Minaret_EP1", _radius_check];
_HMQT_2_list =  (getmarkerpos _markername) nearObjects ["Land_A_Minaret_Porto_EP1", _radius_check];
_HMQHQ_1_list =  (getmarkerpos _markername) nearObjects ["Land_A_Mosque_big_hq_EP1", _radius_check];
_HMQHQ_2_list =  (getmarkerpos _markername) nearObjects ["Land_A_Mosque_big_addon_EP1", _radius_check];
_HMQB_1_list =  (getmarkerpos _markername) nearObjects ["Land_A_Mosque_big_minaret_1_EP1", _radius_check];
_HMQB_2_list =  (getmarkerpos _markername) nearObjects ["Land_A_Mosque_big_minaret_2_EP1", _radius_check];
_HMQW_1_list =  (getmarkerpos _markername) nearObjects ["Land_A_Mosque_big_wall_EP1", _radius_check];
_HMQW_2_list =  (getmarkerpos _markername) nearObjects ["Land_A_Mosque_big_wall_gate_EP1", _radius_check];
_HMQW_3_list =  (getmarkerpos _markername) nearObjects ["Land_A_Mosque_big_wall_corner_EP1", _radius_check];
_HMQS_1_list =  (getmarkerpos _markername) nearObjects ["Land_A_Mosque_small_1_EP1", _radius_check];
_HMQS_2_list =  (getmarkerpos _markername) nearObjects ["Land_A_Mosque_small_2_EP1", _radius_check];
_HMB_2_list =  (getmarkerpos _markername) nearObjects ["Land_Barrack2", _radius_check];
_HOff_1_list =  (getmarkerpos _markername) nearObjects ["Land_A_Office01_EP1", _radius_check];
_HSta_1_list =  (getmarkerpos _markername) nearObjects ["Land_A_Stationhouse_ep1", _radius_check];
_HWIP_1_list =  (getmarkerpos _markername) nearObjects ["Land_A_BuildingWIP_EP1", _radius_check];
_HVil_1_list =  (getmarkerpos _markername) nearObjects ["Land_A_Villa_EP1", _radius_check];
_HGS_1_list =  (getmarkerpos _markername) nearObjects ["Land_GeneralStore_01a_PMC", _radius_check];
_bunker_1_list =  (getmarkerpos _markername) nearObjects ["Land_fortified_nest_big_EP1", _radius_check];
_bunker_2_list =  (getmarkerpos _markername) nearObjects ["Land_fortified_nest_small_EP1", _radius_check];
_land_vez_list =  (getmarkerpos _markername) nearObjects ["Land_vez", _radius_check];
_coltan_mine2_list =  (getmarkerpos _markername) nearObjects ["Land_Ind_Coltan_Main_EP1", _radius_check];
_oil_tower_1_list =  (getmarkerpos _markername) nearObjects ["Land_Ind_Oil_Tower_EP1", _radius_check];
_mil_hanger_1_list =   (getmarkerpos _markername) nearObjects ["Land_Mil_hangar_EP1", _radius_check];


/*
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		END OF BUILDING SET-UP Section
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Start of the Production Unit Factory
---------------------------------------
The script must know which type of soldier to put into a specific place in a building and that is what this section is for.
In this section you will find the "Faction Unit Library", "Faction Selection Area", and "Unit Array Count Area".
*/

/*
	Faction Unit Library
	----------------------
		There are five different categories of soldiers in this script by default; Riflemen, Anti-Tank, Machine-Gun, Anti-Tank or Machine-Gun, and Sniper.
			Each is represented by its own handle; 
				rifPosPos = Rifleman
				atPosPos = Anti-tank
				mgPosPos = Machinegunners
				atmgPosPos = Anti-Tank or Machinegunners
				snipPosPos = Sniper
					*PosPos is short for Possible Position (ex. rifPosPos = Rifleman Possible Position, a rifleman will spawn here)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

///Takistan Militia

	_tkm_rifPosPos = 
		[
		"TK_INS_Soldier_EP1",
		"TK_INS_Soldier_EP1",
		"TK_INS_Soldier_EP1",
		"TK_INS_Soldier_4_EP1",
		"TK_INS_Soldier_4_EP1",
		"TK_INS_Soldier_4_EP1",
		"TK_INS_Soldier_3_EP1",
		"TK_INS_Soldier_AAT_EP1",
		"TK_INS_Soldier_TL_EP1",
		"TK_INS_Soldier_AR_EP1",
		"TK_INS_Soldier_2_EP1"
		];

	_tkm_atPosPos = 
		[
		"TK_INS_Soldier_AT_EP1"
		];

	_tkm_mgPosPos = 
		[
		"TK_INS_Soldier_MG_EP1"
		];

	_tkm_atmgPosPos =
		[
		"TK_INS_Soldier_MG_EP1",
		"TK_INS_Soldier_MG_EP1",
		"TK_INS_Soldier_AT_EP1",
		"TK_INS_Soldier_AT_EP1",
		"TK_INS_Soldier_AR_EP1",
		"TK_INS_Soldier_EP1",
		"TK_INS_Soldier_EP1",
		"TK_INS_Soldier_4_EP1",
		"TK_INS_Soldier_4_EP1",
		"TK_INS_Soldier_3_EP1",
		"TK_INS_Soldier_AAT_EP1",
		"TK_INS_Soldier_TL_EP1"
		];

	_tkm_snipPosPos = 
		[
		"TK_INS_Soldier_Sniper_EP1",
		"TK_INS_Soldier_Sniper_EP1",
		"TK_INS_Soldier_Sniper_EP1",
		"TK_INS_Soldier_Sniper_EP1",
		"TK_INS_Soldier_EP1",
		"TK_INS_Soldier_4_EP1",
		"TK_INS_Soldier_3_EP1"
		];

///Takistan Army

	_tka_rifPosPos = 
		[
		"TK_Soldier_EP1",
		"TK_Soldier_EP1",
		"TK_Soldier_B_EP1",
		"TK_Soldier_EP1",
		"TK_Soldier_EP1",
		"TK_Soldier_B_EP1",
		"TK_Soldier_AR_EP1",
		"TK_Soldier_GL_EP1",
		"TK_Soldier_SL_EP1"
		];

	_tka_atPosPos = 
		[
		"TK_Soldier_AT_EP1",
		"TK_Soldier_LAT_EP1"
		];

	_tka_mgPosPos = 
		[
		"TK_Soldier_MG_EP1"
		];

	_tka_atmgPosPos = 
		[
		"TK_Soldier_AT_EP1",
		"TK_Soldier_AT_EP1",
		"TK_Soldier_LAT_EP1",
		"TK_Soldier_MG_EP1",
		"TK_Soldier_MG_EP1",
		"TK_Soldier_MG_EP1",
		"TK_Soldier_AR_EP1"
		];

	_tka_snipPosPos = 
		[
		"TK_Soldier_Night_1_EP1",
		"TK_Soldier_Night_2_EP1"
		];

///Takistan Militia - Takistan Army Mix

	_tkma_rifPosPos = 
		[
		"TK_Soldier_EP1",
		"TK_Soldier_EP1",
		"TK_Soldier_B_EP1",
		"TK_Soldier_EP1",
		"TK_Soldier_EP1",
		"TK_Soldier_B_EP1",
		"TK_Soldier_AR_EP1",
		"TK_Soldier_GL_EP1",
		"TK_Soldier_SL_EP1"
		];

	_tkma_atPosPos = 
		[
		"TK_Soldier_AT_EP1",
		"TK_Soldier_LAT_EP1",
		"TK_INS_Soldier_AT_EP1"
		];

	_tkma_mgPosPos = 
		[
		"TK_Soldier_MG_EP1",
		"TK_INS_Soldier_MG_EP1"
		];

	_tkma_atmgPosPos = 
		[
		"TK_Soldier_AT_EP1",
		"TK_Soldier_LAT_EP1",
		"TK_Soldier_MG_EP1",
		"TK_Soldier_MG_EP1",
		"TK_INS_Soldier_MG_EP1",
		"TK_INS_Soldier_AT_EP1"
		];

	_tkma_snipPosPos = 
		[
		"TK_Soldier_Night_1_EP1",
		"TK_Soldier_Night_2_EP1",
		"TK_INS_Soldier_Sniper_EP1"
		];

///Takistan Locals

	_tkl_rifPosPos = 
		[
		"TK_GUE_Soldier_EP1",
		"TK_GUE_Soldier_2_EP1",
		"TK_GUE_Soldier_3_EP1",
		"TK_GUE_Soldier_4_EP1",
		"TK_GUE_Soldier_5_EP1",
		"TK_GUE_Soldier_TL_EP1",
		"TK_GUE_Soldier_AAT_EP1",
		"TK_GUE_Soldier_AR_EP1"
		];
	
	_tkl_atPosPos = 
		[
		"TK_GUE_Soldier_AT_EP1"
		];

	_tkl_mgPosPos = 
		[
		"TK_GUE_Soldier_MG_EP1",
		"TK_GUE_Soldier_MG_EP1",
		"TK_GUE_Soldier_AR_EP1"
		];

	_tkl_atmgPosPos = 
		[
		"TK_GUE_Soldier_MG_EP1",
		"TK_GUE_Soldier_AT_EP1"
		];

	_tkl_snipPosPos = 
		[
		"TK_GUE_Soldier_Sniper_EP1"
		];

///Takistan Militia - Takistan Local Mix

	_tkml_rifPosPos = 
		[
		"TK_GUE_Soldier_EP1",
		"TK_GUE_Soldier_2_EP1",
		"TK_GUE_Soldier_3_EP1",
		"TK_GUE_Soldier_4_EP1",
		"TK_GUE_Soldier_5_EP1",
		"TK_GUE_Soldier_TL_EP1",
		"TK_GUE_Soldier_AAT_EP1",
		"TK_GUE_Soldier_AR_EP1",
		"TK_INS_Soldier_EP1",
		"TK_INS_Soldier_EP1",
		"TK_INS_Soldier_EP1",
		"TK_INS_Soldier_4_EP1",
		"TK_INS_Soldier_4_EP1",
		"TK_INS_Soldier_4_EP1",
		"TK_INS_Soldier_3_EP1",
		"TK_INS_Soldier_AAT_EP1",
		"TK_INS_Soldier_TL_EP1",
		"TK_INS_Soldier_AR_EP1",
		"TK_INS_Soldier_2_EP1"
		];

	_tkml_atPosPos = 
		[
		"TK_INS_Soldier_AT_EP1",
		"TK_GUE_Soldier_AT_EP1"
		];

	_tkml_mgPosPos = 
		[
		"TK_INS_Soldier_MG_EP1",
		"TK_GUE_Soldier_MG_EP1"
		];

	_tkml_atmgPosPos = 
		[
		"TK_INS_Soldier_MG_EP1",
		"TK_INS_Soldier_AT_EP1",
		"TK_GUE_Soldier_MG_EP1",
		"TK_GUE_Soldier_AT_EP1"
		];

	_tkml_snipPosPos = 
		[
		"TK_INS_Soldier_Sniper_EP1",
		"TK_GUE_Soldier_Sniper_EP1"
		];

///US Army

	_usa_rifPosPos = 
		[
		"US_Soldier_EP1",
		"US_Soldier_GL_EP1",
		"US_Soldier_B_EP1",
		"US_Soldier_AMG_EP1",
		"US_Soldier_AAR_EP1",
		"US_Soldier_SL_EP1",
		"US_Soldier_TL_EP1"
		];

	_usa_atPosPos = 
		[
		"US_Soldier_AT_EP1",
		"US_Soldier_LAT_EP1"
		];

	_usa_mgPosPos = 
		[
		"US_Soldier_MG_EP1",
		"US_Soldier_AR_EP1"
		];

	_usa_atmgPosPos = 
		[
		"US_Soldier_MG_EP1",
		"US_Soldier_AR_EP1",
		"US_Soldier_AT_EP1"
		];

	_usa_snipPosPos = 
		[
		"US_Soldier_Marksman_EP1"
		];

///UK Army MTP

	_uka_rifPosPos = 
		[
		"BAF_Soldier_MTP",
		"BAF_Soldier_AAR_MTP",
		"BAF_Soldier_AAT_MTP",
		"BAF_Soldier_AMG_MTP",
		"BAF_Soldier_GL_MTP",
		"BAF_Soldier_TL_MTP",
		"BAF_Soldier_SL_MTP"
		];
	
	_uka_atPosPos =
		 [
		"BAF_Soldier_AT_MTP"
		];
	
	_uka_mgPosPos = 
		[
		"BAF_Soldier_MG_MTP",
		"BAF_Soldier_AR_MTP"
		];

	_uka_atmgPosPos = 
		[
		"BAF_Soldier_MG_MTP",
		"BAF_Soldier_AT_MTP"
		];

	_uka_snipPosPos = 
		[
		"BAF_Soldier_scout_MTP",
		"BAF_Soldier_Marksman_MTP"
		];

///CDF

	_cdf_rifPosPos = 
		[
		"CDF_Soldier_GL",
		"CDF_Soldier_Militia",
		"CDF_Soldier",
		"CDF_Soldier_TL"
		];

	_cdf_atPosPos = 
		[
		"CDF_Soldier_RPG"
		];

	_cdf_mgPosPos = 
		[
		"CDF_Soldier_MG",
		"CDF_Soldier_MG",
		"CDF_Soldier_AR"
		];

	_cdf_atmgPosPos = 
		[
		"CDF_Soldier_MG",
		"CDF_Soldier_RPG"
		];

	_cdf_snipPosPos = 
		[
		"CDF_Soldier_Marksman"
		];

///Chedaki

	_ins_rifPosPos = 
		[
		"INS_Soldier_2"
		];
		
	_ins_atPosPos = 
		[
		"INS_Soldier_AT"
		];

	_ins_mgPosPos = 
		[
		"INS_Soldier_MG"
		];

	_ins_atmgPosPos = 
		[
		"INS_Soldier_AT",
		"INS_Soldier_MG"
		];

	_ins_snipPosPos = 
		[
		"INS_Soldier_Sniper"
		];

///Guerillas

	_gue_rifPosPos = 
		[
		"GUE_Soldier_3",
		"GUE_Soldier_CO",
		"GUE_Soldier_GL",
		"GUE_Soldier_1",
		"GUE_Soldier_2",
		"GUE_Soldier_Sab"
		];
		
	_gue_atPosPos = 
		[
		"GUE_Soldier_AT"
		];
	
	_gue_mgPosPos = 
		[
		"GUE_Soldier_MG",
		"GUE_Soldier_AR"
		];

	_gue_atmgPosPos = 
		[
		"GUE_Soldier_AT",
		"GUE_Soldier_MG"
		];

	_gue_snipPosPos = 
		[
		"GUE_Soldier_Sniper"
		];

///Russian Army

	_rus_rifPosPos = 
		[
		"RU_Soldier_GL",
		"RU_Soldier_SL",
		"RU_Soldier_TL",
		"RU_Soldier",
		"RU_Soldier"
		];

	_rus_atPosPos = 
		[
		"RU_Soldier_AT",
		"RU_Soldier_LAT",
		"RU_Soldier_LAT"
		];

	_rus_mgPosPos = 
		[
		"RU_Soldier_MG",
		"RU_Soldier_AR"
		];

	_rus_atmgPosPos = 
		[
		"RU_Soldier_MG",
		"RU_Soldier_AR",
		"RU_Soldier_AT",
		"RU_Soldier_LAT"
		];

	_rus_snipPosPos = 
		[
		"RU_Soldier_Marksman"
		];

///USMC

	_usm_rifPosPos = 
		[
		"USMC_Soldier",
		"USMC_Soldier",
		"USMC_Soldier",
		"USMC_Soldier_GL",
		"USMC_Soldier_TL",
		"USMC_SoldierS"
		];

	_usm_atPosPos = 
		[
		"USMC_Soldier_AT",
		"USMC_Soldier_LAT",
		"USMC_Soldier_LAT"
		];

	_usm_mgPosPos = 
		[
		"USMC_Soldier_MG",
		"USMC_Soldier_AR",
		"USMC_Soldier_AR"
		];

	_usm_atmgPosPos = 
		[
		"USMC_Soldier_AT",
		"USMC_Soldier_LAT",
		"USMC_Soldier_AR",
		"USMC_Soldier_MG"
		];

	_usm_snipPosPos = 
		[
		"USMC_SoldierM_Marksman"
		];

///Czech Army

	_acr_rifPosPos = 
		[
		"CZ_Soldier_DES_EP1"
		];

	_acr_atPosPos = 
		[
		"CZ_Soldier_AT_DES_EP1"
		];

	_acr_mgPosPos = 
		[
		"CZ_Soldier_MG_DES_EP1"
		];

	_acr_atmgPosPos = 
		[
		"CZ_Soldier_MG_DES_EP1",
		"CZ_Soldier_AT_DES_EP1"
		];

	_acr_snipPosPos = 
		[
		"CZ_Soldier_B_DES_EP1"
		];

///UNO

	_uno_rifPosPos = 
		[
		"UN_CDF_Soldier_EP1",
		"UN_CDF_Soldier_B_EP1",
		"UN_CDF_Soldier_Guard_EP1",
		"UN_CDF_Soldier_Officer_EP1"
		];

	_uno_atPosPos = 
		[
		"UN_CDF_Soldier_AT_EP1"
		];

	_uno_mgPosPos = 
		[
		"UN_CDF_Soldier_MG_EP1"
		];

	_uno_atmgPosPos = 
		[
		"UN_CDF_Soldier_AT_EP1",
		"UN_CDF_Soldier_MG_EP1"
		];

	_uno_snipPosPos = 
		[
		"UN_CDF_Soldier_EP1"
		];

///PMC

	_pmc_rifPosPos = 
		[
		"Soldier_M4A3_PMC",
		"CIV_Contractor2_BAF",
		"CIV_Contractor1_BAF",
		"Soldier_bodyguard_M4_PMC",
		"Soldier_Crew_PMC",
		"Soldier_GL_M16A2_PMC",
		"Soldier_GL_PMC",
		"Soldier_PMC",
		"Soldier_TL_PMC"
		];
	
	_pmc_atPosPos = 
		[
		"Soldier_AT_PMC"
		];

	_pmc_mgPosPos = 
		[
		"Soldier_MG_PMC",
		"Soldier_MG_PKM_PMC"
		];

	_pmc_atmgPosPos = 
		[
		"Soldier_MG_PMC",
		"Soldier_AT_PMC",
		"Soldier_MG_PKM_PMC"
		];

	_pmc_snipPosPos = 
		[
		"Soldier_Sniper_PMC"
		];

///UK Army DES

	_ukd_rifPosPos = 
		[
		"BAF_Soldier_DDPM",
		"BAF_Soldier_AAR_DDPM",
		"BAF_Soldier_AAT_DDPM",
		"BAF_Soldier_AMG_DDPM",
		"BAF_Soldier_GL_DDPM",
		"BAF_Soldier_TL_DDPM",
		"BAF_Soldier_SL_DDPM"
		];
	
	_ukd_atPosPos =
		 [
		"BAF_Soldier_AT_DDPM"
		];
	
	_ukd_mgPosPos = 
		[
		"BAF_Soldier_MG_DDPM",
		"BAF_Soldier_AR_DDPM"
		];

	_ukd_atmgPosPos = 
		[
		"BAF_Soldier_MG_DDPM",
		"BAF_Soldier_AT_DDPM"
		];

	_ukd_snipPosPos = 
		[
		"BAF_Soldier_scout_DDPM",
		"BAF_Soldier_Marksman_DDPM"
		];

///UK Army Green

	_ukg_rifPosPos = 
		[
		"BAF_Soldier_W",
		"BAF_Soldier_AAR_W",
		"BAF_Soldier_AAT_W",
		"BAF_Soldier_AMG_W",
		"BAF_Soldier_GL_W",
		"BAF_Soldier_TL_W",
		"BAF_Soldier_SL_W"
		];
	
	_ukg_atPosPos =
		 [
		"BAF_Soldier_AT_W"
		];
	
	_ukg_mgPosPos = 
		[
		"BAF_Soldier_MG_W",
		"BAF_Soldier_AR_W"
		];

	_ukg_atmgPosPos = 
		[
		"BAF_Soldier_MG_W",
		"BAF_Soldier_AT_W"
		];

	_ukg_snipPosPos = 
		[
		"BAF_Soldier_scout_W",
		"BAF_Soldier_Marksman_W"
		];

/*
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		END OF FACTION UNIT LIBRARY
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	Faction Selection Area
	------------------------
		This is the area that tells the script which faction you want. Each faction has its own line.
		If you entered 0 into the second to last position of the array that you use to execute the script then the script will select the Takistan Militia.
			Example: 
				if (_factionselection == 0) then (The script selects the Takistan Militia by setting the TKM Faction Possible Positions equal to the Total Possible Positions)
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
_factionside = west;

///Takistan Militia

	if (_factionselection == 0 OR _factionselection == 25)  
		then {
			_factionside = east; 
			_rifPosPos = _tkm_rifPosPos; 
			_atPosPos = _tkm_atPosPos; 
			_mgPosPos = _tkm_mgPosPos; 
			_atmgPosPos = _tkm_atmgPosPos; 
			_snipPosPos = _tkm_snipPosPos;
		};

///Takistan Army

	if (_factionselection == 1) 
		then {
			_factionside = east; 
			_rifPosPos = _tka_rifPosPos; 
			_atPosPos = _tka_atPosPos; 
			_mgPosPos = _tka_mgPosPos; 
			_atmgPosPos = _tka_atmgPosPos; 
			_snipPosPos = _tka_snipPosPos;
		};

///Takistan Militia / Takistan Army Mix

	if (_factionselection == 2) 
		then {
			_factionside = east; 
			_rifPosPos = _tkma_rifPosPos; 
			_atPosPos = _tkma_atPosPos; 
			_mgPosPos = _tkma_mgPosPos; 
			_atmgPosPos = _tkma_atmgPosPos; 
			_snipPosPos = _tkma_snipPosPos;
		};

///Takistan  Locals

	if (_factionselection == 3) 
		then {
			_factionside = resistance; 
			_rifPosPos = _tkl_rifPosPos; 
			_atPosPos = _tkl_atPosPos; 
			_mgPosPos = _tkl_mgPosPos; 
			_atmgPosPos = _tkl_atmgPosPos; 
			_snipPosPos = _tkl_snipPosPos;
		};

///Takistan Militia / Takistan Local Mix

	if (_factionselection == 4)
		 then {
			_factionside = east; 
			_rifPosPos = _tkml_rifPosPos; 
			_atPosPos = _tkml_atPosPos; 
			_mgPosPos = _tkml_mgPosPos; 
			_atmgPosPos = _tkml_atmgPosPos; 
			_snipPosPos = _tkml_snipPosPos;
		};

///US Army

	if (_factionselection == 5)
		 then {
			_factionside = west;
			_rifPosPos = _usa_rifPosPos;
			_atPosPos = _usa_atPosPos;
			_mgPosPos = _usa_mgPosPos; 
			_atmgPosPos = _usa_atmgPosPos; 
			_snipPosPos = _usa_snipPosPos;
		};

///UK Army
	if (_factionselection == 6) 
		then {
			_factionside = west; 
			_rifPosPos = _uka_rifPosPos; 
			_atPosPos = _uka_atPosPos; 
			_mgPosPos = _uka_mgPosPos; 
			_atmgPosPos = _uka_atmgPosPos; 
			_snipPosPos = _uka_snipPosPos;
		};

///CDF

	if (_factionselection == 7)
		 then {
			_factionside = west; 
			_rifPosPos = _cdf_rifPosPos; 
			_atPosPos = _cdf_atPosPos; 
			_mgPosPos = _cdf_mgPosPos; 
			_atmgPosPos = _cdf_atmgPosPos; 
			_snipPosPos = _cdf_snipPosPos;
		};

///Chedaki

	if (_factionselection == 8)
		 then {
			_factionside = east; 
			_rifPosPos = _ins_rifPosPos; 
			_atPosPos = _ins_atPosPos; 
			_mgPosPos = _ins_mgPosPos; 
			_atmgPosPos = _ins_atmgPosPos; 
			_snipPosPos = _ins_snipPosPos;
		};

///Guerillas

	if (_factionselection == 9) 
		then {
			_factionside = resistance; 
			_rifPosPos = _gue_rifPosPos; 
			_atPosPos = _gue_atPosPos; 
			_mgPosPos = _gue_mgPosPos; 
			_atmgPosPos = _gue_atmgPosPos; 
			_snipPosPos = _gue_snipPosPos;
		};

///Russian Army

	if (_factionselection == 10) 
		then {
			_factionside = east;
			_rifPosPos = _rus_rifPosPos;
			_atPosPos = _rus_atPosPos;
			_mgPosPos = _rus_mgPosPos;
			_atmgPosPos = _rus_atmgPosPos; 
			_snipPosPos = _rus_snipPosPos;
		};

///USMC

	if (_factionselection == 11) 
		then {
			_factionside = west; 
			_rifPosPos = _usm_rifPosPos; 
			_atPosPos = _usm_atPosPos; 
			_mgPosPos = _usm_mgPosPos;
			_atmgPosPos = _usm_atmgPosPos; 
			_snipPosPos = _usm_snipPosPos;
		};

///Czech Army

	if (_factionselection == 12) 
		then {
			_factionside = west; 
			_rifPosPos = _acr_rifPosPos; 
			_atPosPos = _acr_atPosPos; 
			_mgPosPos = _acr_mgPosPos; 
			_atmgPosPos = _acr_atmgPosPos; 
			_snipPosPos = _acr_snipPosPos;
		};

///UNO

	if (_factionselection == 13) 
		then {
			_factionside = resistance; 
			_rifPosPos = _uno_rifPosPos; 
			_atPosPos = _uno_atPosPos; 
			_mgPosPos = _uno_mgPosPos; 
			_atmgPosPos = _uno_atmgPosPos; 
			_snipPosPos = _uno_snipPosPos;
		};

///PMC
	
	if (_factionselection == 14) 
		then {
			_factionside = resistance; 
			_rifPosPos = _pmc_rifPosPos; 
			_atPosPos = _pmc_atPosPos; 
			_mgPosPos = _pmc_mgPosPos; 
			_atmgPosPos = _pmc_atmgPosPos; 
			_snipPosPos = _pmc_snipPosPos;
		};

///UK Army Desert

	if (_factionselection == 15) 
		then {
			_factionside = west;
			 _rifPosPos = _ukd_rifPosPos;
			 _atPosPos = _ukd_atPosPos;
			 _mgPosPos = _ukd_mgPosPos;
			 _atmgPosPos = _ukd_atmgPosPos;
			 _snipPosPos = _ukd_snipPosPos;
		};

///UK Army Green

	if (_factionselection == 16) 
		then {
			_factionside = west; 
			_rifPosPos = _ukg_rifPosPos; 
			_atPosPos = _ukg_atPosPos; 
			_mgPosPos = _ukg_mgPosPos; 
			_atmgPosPos = _ukg_atmgPosPos; 
			_snipPosPos = _ukg_snipPosPos;
		};

/*
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------		
			END OF FACTION SELECTION AREA
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	Unit Array Count Area
	-----------------------
		This area counts the number of possible men and does not need to be edited unless adding an additional Possible Position (ex. medicPosPos)
			Explanation of Meaning:
				_rifPosPosNum = Number or Possible types of Rifleman
				_atPosPosNum = Number or Possible types of Anti-Tank Soldiers
				_mgPosPosNum = Number or Possible types of Machinegunners
				_atmgPosPosNum = Number or Possible types of Anti-Tank and Machinegunners
				_snipPosPosNum = Number or Possible types of Snipers

		Example:
			if there are 10 different types of men that can be spawned in the rifPosPos that was selected then the array will count 10 and then subtract 1 because arrays use a base 0 system.
			Therefore it will know that there are 10 different types of units in the array (0,1,2,3,4,5,6,7,8,9) and will use the _rifPosPosNum variable later on to select one randomly.
	
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

_rifPosPosNum = ((count _rifPosPos) - 1);
_atPosPosNum = ((count _atPosPos) - 1);
_mgPosPosNum = ((count _mgPosPos) - 1);
_atmgPosPosNum = ((count _atmgPosPos) - 1);
_snipPosPosNum = ((count _snipPosPos) - 1);


/*
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------		
			END OF UNIT ARRAY COUNT AREA
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	House Positions Library
	-----------------------
		This area defines the positions in the houses that units can appear in.

		IMPORTANT NOTE: 
			It is incredibly important to only add positions onto the ends of these lists. 
			If you add them in the middle or beginning of the list of positions then it will throw off which units appear in which position and create a lot more work for you.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

///House_L_1
_house_L_1_List = [
	[0.871826,-1.55762,-0.616486],
	[-0.468628,-1.91333,-0.610672],
	[-0.265747,0.536377,-0.597946]
];


///House_L_3
_house_L_3_List = [
	[2.47095,2.23193,-0.222473],
	[0.26416,0.171143,-0.222473],
	[2.61646,0.507813,-0.222473],
	[-6.02686,1.77661,-0.229202],
	[-5.7417,0.234619,-0.172028],
	[-2.88672,0.0483398,-0.246185],
	[-4.65039,1.53516,2.64725],
	[1.1842,0.563477,2.22406]
];

///House_L_4
_house_L_4_List = [
	[-4.9248,0.795898,-1.34981],
	[0.29541,-0.552368,-1.33388],
	[6.14819,1.62915,-1.06708],
	[-3.52319,3.36365,0.768433],
	[-4.23145,0.80127,1.72308]
];

///House_L_6
_house_L_6_List = [
	[-3.10278,-1.99298,-1.53476],
	[-3.15869,0.68222,-1.52507],
	[6.81128,2.18054,-1.509],
	[3.89819,-1.98239,-1.50899],
	[6.76025,2.09421,1.28101],
	[3.60205,-0.866547,1.28099],
	[3.42529,-0.0309448,1.28101]
];

///House_L_7
_house_L_7_List = [
	[-0.447754,-3.17737,-0.97998],
	[-2.8252,-6.08374,-0.931091],
	[-5.09717,2.96655,-0.647263],
	[-3.92456,3.10986,-0.651184],
	[0.5625,2.16357,-0.261154],
	[5.13916,-0.493408,-0.165512]
];


///House_L_8
_house_L_8_List = [
	[5.31592,5.72583,0.440201],
	[0.53125,5.56653,1.71164],
	[-1.43726,5.44019,1.67599],
	[-3.18311,0.695557,1.65121],
	[-3.38647,-4.27258,1.32121],
	[-1.90845,-6.01123,1.32121],
	[3.79834,5.56799,1.72716],
	[4.87573,3.19666,1.73621],
	[5.24243,3.61133,1.73621],
	[4.51929,3.89258,-0.773804],
	[1.19531,0.245728,-1.01575],
	[-2.98706,2.46497,-1.01575],
	[-1.41406,5.46545,-0.993652],
	[0.989746,5.41211,-1.01489],
	[4.06152,0.920898,-1.07404],
	[-2.81055,-1.93311,-1.54376]
];

///House_L_9
_house_L_9_List = [
	[1.10815,0.421875,-0.506271],
	[3.12842,0.557251,-0.580124],
	[-1.54468,-0.114136,-0.458908]
];

///House_K_1
_house_K_1_List = [
	[-0.366638,4.03809,1.56625],
	[-3.11285,1.49536,1.60863],
	[-3.49854,3.7019,1.54504],
	[1.40958,3.53564,1.56625],
	[3.71457,3.01953,1.56625]
];

///House_K_3
_house_K_3_List = [
	[-4.6958,-2.12619,-0.795319],
	[-0.43042,-2.65918,-0.790298],
	[1.70874,0.0116577,-0.790314],
	[-0.104492,5.75488,-0.537674],
	[1.2771,5.4859,-0.537674],
	[-2.08569,5.74408,-0.537674],
	[1.35156,5.76053,2.8172],
	[-0.601074,5.0582,2.8172],
	[2.07397,1.9064,2.98969],
	[-2.13403,0.289764,2.98969],
	[-1.67236,0.710266,2.98969],
	[1.75073,-0.582886,3.04831]
];

///House_K_5
_house_K_5_List = [
	[-1.14258,1.85571,1.52243],
	[1.32349,1.95978,1.54776],
	[2.24414,3.94958,1.72903],
	[4.77734,2.79785,2.37181],
	[4.20483,-0.0202637,2.40567],
	[-6.69385,-2.33386,0.556442]
];

///House_K_6
_house_K_6_List = [
	[3.77872,5.33203,-1.60779],
	[1.22369,4.83667,-1.60793],
	[-0.0609741,0.880615,-1.52161],
	[4.36929,-1.37158,-1.60799],
	[0.334595,-1.88477,-1.60799],
	[1.28922,4.81055,1.47142],
	[1.08121,-2.49048,1.4705],
	[-2.50858,-1.86963,1.48848],
	[-4.46823,-0.855957,1.55824],
	[-4.46686,2.36377,1.48524],
	[-2.38812,1.7915,1.48848],
	[4.37427,4.93896,4.42143],
	[2.86694,4.79517,4.42143],
	[0.578125,4.70215,4.42143],
	[1.40213,-2.49927,4.42146],
	[-2.23779,-0.897461,4.42339],
	[-1.99829,3.8457,4.40755],
	[-3.20447,1.9248,4.41515]
];

///House_K_7
_house_K_7_List = [
	[-7.63452,1.83044,-0.218369],
	[-0.537598,4.14795,-0.218369],
	[-7.45581,3.11414,-0.218369],
	[-5.47266,3.60999,-0.218369],
	[-2.39453,3.88123,-0.218369],
	[-0.71582,1.70496,-0.218369],
	[-2.9751,0.459717,1.12976],
	[-0.688965,0.917969,3.23355],
	[-1.78516,3.67505,3.33363],
	[-4.34424,0.71936,3.29033],
	[-6.74683,1.42041,3.29033],
	[-0.187012,4.09521,3.29031],
	[-2.92554,-1.13062,3.20523],
	[0.55127,-1.54089,3.20523]
];


///House_K_8
_house_K_8_List = [
	[-0.804688,-1.44373,-2.55338],
	[2.66724,-1.16748,-2.57321],
	[2.71436,-3.04028,-2.56226],
	[-2.32959,-0.335083,-2.54623],
	[-1.13818,3.39648,-2.59065],
	[1.47705,3.35498,-2.59489],
	[2.71924,-0.784668,0.248505],
	[1.93066,1.6228,0.254028],
	[2.68262,3.93335,0.254303],
	[-1.81958,3.69189,0.250885],
	[-3.87231,3.5282,0.23053],
	[1.36084,-0.387329,0.250153],
	[-2.47119,-0.330688,0.250092],
	[-1.42651,-0.763794,0.251373],
	[-0.174072,3.26477,3.35995],
	[-2.30103,-0.827148,3.35992],
	[-1.16089,-0.63501,3.43097],
	[0.0507813,1.91443,3.35999],
	[2.86499,3.30273,3.35995]
];

///House_C_1
_house_C_1_List = [
	[-8.23486,-0.137451,-0.92775],
	[-6.82837,-1.89648,-0.92775],
	[3.57593,-2.97314,-0.92775],
	[7.85718,-1.05005,-0.92775]
];

///House_C_1_v2
_house_C_1_v2_List = [
	[-7.15088,-1.3291,-1.35547],
	[-6.39795,0.0136719,-1.35547],
	[3.16138,-1.58521,-1.35547],
	[8.2373,2.31641,-1.35547]
];
///House_C_2
_house_C_2_List = [
	[-2.86084,1.9436,-2.27875],
	[-2.42041,-0.32959,-2.28658],
	[0.120117,2.42871,-2.30132],
	[5.36401,2.40552,-2.3127],
	[5.56445,-0.374512,-2.3127],
	[5.43213,3.26709,0.764496],
	[2.02905,1.55225,0.772644],
	[5.48047,-4.53809,0.80426],
	[2.14526,-4.18579,0.809158],
	[-0.468262,-3.60596,0.810181],
	[2.7605,-0.306885,0.786758],
	[5.4021,-0.251709,0.786713],
	[-4.2478,-0.813477,0.547485],
	[-2.28809,-0.41748,0.547485],
	[-3.73438,2.56372,0.547501]
];
///House_C_3
_house_C_3_List = [
	[-7.89551,-2.72266,-3.86868],
	[-8.08228,2.83203,-3.86868],
	[5.08813,-1.71973,-3.91483],
	[4.30029,2.77539,-3.91483],
	[6.79053,3.44531,-3.91481],
	[6.21802,0.575195,-3.91483],
	[6.73462,-3.14746,-0.497833],
	[4.63452,-3.09326,-0.51709],
	[6.68164,3.63086,-0.530151],
	[4.73315,3.6582,-0.529999],
	[0.831299,-3.02539,1.90303],
	[-0.634033,-3.02441,1.94284],
	[-4.91504,-3.00781,0.576141],
	[-6.81006,-3.02441,0.576141],
	[-4.55859,3.55859,0.576141],
	[-6.67139,3.29102,0.576141],
	[-0.293457,-2.27148,5.02356],
	[-7.78296,-3.22168,4.38844],
	[-7.97241,3.41113,4.26706],
	[1.23633,2.45361,5.01308],
	[4.18799,3.28271,4.12509],
	[7.73022,4.15723,4.08649],
	[8.24072,-3.20117,4.07164],
	[3.80835,-3.63379,4.07164]
];

///House_C_4
_house_C_4_List = [
	[4.45654,1.98218,-3.48355],
	[5.11157,-2.31543,-3.48355],
	[2.24097,-1.52881,-3.48354],
	[-1.18311,4.052,-2.98854],
	[-4.51245,-2.75488,-3.48355],
	[-5.25439,-1.70435,-3.48355],
	[-5.12451,2.75342,-3.48357],
	[-4.30103,4.07202,-3.48355],
	[5.53589,3.802,-0.239853],
	[2.71265,2.63452,-0.349167],
	[3.896,-5.21729,-0.27861],
	[1.68481,-5.15601,-0.278625],
	[-0.723877,-5.13721,-0.278625],
	[-5.47461,-2.91992,-0.350769],
	[-5.802,0.827393,-0.349442],
	[-1.69312,3.81885,2.29858],
	[-5.09009,2.39697,2.77975],
	[3.93896,-1.68848,2.80246]
];

///House_C_5
_house_C_5_List = [
	[3.46216,3.26099,-0.802185],
	[2.00854,4.51953,-0.802185],
	[-2.60718,3.14404,-0.802185],
	[-3.41333,1.79749,-0.8022],
	[-3.31372,-2.07349,-0.802185],
	[-2.78809,-4.57544,-0.781952],
	[-3.42603,-3.97461,-0.763763],
	[-3.04736,3.62512,1.8428],
	[4.15454,2.5675,1.8428],
	[1.70996,4.89856,1.84756],
	[-1.25635,-0.0124512,1.84279],
	[-1.05249,-3.82288,1.84279],
	[-4.06323,-4.62207,1.84279],
	[-1.61597,-4.71704,1.84279]
];

///House_C_5_v1
_house_C_5_v1_List = [
	[-3.27832,-3.99414,-1.36693],
	[-2.38306,-4.56055,-1.36693],
	[-3.72583,-1.95215,-1.36693],
	[-3.6731,1.53418,-1.36694],
	[-3.1377,3.34326,-1.36693],
	[2.15918,4.52539,-1.36693],
	[3.50977,3.69434,-1.36691],
	[0.201904,-0.17627,1.21068],
	[-1.5791,-4.38232,1.17349],
	[-4.09131,-1.854,1.17351],
	[-4.06299,3.87451,1.17349],
	[-0.638184,3.72803,1.4205],
	[1.99878,3.55029,1.4205],
	[3.81299,3.32568,1.51646],
	[2.77832,1.93018,1.42049]
];

///House_C_5_v2
_house_C_5_v2_List = [
	[-3.27832,-3.99414,-1.36693],
	[-2.38306,-4.56055,-1.36693],
	[-3.72583,-1.95215,-1.36693],
	[-3.6731,1.53418,-1.36694],
	[-3.1377,3.34326,-1.36693],
	[2.15918,4.52539,-1.36693],
	[3.50977,3.69434,-1.36691],
	[-0.074707,-0.171875,1.37523],
	[-3.69263,-0.529297,1.27808],
	[-3.24707,3.50146,1.27808],
	[0.690674,4.98096,1.28363],
	[4.1709,5.02686,1.28412],
	[4.28296,1.14063,1.27808],
	[-2.37646,-4.66553,1.41467],
	[-1.77979,-4.25537,1.41423]
];

///House_C_5_v3
_house_C_5_v3_List = [
	[-3.27832,-3.99414,-1.36693],
	[-2.38306,-4.56055,-1.36693],
	[-3.72583,-1.95215,-1.36693],
	[-3.6731,1.53418,-1.36694],
	[-3.1377,3.34326,-1.36693],
	[2.15918,4.52539,-1.36693],
	[3.50977,3.69434,-1.36691],
	[0.201904,-0.17627,1.21068],
	[-4.06665,0.222168,1.17351],
	[-4.05981,3.69482,1.17351],
	[1.92749,3.90771,1.4205],
	[3.75244,3.12988,1.51645],
	[2.79956,1.92822,1.42049],
	[-2.48779,-4.63818,1.30734]
];

///House_C_9
_house_C_9_List = [
	[2.1875,5.57056,-3.74944],
	[-0.703613,-2.13892,-3.746],
	[5.2146,1.86011,-0.152161],
	[1.323,-5.15723,-0.152161],
	[-4.99072,0.973633,-0.152161],
	[-5.03003,1.95142,-0.152161],
	[-4.74072,4.30688,-0.152161],
	[2.51685,5.78247,-0.152161],
	[-4.04321,-4.24194,-0.152161],
	[-5.06104,-2.87817,-0.152161],
	[-2.70923,-5.57593,-0.152161],
	[-2.76172,-3.79248,2.58533],
	[-0.843994,-5.33569,2.58495],
	[-4.36621,-1.85352,2.58914],
	[5.36353,-5.68018,2.58609],
	[-4.76416,3.79932,2.58914],
	[2.36792,3.1394,2.58914]
];

///House_C_10
_house_C_10_List = [
	[-1.75024,-2.13672,-4.19254],
	[-1.21362,-7.8916,-4.20229],
	[-2.35352,0.68457,-4.18401],
	[4.3855,-8.71826,-0.868896],
	[2.42554,-2.13818,-0.869049],
	[3.85498,2.04321,-0.86879],
	[1.89136,8.67554,0.367508],
	[-2.89282,7.90381,-0.776978],
	[-2.53296,1.58911,-0.868958],
	[-4.3562,5.38086,-0.543655],
	[-4.71216,0.64502,-0.549423],
	[-4.70386,8.83984,-0.548325],
	[-2.57544,-2.29736,-0.869415],
	[-4.67603,-4.34937,-0.549469],
	[-4.66284,-0.777344,-0.548859],
	[-4.92725,-8.01172,-0.553589],
	[2.89014,-8.30322,2.52063],
	[-4.52026,-8.65332,2.47195],
	[-4.81519,0.40332,2.47195],
	[-4.77979,8.80518,2.47195],
	[4.4729,3.72925,2.47195],
	[4.38306,0.862061,2.47195],
	[1.40894,7.74316,5.22762]
];

///House_C_11
_house_C_11_List = [
	[-3.42017,4.55444,-2.92824],
	[4.05981,2.37231,-2.08453],
	[-0.626465,-2.6499,-2.08452],
	[0.710693,-2.45068,-2.08452],
	[-3.73608,-4.10059,0.312973],
	[7.36572,-2.62183,0.972977],
	[0.852051,-4.34644,0.972992],
	[3.6394,2.13916,0.972977]
];

///House_C_12
_house_C_12_List = [
	[4.28687,1.98584,-3.51102],
	[6.24976,-2.08203,-3.51102],
	[2.19751,-3.49292,-3.51102],
	[-0.656738,1.62476,-3.51102],
	[-1.97192,-6.16162,-3.51102],
	[1.62012,-6.85571,-3.51102],
	[-3.31421,-7.27344,0.142807],
	[2.58154,-7.15503,0.132629],
	[-2.89453,-2.979,0.13884],
	[4.37378,-3.82788,0.132629],
	[6.31665,-1.10522,0.132629],
	[6.74341,1.41406,0.134293],
	[-2.69971,-4.67993,3.53703]
];

///Mosque_Small_1
_house_HMQS_1_List = [
	[-5.85254,1.45819,-2.04604],
	[-2.42847,1.08264,-1.96561],
	[-1.27148,0.997742,-1.97945],
	[2.68384,-2.03418,-1.69603],
	[6.91284,1.3186,-1.94745],
	[5.3811,0.935486,-2.04604]
];

///Mosque_Small_2
_house_HMQS_2_List = [
	[1.17212,2.79517,-2.48535],
	[1.33142,0.0349121,-2.48537],
	[-3.5802,-0.131836,-2.41061]
];

///Minaret_1
_house_HMQT_1_List = [
	[-1.28735,-1.39014,-12.9009],
	[-0.095459,-2.77759,-7.38249],
	[0.70459,-1.61646,-0.64415],
	[-0.489746,-2.69067,4.9671]
];

///Minaret_P
_house_HMQT_2_List = [
	[1.79004,0.0842285,-13.8153],
	[0.412109,-0.306396,-12.0783],
	[1.63965,0.1875,-7.72827],
	[0.445313,-0.296875,-3.31429],
	[1.68457,0.0654297,-2.02737],
	[1.77832,-0.317139,6.51392],
	[2.58789,0.241943,9.34502]	
];

///Mosque_Wall_Gate
_mosque_W_G_List = [
	[-3.45117,1.51709,-5.98472],
	[3.92334,0.738281,-5.97925]
];

///Mosque_Wall_Wall
_mosque_W_W_List = [
	[-6.91357,4.44043,5.17167],
	[2.729,4.35645,5.18165],
	[0.625977,3.50146,-2.0329]
];

///Mosque_Wall_Corner
_mosque_W_C_List = [
	[3.80176,3.66895,5.13935],
	[2.3374,2.84961,-2.01729]
];

///Mosque_Minaret_2
_mosque_minaret_2_List = [
	[0.0795898,-2.39697,3.62602],
	[1.09326,-0.365234,3.62602]
];

///Mosque_Minaret_1
_mosque_minaret_1_List = [
	[0.0131836,-2.24512,7.19489],
	[0.103027,-1.12451,7.1949],
	[-0.567383,-1.54688,7.1949],
	[0.534668,-1.69043,7.19489]
];

///Mosque_Big
_mosque_big_List = [
	[0.0229492,7.44043,-9.31999],
	[0.918945,-8.68164,-9.31999]
];

///Mosque_Big_Addon
_mosque_big2_List = [
	[-4.91309,8.0957,-6.40649],	
	[-4.71094,-7.92041,-6.40939],	
	[6.62744,-0.0136719,-6.38554],	
	[-4.90771,10.3784,-1.13195],	
	[-4.78564,-8.98828,-1.14939],	
	[-4.66016,-10.1191,3.46442],	
	[-5.83887,-10.3213,3.48023]	
];

///Base_Tower
_base_tower_List = [
	[-0.0478516,1.31689,1.36331]
];

///Industrial_Shed_02
_ind_shed_02_List = [
	[3.49268,-8.18945,-4.62599],
	[-3.81494,-8.65381,-4.62599],
	[-3.43164,-6.02783,-4.62599],
	[-3.31348,-2.46777,-4.62598],
	[-3.36133,2.47021,-4.62599],
	[-3.83984,6.34473,-4.62598],
	[-3.81348,9.27002,-4.62598],
	[-0.59668,8.0293,-4.62599],
	[4.37305,-5.75732,-1.27542],
	[4.5415,-2.09082,-1.27713],
	[4.43555,2.75244,-1.27957],
	[4.36816,6.66016,-1.28168],
	[4.36475,9.3916,-1.28313],
	[-0.937988,11.4224,-1.27606],
	[-3.80908,6.65576,-1.28336],
	[-3.78223,2.47705,-1.2845],
	[-3.64844,-2.4624,-1.28589],
	[-3.65332,-8.59766,-1.2877]
];

///Barrack2
_barrack_2_List = [
	[0.342285,-1.96875,-0.693207]
];

///Barracks1
_barracks_1_List = [
	[5.44287,2.00635,-1.09824],
	[4.7334,-0.211914,-1.09824],
	[1.72119,1.82813,-1.09824],
	[0.734863,-1.31982,-1.09824],
	[-2.43115,-2.03516,-1.09824],
	[-2.12061,-0.03125,-1.09824],
	[-5.6665,-1.62646,-1.09824],
	[-5.16455,-0.0786133,-1.09824],
	[-8.9126,-1.5166,-1.09824],
	[-7.87451,-0.15918,-1.09824]
];

///Coltan_Mine
_coltan_Mine_List = [
	[-8.95117,13.9265,-6.30167],
	[-9.94238,13.2063,-6.30167],
	[-7.44629,12.3884,-6.30167],
	[-7.45117,10.511,-6.30167],
	[-3.76074,7.84692,-6.33167],
	[10.5488,15.7136,-3.05167],
	[6.45313,16.3789,-3.05167],
	[10.5342,16.3533,0.928314],
	[6.75586,15.8364,0.928314],
	[10.5273,16.554,4.84833],
	[6.50879,15.8003,4.84833],
	[5.2959,-13.6602,2.36832],
	[-5.43066,-14.1804,2.50491],
	[-4.95508,-9.43384,2.36832],
	[-5.60254,1.98071,3.66348]
];

///Fuel_Station
_fuel_station_1_List = [
	[1.92969,1.17236,-1.33611],
	[1.76758,-0.605957,-1.33611],
	[-1.78418,-0.400879,-1.33598]
];
///Fuel_Station_PMC
_fuel_station_2_List = [
	[1.92969,1.17236,-1.33611],
	[1.76758,-0.605957,-1.33611],
	[-1.78418,-0.400879,-1.33598]
];

///Bunker_Big
_bunker_Big_List = [
	[3.66162,1.74805,-0.740341],
	[3.44238,-0.710938,-0.740349],
	[3.66162,-3.32422,-0.740349],
	[3.16406,-4.07813,-0.740349],
	[0.456055,-4.23242,-0.740349],
	[-3.14795,-4.00488,-0.740349],
	[-2.98389,-0.40918,-0.740341],
	[-3.4502,2.33008,-0.740341],
	[-2.46436,1.375,-0.740341]
];

///Bunker_Small
_bunker_small_List = [
	[0.228516,-1.03809,-0.845894]
];

///Oil_Tower
_oil_tower_List = [
	[-0.279297,-6.05664,-8.0148],
	[3.50244,0.790039,-8.00334],
	[0.652344,1.06445,-8.00578],
	[4.65479,-4.71289,3.77357],
	[3.30664,-3.47266,16.7859]
];

///Hanger_1
_hanger_1_List = [
	[10.5781,-18.9312,-5.38129],
	[-10.5264,-18.5151,-5.38129]
];

///Ind_garage_01
_ind_Garage_01_List = [
	[-0.100586,0.726074,-1.45877],
	[1.81934,-0.805176,-1.46326]
];

///Office Building
_office_building_List = [
	[-0.131348,-2.87842,-4.40848],
	[-14.0828,0.565918,-4.40949],
	[-4.52515,5.11768,-4.40979],
	[-7.53687,5.30078,-4.40949],
	[7.79639,4.2085,-4.41614],
	[10.241,5.30957,-4.41702],
	[4.85498,5.34277,-4.41435],
	[2.54956,5.17041,-4.41327],
	[-0.111328,5.18311,-4.41195],
	[-0.629395,2.67529,-4.41245],
	[13.624,0.95166,-4.40989],
	[12.2166,-4.19971,-4.40816],
	[15.3794,-4.35986,-4.40809],
	[3.08691,-3.95508,-1.90617],
	[-4.68384,-4.44385,-1.91962],
	[-15.4248,-5.46582,-1.91962],
	[-15.5706,5.43652,-1.91962],
	[-12.3489,0.538574,-1.91962],
	[-9.91089,0.463379,-1.91962],	
	[-7.46777,0.20752,-1.91962],
	[-7.8999,4.4292,-1.91962],
	[-5.04419,5.05908,-1.91962],
	[-0.623535,4.5459,-1.91962],
	[2.74048,5.19971,-1.91962],
	[5.21167,4.83447,-1.91962],
	[14.6912,0.571289,-1.91962],
	[10.1025,-4.30713,-1.91952],
	[7.60571,-4.47021,-1.91947],
	[12.5903,5.09912,-1.91962],
	[14.6719,5.12549,-1.91962],
	[0.470459,-0.277832,0.580381],
	[-2.55225,2.52588,0.580383],
	[-0.338623,2.83203,0.580381],
	[7.15332,-4.81006,0.580208],
	[15.7153,-5.22705,0.696018],
	[15.4285,5.86963,0.693604],
	[5.19873,5.08496,0.580379],
	[-4.53687,-0.288574,0.580383],
	[-13.0059,1.24463,0.580387],
	[-12.9272,5.73389,0.580385],
	[3.16187,-0.0717773,6.31329]
];

///Building_WIP
_building_WIP_List = [
	[9.42334,10.7585,-6.39378],
	[5.64111,10.6335,-6.42242],
	[10.73,11.0947,-6.40444],
	[16.6323,11.281,-6.45477],
	[16.3872,1.36084,-6.53036],
	[14.269,-0.643311,-6.52102],
	[20.7607,-4.76245,-6.53098],
	[18.125,-4.91846,-6.53263],
	[14.1968,-9.94214,-6.52664],
	[8.04639,-9.46143,-6.51434],
	[1.65039,-9.5293,-6.50526],
	[-3.5542,-9.9563,-6.48329],
	[-20.3286,-17.3713,-6.52324],
	[-19.9961,-13.6814,-6.51978],
	[-19.9961,-13.6814,-6.51978],
	[-23.77,-7.39404,-6.49477],
	[-23.8569,-3.99756,-6.4585],
	[-23.7959,-1.58594,-6.43376],
	[-24.6499,1.84863,-6.40448],
	[-24.353,4.19556,-6.42051],
	[-24.188,8.15747,-6.44971],
	[-23.9399,11.0933,-6.47059],
	[-21.4487,10.8979,-6.45341],
	[-17.4121,11.0471,-6.42911],
	[-15.4272,10.8999,-6.42188],
	[-12.5781,10.394,-6.44853],
	[-6.78174,11.1128,-6.49303],
	[0.522949,11.3164,-6.49406],
	[2.75049,11.1377,-6.46447],
	[-13.1567,-1.66504,-6.49782],
	[20.8569,-4.57886,-2.53292],
	[17.7266,0.253662,-2.53291],
	[13.1963,9.54199,-2.53182],
	[9.34814,10.9048,-2.53182],
	[5.46729,10.6951,-2.53182],
	[1.88379,11.4241,-2.53182],
	[-3.65088,11.085,-2.53182],
	[-12.7271,11.1958,-2.53182],
	[-18.6987,11.248,-2.53182],
	[-23.686,11.2788,-2.53182],
	[-24.7915,6.60645,-2.53182],
	[-23.689,4.37207,-2.53182],
	[-23.897,1.79785,-2.53182],
	[-23.2617,-1.91602,-2.53182],
	[-24.2192,-4.32422,-2.53182],
	[-24.0181,-7.68994,-2.53182],
	[-23.3208,-10.0474,-2.53184],
	[-20.3384,-17.7085,-2.53106],
	[-20.2095,-13.1721,-2.53281],
	[-13.6997,-12.1309,-2.53587],
	[13.7974,-15.0383,-2.53958],
	[-11.6206,-10.0237,-2.53485],
	[-4.95557,-8.9314,-2.53369],
	[-1.72803,-9.95483,-2.53426],
	[3.44189,-10.6614,-2.53449],
	[9.81006,-10.1392,-2.53379],
	[14.7563,-9.96143,-2.53372],
	[14.8765,-5.05786,-2.53182],
	[20.519,0.825684,-0.51626],
	[20.5972,-4.79492,1.37222],
	[17.1816,-0.287354,1.45336],
	[13.6953,-2.13428,1.48774],
	[14.9966,-9.59375,1.48066],
	[8.47607,8.16528,1.45782],
	[9.33545,-0.243408,1.493],
	[4.40723,10.3191,1.48614],
	[-0.240234,10.1487,1.51558],
	[-3.32764,10.8525,1.51406],
	[-8.65869,11.2954,1.50604],
	[-13.2612,10.8535,1.49912],
	[-19.2666,10.1418,1.4901],
	[-23.708,10.2288,1.48342],
	[-23.8047,6.16553,1.48328],
	[-24.0923,2.00537,1.48285],
	[-24.022,-3.97192,1.48296],
	[-23.4336,-9.30493,1.48385],
	[-20.2915,-13.1099,1.48069],
	[-20.2661,-17.8933,1.51373],
	[-14.0264,-12.2813,1.48072],
	[-9.39404,-10.364,1.48236],
	[-2.99951,-10.3384,1.48245],
	[3.64014,-9.88013,1.48323],
	[9.53174,-10.2813,1.48263],
	[-24.728,-10.717,5.46558],
	[-21.7017,-10.6724,5.47479],
	[-24.9097,-0.498291,5.46644],
	[-24.8457,11.4556,5.46697],
	[-12.0669,11.6533,5.45595],
	[-1.93457,10.8237,5.46819],
	[3.9502,1.21069,5.46972],
	[6.30908,-10.0271,5.41688],
	[9.64404,-6.71387,5.31406],
	[9.00684,-9.08496,5.3454],
	[-3.66992,-10.656,5.47106],
	[-11.5972,-10.6987,5.45623]

];

///Firestation
_firestation_List = [
	[18.1284,2.64307,-9.47058],
	[1.31592,-5.59863,-9.47058],
	[-3.87476,-6.67188,-7.2732],
	[-2.55347,-7.79492,-4.6489],
	[-1.42554,-6.09814,-4.6489],
	[-2.5271,-8.02002,-0.043787],
	[-3.91748,-6.43848,-0.043787],
	[-1.26807,-6.32275,-0.043787],
	[-2.58716,-8.00928,4.41139],
	[-3.93652,-6.60498,4.41139],
	[-1.24878,-6.75,4.41139],
	[-2.47485,-5.46436,4.41139],
	[-0.955322,-8.16357,8.49209],
	[-4.25439,-7.54443,8.49209],
	[-4.25439,-7.54443,8.49209],
	[-14.5786,-4.6499,-0.507908],
	[-17.2483,-1.17578,-0.507908],
	[-17.2439,5.83594,-0.507908],
	[-8.71313,5.4707,-0.507908],
	[-0.803711,4.70361,-0.507908],
	[-0.825928,-3.67139,-0.507908],
	[4.66748,0.845215,-0.507908],
	[8.70825,-7.0874,-4.50791]
];

///Villa
_villa_List = [
	[11.2998,-0.221191,-5.06722],
	[8.66064,-4.1123,-5.06717],
	[13.3926,-14.8101,-5.06719],
	[0.0800781,0.422363,-5.06716],
	[-4.50342,8.47412,-5.06711],
	[-1.19775,12.3999,-5.06723],
	[-14.7354,13.8022,-5.06719],
	[-11.5762,10.3374,-5.06709],
	[-2.38818,3.0791,-1.48419],
	[2.56543,-2.33398,-1.4844],
	[-3.79248,-4.06543,-1.4844],
	[-6.20508,9.83643,-1.4844],
	[-12.1143,10.3896,-1.4844],
	[-15.2886,12.709,-1.4844],
	[-12.2637,15.229,-1.48439],
	[-7.52734,15.2529,-1.48439],
	[-3.38477,15.2471,-1.48439],
	[12.1592,9.54443,1.98539],
	[18.2222,3.31104,1.99262],
	[18.3906,-18.2554,1.99257],
	[18.3027,-7.24219,1.99261],
	[7.02783,-18.3413,1.9926],
	[6.38428,-3.43311,1.99247],
	[-3.45703,-6.48682,1.99165],
	[-3.33154,6.34033,1.97309],
	[-18.3467,7.14697,1.97169],
	[-18.4937,18.5259,1.97169],
	[-5.97559,18.3418,1.97169],
	[3.16797,18.439,1.97169],
	[8.23047,12.0913,1.96864]
];

///General_Store
_general_Store_List = [
	[-7.3222,5.21619,-1.20155],
	[-7.57813,8.22656,-1.20155],
	[-2.46527,8.39673,-1.20155],
	[3.43689,8.15063,-1.20155],
	[11.6325,7.90442,-1.20155],
	[13.622,-4.33728,-1.20155],
	[9.99786,-4.25659,-1.20155],
	[7.37158,-2.82568,-1.20155],
	[-8.13409,-3.72827,-1.20155]
];
/*
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------		
			END OF HOUSE LIBRARY
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

	Squad Library
	-------------
		This is the area that does pretty much everything else.

			1.) Defines the position for each building type in the area.
			2.) Decides how many units to create and which positions they will go to.
			3.) Creates a Group and Units for the group.
			4.) Names the group members.
			5.) Tells all units to not run off and attack and orders them to stop.
			6.) Tells them to stand, kneel, go prone, or decide on their own.
			7.) Teleports them to the position inside the building
			8.) Executes for each building of the type.
			
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/

///-----------------------
///-----------------------
///-----------------------
///Start Squad for House L_1
///-----------------------
///-----------------------
///-----------------------

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
		_H_L_1_pos_00 = _x modelToWorld (_house_L_1_List select 0);
		_H_L_1_pos_01 = _x modelToWorld (_house_L_1_List select 1);
		_H_L_1_pos_02 = _x modelToWorld (_house_L_1_List select 2);

		_HL1_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
		_HL1_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 
		_HL1_pos02Unit = _mgPosPos select (round(random _mgPosPosNum)); 

		_L1_squad = createGroup _factionside;

		_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));


		if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) 
			then {
				_HL1_pos00Unit createUnit [getmarkerpos _initialSpawn, _L1_squad,"L1_squad_mem_00 = this;", _unitskill, _unitrank]
				};

		if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) 
			then {
				_HL1_pos01Unit createUnit [getmarkerpos _initialSpawn, _L1_squad,"L1_squad_mem_01 = this;", _unitskill, _unitrank]
				};  

		if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) 
			then {
				_HL1_pos02Unit createUnit [getmarkerpos _initialSpawn, _L1_squad,"L1_squad_mem_02 = this;", _unitskill, _unitrank]
				};
		
		{_x enableattack false} forEach units _L1_squad;
		{dostop _x} foreach units _L1_squad;

		_L1_squad_members = units _L1_squad;
		L1_squad_mem_00 setunitpos "up"; L1_squad_mem_00 setPosATL _H_L_1_pos_00;
		L1_squad_mem_01 setunitpos "up"; L1_squad_mem_01 setPosATL _H_L_1_pos_01; 
		L1_squad_mem_02 setunitpos "Middle"; L1_squad_mem_02 setPosATL _H_L_1_pos_02;
		};
			_countarr = _countarr + 1;
	} foreach _HL_1_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for House L_1
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line----------------------------------------

///-----------------------
///-----------------------
///-----------------------
///Start Squad for House L_3  
///-----------------------
///-----------------------
///-----------------------
///8 Positions

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
		_H_L_3_pos_00 = _x modelToWorld (_house_L_3_List select 0);
		_H_L_3_pos_01 = _x modelToWorld (_house_L_3_List select 1);
		_H_L_3_pos_02 = _x modelToWorld (_house_L_3_List select 2);
		_H_L_3_pos_03 = _x modelToWorld (_house_L_3_List select 3);
		_H_L_3_pos_04 = _x modelToWorld (_house_L_3_List select 4);
		_H_L_3_pos_05 = _x modelToWorld (_house_L_3_List select 5);
		_H_L_3_pos_06 = _x modelToWorld (_house_L_3_List select 6);
		_H_L_3_pos_07 = _x modelToWorld (_house_L_3_List select 7);

		_HL3_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
		_HL3_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 
		_HL3_pos02Unit = _rifPosPos select (round(random _rifPosPosNum));
		_HL3_pos03Unit = _rifPosPos select (round(random _rifPosPosNum));
		_HL3_pos04Unit = _rifPosPos select (round(random _rifPosPosNum)); 
		_HL3_pos05Unit = _rifPosPos select (round(random _rifPosPosNum)); 
		_HL3_pos06Unit = _atmgPosPos select (round(random _atmgPosPosNum));
		_HL3_pos07Unit = _rifPosPos select (round(random _rifPosPosNum)); 

		_L3_squad = createGroup _factionside; ///Create Group

		_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));

		if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) 
			then {
				_HL3_pos00Unit createUnit [getmarkerpos _initialSpawn, _L3_squad,"L3_squad_mem_00 = this;", _unitskill, _unitrank]
				};

		if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) 
			then {
				_HL3_pos01Unit createUnit [getmarkerpos _initialSpawn, _L3_squad,"L3_squad_mem_01 = this;", _unitskill, _unitrank]
				};  
		
		if (random 1 <= _percentPosGar && _PosDoorOnOff == 1)
			then {
				_HL3_pos02Unit createUnit [getmarkerpos _initialSpawn, _L3_squad,"L3_squad_mem_02 = this;", _unitskill, _unitrank]
				};

		if (random 1 <= _percentPosGar && _PosWindowOnOff == 1)
			then {
				_HL3_pos03Unit createUnit [getmarkerpos _initialSpawn, _L3_squad,"L3_squad_mem_03 = this;", _unitskill, _unitrank]
				};

		if (random 1 <= _percentPosGar && _PosWindowOnOff == 1)
			then {
				_HL3_pos04Unit createUnit [getmarkerpos _initialSpawn, _L3_squad,"L3_squad_mem_04 = this;", _unitskill, _unitrank]
				};

		if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) 
			then {
				_HL3_pos05Unit createUnit [getmarkerpos _initialSpawn, _L3_squad,"L3_squad_mem_05 = this;", _unitskill, _unitrank]
				};

		if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) 
			then {
				_HL3_pos06Unit createUnit [getmarkerpos _initialSpawn, _L3_squad,"L3_squad_mem_06 = this;", _unitskill, _unitrank]
				};

		if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) 
			then {
				_HL3_pos07Unit createUnit [getmarkerpos _initialSpawn, _L3_squad,"L3_squad_mem_07 = this;", _unitskill, _unitrank]
				};

		{_x enableattack false} forEach units _L3_squad;
		{dostop _x} foreach units _L3_squad;

		_L3_squad_members = units _L3_squad;
		L3_squad_mem_00 setunitpos "up"; L3_squad_mem_00 setPosATL _H_L_3_pos_00;
		L3_squad_mem_01 setunitpos "up"; L3_squad_mem_01 setPosATL _H_L_3_pos_01; 
		L3_squad_mem_02 setunitpos "Middle"; L3_squad_mem_02 setPosATL _H_L_3_pos_02;
		L3_squad_mem_03 setunitpos "up"; L3_squad_mem_03 setPosATL _H_L_3_pos_03;
		L3_squad_mem_04 setunitpos "up"; L3_squad_mem_04 setPosATL _H_L_3_pos_04; 
		L3_squad_mem_05 setunitpos "Middle"; L3_squad_mem_05 setPosATL _H_L_3_pos_05;
		L3_squad_mem_06 setunitpos "Down"; L3_squad_mem_06 setPosATL _H_L_3_pos_06;
		L3_squad_mem_07 setunitpos "Down"; L3_squad_mem_07 setPosATL _H_L_3_pos_07;

		};
			_countarr = _countarr + 1;
	} foreach _HL_3_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for House L_3///-----------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------

///-----------------------
///-----------------------
///-----------------------
///Start Squad for House L_4  ///----------------------------------
///-----------------------
///-----------------------
///-----------------------
///5 Positions
_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {

_H_L_4_pos_00 = _x modelToWorld (_house_L_4_List select 0);
_H_L_4_pos_01 = _x modelToWorld (_house_L_4_List select 1);
_H_L_4_pos_02 = _x modelToWorld (_house_L_4_List select 2);
_H_L_4_pos_03 = _x modelToWorld (_house_L_4_List select 3);
_H_L_4_pos_04 = _x modelToWorld (_house_L_4_List select 4);

_HL4_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
_HL4_pos01Unit = _mgPosPos select (round(random _mgPosPosNum)); 
_HL4_pos02Unit = _rifPosPos select (round(random _rifPosPosNum));
_HL4_pos03Unit = _rifPosPos select (round(random _rifPosPosNum));
_HL4_pos04Unit = _atmgPosPos select (round(random _atmgPosPosNum)); 

_L4_squad = createGroup _factionside; ///Create Group

_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) 
	then {
		_HL4_pos00Unit createUnit [getmarkerpos _initialSpawn, _L4_squad,"L4_squad_mem_00 = this;", _unitskill, _unitrank]
		};

if (random 1 <= _percentPosGar && _PosWindowOnOf == 1) 
	then {
		_HL4_pos01Unit createUnit [getmarkerpos _initialSpawn, _L4_squad,"L4_squad_mem_01 = this;", _unitskill, _unitrank]
		};  

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) 
	then {
		_HL4_pos02Unit createUnit [getmarkerpos _initialSpawn, _L4_squad,"L4_squad_mem_02 = this;", _unitskill, _unitrank]
		};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) 
	then {
		_HL4_pos03Unit createUnit [getmarkerpos _initialSpawn, _L4_squad,"L4_squad_mem_03 = this;", _unitskill, _unitrank]
		};

if (random 1 <= _percentPosGar && _PosRoofOnOf == 1) 
	then {
		_HL4_pos04Unit createUnit [getmarkerpos _initialSpawn, _L4_squad,"L4_squad_mem_04 = this;", _unitskill, _unitrank]
		};

{_x enableattack false} forEach units _L4_squad;
{dostop _x} foreach units _L4_squad;

_L4_squad_members = units _L4_squad;
L4_squad_mem_00 setPosATL _H_L_4_pos_00;
L4_squad_mem_01 setPosATL _H_L_4_pos_01;
L4_squad_mem_02 setPosATL _H_L_4_pos_02;
L4_squad_mem_03 setPosATL _H_L_4_pos_03;
L4_squad_mem_04 setPosATL _H_L_4_pos_04;
L4_squad_mem_00 setUnitPos "Middle";
L4_squad_mem_01 setUnitPos "Middle";
L4_squad_mem_02 setUnitPos "Middle";
L4_squad_mem_03 setUnitPos "Up";
L4_squad_mem_04 setUnitPos "Down";

		};
			_countarr = _countarr + 1;
	} foreach _HL_4_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for House L_4///-----------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------
///-----------------------
///-----------------------
///-----------------------
///Start Squad for House L_6  ///----------------------------------
///-----------------------
///-----------------------
///-----------------------
///7 Positions
_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_H_L_6_pos_00 = _x modelToWorld (_house_L_6_List select 0);
_H_L_6_pos_01 = _x modelToWorld (_house_L_6_List select 1);
_H_L_6_pos_02 = _x modelToWorld (_house_L_6_List select 2);
_H_L_6_pos_03 = _x modelToWorld (_house_L_6_List select 3);
_H_L_6_pos_04 = _x modelToWorld (_house_L_6_List select 4);
_H_L_6_pos_05 = _x modelToWorld (_house_L_6_List select 5);
_H_L_6_pos_06 = _x modelToWorld (_house_L_6_List select 6);

///Possible Units
_HL6_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
_HL6_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HL6_pos02Unit = _rifPosPos select (round(random _rifPosPosNum));
_HL6_pos03Unit = _rifPosPos select (round(random _rifPosPosNum));
_HL6_pos04Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HL6_pos05Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HL6_pos06Unit = _rifPosPos select (round(random _rifPosPosNum));

_L6_squad = createGroup _factionside; ///Create Group


_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) 
	then {
		_HL6_pos00Unit createUnit [getmarkerpos _initialSpawn, _L6_squad,"L6_squad_mem_00 = this;", _unitskill, _unitrank]
		};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) 
	then {
		_HL6_pos01Unit createUnit [getmarkerpos _initialSpawn, _L6_squad,"L6_squad_mem_01 = this;", _unitskill, _unitrank]
		};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) 
	then {
		_HL6_pos02Unit createUnit [getmarkerpos _initialSpawn, _L6_squad,"L6_squad_mem_02 = this;", _unitskill, _unitrank]
		};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) 
	then {
		_HL6_pos03Unit createUnit [getmarkerpos _initialSpawn, _L6_squad,"L6_squad_mem_03 = this;", _unitskill, _unitrank]
		};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) 
	then {
		_HL6_pos04Unit createUnit [getmarkerpos _initialSpawn, _L6_squad,"L6_squad_mem_04 = this;", _unitskill, _unitrank]
		};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) 
	then {
		_HL6_pos05Unit createUnit [getmarkerpos _initialSpawn, _L6_squad,"L6_squad_mem_05 = this;", _unitskill, _unitrank]
		};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) 
	then {
		_HL6_pos06Unit createUnit [getmarkerpos _initialSpawn, _L6_squad,"L6_squad_mem_06 = this;", _unitskill, _unitrank]
		};

{_x enableattack false} forEach units _L6_squad;
{dostop _x} foreach units _L6_squad;

_L6_squad_members = units _L6_squad;
L6_squad_mem_00 setPosATL _H_L_6_pos_00;
L6_squad_mem_01 setPosATL _H_L_6_pos_01;
L6_squad_mem_02 setPosATL _H_L_6_pos_02;
L6_squad_mem_03 setPosATL _H_L_6_pos_03;
L6_squad_mem_04 setPosATL _H_L_6_pos_04;
L6_squad_mem_05 setPosATL _H_L_6_pos_05;
L6_squad_mem_06 setPosATL _H_L_6_pos_06;
L6_squad_mem_00 setUnitPos "Middle";
L6_squad_mem_01 setUnitPos "Middle";
L6_squad_mem_02 setUnitPos "Middle";
L6_squad_mem_03 setUnitPos "Middle";
L6_squad_mem_04 setUnitPos "Up";
L6_squad_mem_05 setUnitPos "Up";
L6_squad_mem_06 setUnitPos "Middle";
		};
			_countarr = _countarr + 1;
	} foreach _HL_6_list;

///-----------------------
///-----------------------
///-----------------------
///End of Squad for House L_6///-----------------------------------
///-----------------------
///-----------------------
///-----------------------
//////-----------------------------Squad Divider Line///----------------------------------------

///-----------------------
///-----------------------
///-----------------------
///Start Squad for House L_7  ///----------------------------------
///-----------------------
///-----------------------
///-----------------------
///6 Positions
_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_H_L_7_pos_00 = _x modelToWorld (_house_L_7_List select 0);
_H_L_7_pos_01 = _x modelToWorld (_house_L_7_List select 1);
_H_L_7_pos_02 = _x modelToWorld (_house_L_7_List select 2);
_H_L_7_pos_03 = _x modelToWorld (_house_L_7_List select 3);
_H_L_7_pos_04 = _x modelToWorld (_house_L_7_List select 4);
_H_L_7_pos_05 = _x modelToWorld (_house_L_7_List select 5);

///Possible Units
_HL7_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
_HL7_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HL7_pos02Unit = _rifPosPos select (round(random _rifPosPosNum));
_HL7_pos03Unit = _rifPosPos select (round(random _rifPosPosNum));
_HL7_pos04Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HL7_pos05Unit = _rifPosPos select (round(random _rifPosPosNum));
 

_L7_squad = createGroup _factionside; ///Create Group

///---------Create Squad---------

_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) 
	then {
		_HL7_pos00Unit createUnit [getmarkerpos _initialSpawn, _L7_squad,"L7_squad_mem_00 = this;", _unitskill, _unitrank]
		};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) 
	then {
		_HL7_pos01Unit createUnit [getmarkerpos _initialSpawn, _L7_squad,"L7_squad_mem_01 = this;", _unitskill, _unitrank]
		};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) 
	then {
		_HL7_pos02Unit createUnit [getmarkerpos _initialSpawn, _L7_squad,"L7_squad_mem_02 = this;", _unitskill, _unitrank]
		};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) 
	then {
		_HL7_pos03Unit createUnit [getmarkerpos _initialSpawn, _L7_squad,"L7_squad_mem_03 = this;", _unitskill, _unitrank]
		};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) 
	then {
		_HL7_pos04Unit createUnit [getmarkerpos _initialSpawn, _L7_squad,"L7_squad_mem_04 = this;", _unitskill, _unitrank]
		};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) 
	then {
		_HL7_pos05Unit createUnit [getmarkerpos _initialSpawn, _L7_squad,"L7_squad_mem_05 = this;", _unitskill, _unitrank]
		};


///---------End of Create Squad-------------------

///---------Start of Squad Attributes---------

{_x enableattack false} forEach units _L7_squad;
{dostop _x} foreach units _L7_squad;

///---------Set Unit Attributes ///-----------------------///--------------------------------

_L7_squad_members = units _L7_squad;
L7_squad_mem_00 setunitpos "Middle"; L7_squad_mem_00 setPosATL _H_L_7_pos_00;
L7_squad_mem_01 setunitpos "Up"; L7_squad_mem_01 setPosATL _H_L_7_pos_01; 
L7_squad_mem_02 setunitpos "Up"; L7_squad_mem_02 setPosATL _H_L_7_pos_02;
L7_squad_mem_03 setunitpos "Up"; L7_squad_mem_03 setPosATL _H_L_7_pos_03;
L7_squad_mem_04 setunitpos "Middle"; L7_squad_mem_04 setPosATL _H_L_7_pos_04; 
L7_squad_mem_05 setunitpos "Middle"; L7_squad_mem_05 setPosATL _H_L_7_pos_05;

		};
			_countarr = _countarr + 1;
	} foreach _HL_7_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for House L_7///-----------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------

///-----------------------
///-----------------------
///-----------------------
///Start Squad for House L_8  ///----------------------------------
///-----------------------
///-----------------------
///-----------------------
///16 Positions
_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_H_L_8_pos_00 = _x modelToWorld (_house_L_8_List select 0);
_H_L_8_pos_01 = _x modelToWorld (_house_L_8_List select 1);
_H_L_8_pos_02 = _x modelToWorld (_house_L_8_List select 2);
_H_L_8_pos_03 = _x modelToWorld (_house_L_8_List select 3);
_H_L_8_pos_04 = _x modelToWorld (_house_L_8_List select 4);
_H_L_8_pos_05 = _x modelToWorld (_house_L_8_List select 5);
_H_L_8_pos_06 = _x modelToWorld (_house_L_8_List select 6);
_H_L_8_pos_07 = _x modelToWorld (_house_L_8_List select 7);
_H_L_8_pos_08 = _x modelToWorld (_house_L_8_List select 8);
_H_L_8_pos_09 = _x modelToWorld (_house_L_8_List select 9);
_H_L_8_pos_10 = _x modelToWorld (_house_L_8_List select 10);
_H_L_8_pos_11 = _x modelToWorld (_house_L_8_List select 11);
_H_L_8_pos_12 = _x modelToWorld (_house_L_8_List select 12);
_H_L_8_pos_13 = _x modelToWorld (_house_L_8_List select 13);
_H_L_8_pos_14 = _x modelToWorld (_house_L_8_List select 14);
_H_L_8_pos_15 = _x modelToWorld (_house_L_8_List select 15);
///Possible Units
_HL8_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
_HL8_pos01Unit = _atmgPosPos select (round(random _atmgPosPosNum)); 
_HL8_pos02Unit = _rifPosPos select (round(random _rifPosPosNum));
_HL8_pos03Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HL8_pos04Unit = _atmgPosPos select (round(random _atmgPosPosNum)); 
_HL8_pos05Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HL8_pos06Unit = _rifPosPos select (round(random _rifPosPosNum));
_HL8_pos07Unit = _rifPosPos select (round(random _rifPosPosNum));
_HL8_pos08Unit = _rifPosPos select (round(random _rifPosPosNum));
_HL8_pos09Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HL8_pos10Unit = _rifPosPos select (round(random _rifPosPosNum));
_HL8_pos11Unit = _rifPosPos select (round(random _rifPosPosNum));
_HL8_pos12Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HL8_pos13Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HL8_pos14Unit = _rifPosPos select (round(random _rifPosPosNum));
_HL8_pos15Unit = _rifPosPos select (round(random _rifPosPosNum));  

_L8_squad = createGroup _factionside; ///Create Group

_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) 
	then {
		_HL8_pos00Unit createUnit [getmarkerpos _initialSpawn, _L8_squad,"L8_squad_mem_00 = this;", _unitskill, _unitrank]
		};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) 
	then {
		_HL8_pos01Unit createUnit [getmarkerpos _initialSpawn, _L8_squad,"L8_squad_mem_01 = this;", _unitskill, _unitrank]
		};  

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) 
	then {
		_HL8_pos02Unit createUnit [getmarkerpos _initialSpawn, _L8_squad,"L8_squad_mem_02 = this;", _unitskill, _unitrank]
		};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) 
	then {
		_HL8_pos03Unit createUnit [getmarkerpos _initialSpawn, _L8_squad,"L8_squad_mem_03 = this;", _unitskill, _unitrank]
		};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) 
	then {
		_HL8_pos04Unit createUnit [getmarkerpos _initialSpawn, _L8_squad,"L8_squad_mem_04 = this;", _unitskill, _unitrank]
		};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) 
	then {
		_HL8_pos05Unit createUnit [getmarkerpos _initialSpawn, _L8_squad,"L8_squad_mem_05 = this;", _unitskill, _unitrank]
		};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) 
	then {
		_HL8_pos06Unit createUnit [getmarkerpos _initialSpawn, _L8_squad,"L8_squad_mem_06 = this;", _unitskill, _unitrank]
		};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) 
	then {
		_HL8_pos07Unit createUnit [getmarkerpos _initialSpawn, _L8_squad,"L8_squad_mem_07 = this;", _unitskill, _unitrank]
		};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) 
	then {
		_HL8_pos08Unit createUnit [getmarkerpos _initialSpawn, _L8_squad,"L8_squad_mem_08 = this;", _unitskill, _unitrank]
		};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) 
	then {
		_HL8_pos09Unit createUnit [getmarkerpos _initialSpawn, _L8_squad,"L8_squad_mem_09 = this;", _unitskill, _unitrank]
		};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) 
	then {
		_HL8_pos10Unit createUnit [getmarkerpos _initialSpawn, _L8_squad,"L8_squad_mem_10 = this;", _unitskill, _unitrank]
		};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) 
	then {
		_HL8_pos11Unit createUnit [getmarkerpos _initialSpawn, _L8_squad,"L8_squad_mem_11 = this;", _unitskill, _unitrank]
		};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) 
	then {
		_HL8_pos12Unit createUnit [getmarkerpos _initialSpawn, _L8_squad,"L8_squad_mem_12 = this;", _unitskill, _unitrank]
		};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) 
	then {
		_HL8_pos13Unit createUnit [getmarkerpos _initialSpawn, _L8_squad,"L8_squad_mem_13 = this;", _unitskill, _unitrank]
		};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) 
	then {
		_HL8_pos14Unit createUnit [getmarkerpos _initialSpawn, _L8_squad,"L8_squad_mem_14 = this;", _unitskill, _unitrank]
		};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) 
	then {
		_HL8_pos15Unit createUnit [getmarkerpos _initialSpawn, _L8_squad,"L8_squad_mem_15 = this;", _unitskill, _unitrank]
		};


{_x enableattack false} forEach units _L8_squad;
{dostop _x} foreach units _L8_squad;

_L8_squad_members = units _L8_squad;
L8_squad_mem_00 setunitpos "Middle"; L8_squad_mem_00 setPosATL _H_L_8_pos_00;
L8_squad_mem_01 setunitpos "Up"; L8_squad_mem_01 setPosATL _H_L_8_pos_01; 
L8_squad_mem_02 setunitpos "Down"; L8_squad_mem_02 setPosATL _H_L_8_pos_02;
L8_squad_mem_03 setunitpos "Middle"; L8_squad_mem_03 setPosATL _H_L_8_pos_03;
L8_squad_mem_04 setunitpos "Middle"; L8_squad_mem_04 setPosATL _H_L_8_pos_04; 
L8_squad_mem_05 setunitpos "Middle"; L8_squad_mem_05 setPosATL _H_L_8_pos_05;
L8_squad_mem_06 setunitpos "Up"; L8_squad_mem_06 setPosATL _H_L_8_pos_06;
L8_squad_mem_07 setunitpos "Middle"; L8_squad_mem_07 setPosATL _H_L_8_pos_07;
L8_squad_mem_08 setunitpos "Up"; L8_squad_mem_08 setPosATL _H_L_8_pos_08;
L8_squad_mem_09 setunitpos "Up"; L8_squad_mem_09 setPosATL _H_L_8_pos_09; 
L8_squad_mem_10 setunitpos "Middle"; L8_squad_mem_10 setPosATL _H_L_8_pos_10;
L8_squad_mem_11 setunitpos "Middle"; L8_squad_mem_11 setPosATL _H_L_8_pos_11;
L8_squad_mem_12 setunitpos "Middle"; L8_squad_mem_12 setPosATL _H_L_8_pos_12; 
L8_squad_mem_13 setunitpos "Middle"; L8_squad_mem_13 setPosATL _H_L_8_pos_13;
L8_squad_mem_14 setunitpos "Middle"; L8_squad_mem_14 setPosATL _H_L_8_pos_14;
L8_squad_mem_15 setunitpos "Middle"; L8_squad_mem_15 setPosATL _H_L_8_pos_15;

		};
			_countarr = _countarr + 1;
	} foreach _HL_8_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for House L_8///-----------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------

///-----------------------
///-----------------------
///-----------------------
///Start Squad for House L_9  ///----------------------------------
///-----------------------
///-----------------------
///-----------------------

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_H_L_9_pos_00 = _x modelToWorld (_house_L_9_List select 0);
_H_L_9_pos_01 = _x modelToWorld (_house_L_9_List select 1);
_H_L_9_pos_02 = _x modelToWorld (_house_L_9_List select 2);
///Possible Units
_HL9_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
_HL9_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HL9_pos02Unit = _atmgPosPos select (round(random _atPosPosNum)); 

_L9_squad = createGroup _factionside; ///Create Group

_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HL9_pos00Unit createUnit [getmarkerpos _initialSpawn, _L9_squad,"L9_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HL9_pos01Unit createUnit [getmarkerpos _initialSpawn, _L9_squad,"L9_squad_mem_01 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HL9_pos02Unit createUnit [getmarkerpos _initialSpawn, _L9_squad,"L9_squad_mem_02 = this;", _unitskill, _unitrank]};



{_x enableattack false} forEach units _L9_squad;
{dostop _x} foreach units _L9_squad;

/// Skill Section ///-----------------------///--------------------------------

{_x setskill 1} foreach units _L9_squad;
///(_maxskillrange = round(random _maxvalue * 100)); (_minskillrange = round(random _minvalue * 100));((_maxskillrange - _minskillrange)/100)



_L1_squad_members = units _L9_squad;
L9_squad_mem_00 setunitpos "Middle"; L9_squad_mem_00 setPosATL _H_L_9_pos_00;
L9_squad_mem_01 setunitpos "Middle"; L9_squad_mem_01 setPosATL _H_L_9_pos_01; 
L9_squad_mem_02 setunitpos "Middle"; L9_squad_mem_02 setPosATL _H_L_9_pos_02;
		};
			_countarr = _countarr + 1;
	} foreach _HL_9_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for House L_9///----------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------

///-----------------------
///-----------------------
///-----------------------
///Start Squad for House K_1  ///----------------------------------
///-----------------------
///-----------------------
///-----------------------

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {

_H_K_1_pos_00 = _x modelToWorld (_house_K_1_List select 0);
_H_K_1_pos_01 = _x modelToWorld (_house_K_1_List select 1);
_H_K_1_pos_02 = _x modelToWorld (_house_K_1_List select 2);
_H_K_1_pos_03 = _x modelToWorld (_house_K_1_List select 3);
_H_K_1_pos_04 = _x modelToWorld (_house_K_1_List select 4);

///Possible Units
_HK1_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
_HK1_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HK1_pos02Unit = _rifPosPos select (round(random _rifPosPosNum));
_HK1_pos03Unit = _rifPosPos select (round(random _rifPosPosNum));
_HK1_pos04Unit = _rifPosPos select (round(random _rifPosPosNum)); 

 

_K1_squad = createGroup _factionside; ///Create Group



_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HK1_pos00Unit createUnit [getmarkerpos _initialSpawn, _K1_squad,"K1_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK1_pos01Unit createUnit [getmarkerpos _initialSpawn, _K1_squad,"K1_squad_mem_01 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK1_pos02Unit createUnit [getmarkerpos _initialSpawn, _K1_squad,"K1_squad_mem_02 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK1_pos03Unit createUnit [getmarkerpos _initialSpawn, _K1_squad,"K1_squad_mem_03 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK1_pos04Unit createUnit [getmarkerpos _initialSpawn, _K1_squad,"K1_squad_mem_04 = this;", _unitskill, _unitrank]};





{_x enableattack false} forEach units _K1_squad;
{dostop _x} foreach units _K1_squad;



_K1_squad_members = units _K1_squad;
K1_squad_mem_00 setPosATL _H_K_1_pos_00;
K1_squad_mem_01 setPosATL _H_K_1_pos_01;
K1_squad_mem_02 setPosATL _H_K_1_pos_02;
K1_squad_mem_03 setPosATL _H_K_1_pos_03;
K1_squad_mem_04 setPosATL _H_K_1_pos_04;
K1_squad_mem_00 setUnitPos "Middle";
K1_squad_mem_01 setUnitPos "Up";
K1_squad_mem_02 setUnitPos "Up";
K1_squad_mem_03 setUnitPos "Up";
K1_squad_mem_04 setUnitPos "Up";

		};
			_countarr = _countarr + 1;
	} foreach _HK_1_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for House K_1///-----------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------

///-----------------------
///-----------------------
///-----------------------
///Start Squad for House K_3  ///----------------------------------
///-----------------------
///-----------------------
///-----------------------
///12 Positions

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_H_K_3_pos_00 = _x modelToWorld (_house_K_3_List select 0);
_H_K_3_pos_01 = _x modelToWorld (_house_K_3_List select 1);
_H_K_3_pos_02 = _x modelToWorld (_house_K_3_List select 2);
_H_K_3_pos_03 = _x modelToWorld (_house_K_3_List select 3);
_H_K_3_pos_04 = _x modelToWorld (_house_K_3_List select 4);
_H_K_3_pos_05 = _x modelToWorld (_house_K_3_List select 5);
_H_K_3_pos_06 = _x modelToWorld (_house_K_3_List select 6);
_H_K_3_pos_07 = _x modelToWorld (_house_K_3_List select 7);
_H_K_3_pos_08 = _x modelToWorld (_house_K_3_List select 8);
_H_K_3_pos_09 = _x modelToWorld (_house_K_3_List select 9);
_H_K_3_pos_10 = _x modelToWorld (_house_K_3_List select 10);
_H_K_3_pos_11 = _x modelToWorld (_house_K_3_List select 11);

///Possible Units
_HK3_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
_HK3_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HK3_pos02Unit = _rifPosPos select (round(random _rifPosPosNum));
_HK3_pos03Unit = _rifPosPos select (round(random _rifPosPosNum));
_HK3_pos04Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HK3_pos05Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HK3_pos06Unit = _rifPosPos select (round(random _rifPosPosNum));
_HK3_pos07Unit = _rifPosPos select (round(random _rifPosPosNum));
_HK3_pos08Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HK3_pos09Unit = _atPosPos select (round(random _atPosPosNum)); 
_HK3_pos10Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HK3_pos11Unit = _atmgPosPos select (round(random _atmgPosPosNum));


 

_K3_squad = createGroup _factionside; ///Create Group



_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HK3_pos00Unit createUnit [getmarkerpos _initialSpawn, _K3_squad,"K3_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK3_pos01Unit createUnit [getmarkerpos _initialSpawn, _K3_squad,"K3_squad_mem_01 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK3_pos02Unit createUnit [getmarkerpos _initialSpawn, _K3_squad,"K3_squad_mem_02 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK3_pos03Unit createUnit [getmarkerpos _initialSpawn, _K3_squad,"K3_squad_mem_03 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HK3_pos04Unit createUnit [getmarkerpos _initialSpawn, _K3_squad,"K3_squad_mem_04 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK3_pos05Unit createUnit [getmarkerpos _initialSpawn, _K3_squad,"K3_squad_mem_05 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK3_pos06Unit createUnit [getmarkerpos _initialSpawn, _K3_squad,"K3_squad_mem_06 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK3_pos07Unit createUnit [getmarkerpos _initialSpawn, _K3_squad,"K3_squad_mem_07 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosBalconyOnOff == 1) then {_HK3_pos08Unit createUnit [getmarkerpos _initialSpawn, _K3_squad,"K3_squad_mem_08 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosBalconyOnOff == 1) then {_HK3_pos09Unit createUnit [getmarkerpos _initialSpawn, _K3_squad,"K3_squad_mem_09 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosBalconyOnOff == 1) then {_HK3_pos10Unit createUnit [getmarkerpos _initialSpawn, _K3_squad,"K3_squad_mem_10 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosBalconyOnOff == 1) then {_HK3_pos11Unit createUnit [getmarkerpos _initialSpawn, _K3_squad,"K3_squad_mem_11 = this;", _unitskill, _unitrank]};







{_x enableattack false} forEach units _K3_squad;
{dostop _x} foreach units _K3_squad;



_K3_squad_members = units _K3_squad;
K3_squad_mem_00 setunitpos "Middle"; K3_squad_mem_00 setPosATL _H_K_3_pos_00;
K3_squad_mem_01 setunitpos "Up"; K3_squad_mem_01 setPosATL _H_K_3_pos_01; 
K3_squad_mem_02 setunitpos "Up"; K3_squad_mem_02 setPosATL _H_K_3_pos_02;
K3_squad_mem_03 setunitpos "Up"; K3_squad_mem_03 setPosATL _H_K_3_pos_03;
K3_squad_mem_04 setunitpos "Middle"; K3_squad_mem_04 setPosATL _H_K_3_pos_04; 
K3_squad_mem_05 setunitpos "Up"; K3_squad_mem_05 setPosATL _H_K_3_pos_05;
K3_squad_mem_06 setunitpos "Up"; K3_squad_mem_06 setPosATL _H_K_3_pos_06;
K3_squad_mem_07 setunitpos "Up"; K3_squad_mem_07 setPosATL _H_K_3_pos_07;
K3_squad_mem_08 setunitpos "Middle"; K3_squad_mem_08 setPosATL _H_K_3_pos_08;
K3_squad_mem_09 setunitpos "Up"; K3_squad_mem_09 setPosATL _H_K_3_pos_09; 
K3_squad_mem_10 setunitpos "Middle"; K3_squad_mem_10 setPosATL _H_K_3_pos_10;
K3_squad_mem_11 setunitpos "Down"; K3_squad_mem_11 setPosATL _H_K_3_pos_11;


		};
			_countarr = _countarr + 1;
	} foreach _HK_3_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for House K_3///-----------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------

///-----------------------
///-----------------------
///-----------------------
///Start Squad for House K_5  ///----------------------------------
///-----------------------
///-----------------------
///-----------------------
///6 Positions

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_H_K_5_pos_00 = _x modelToWorld (_house_K_5_List select 0);
_H_K_5_pos_01 = _x modelToWorld (_house_K_5_List select 1);
_H_K_5_pos_02 = _x modelToWorld (_house_K_5_List select 2);
_H_K_5_pos_03 = _x modelToWorld (_house_K_5_List select 3);
_H_K_5_pos_04 = _x modelToWorld (_house_K_5_List select 4);
_H_K_5_pos_05 = _x modelToWorld (_house_K_5_List select 5);

///Possible Units
_HK5_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
_HK5_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HK5_pos02Unit = _rifPosPos select (round(random _rifPosPosNum));
_HK5_pos03Unit = _rifPosPos select (round(random _rifPosPosNum));
_HK5_pos04Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HK5_pos05Unit = _rifPosPos select (round(random _rifPosPosNum)); 
 

_K5_squad = createGroup _factionside; ///Create Group



_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HK5_pos00Unit createUnit [getmarkerpos _initialSpawn, _K5_squad,"K5_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK5_pos01Unit createUnit [getmarkerpos _initialSpawn, _K5_squad,"K5_squad_mem_01 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK5_pos02Unit createUnit [getmarkerpos _initialSpawn, _K5_squad,"K5_squad_mem_02 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK5_pos03Unit createUnit [getmarkerpos _initialSpawn, _K5_squad,"K5_squad_mem_03 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK5_pos04Unit createUnit [getmarkerpos _initialSpawn, _K5_squad,"K5_squad_mem_04 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HK5_pos05Unit createUnit [getmarkerpos _initialSpawn, _K5_squad,"K5_squad_mem_05 = this;", _unitskill, _unitrank]};





{_x enableattack false} forEach units _K5_squad;
{dostop _x} foreach units _K5_squad;



_K5_squad_members = units _K5_squad;
K5_squad_mem_00 setPosATL _H_K_5_pos_00;
K5_squad_mem_01 setPosATL _H_K_5_pos_01;
K5_squad_mem_02 setPosATL _H_K_5_pos_02;
K5_squad_mem_03 setPosATL _H_K_5_pos_03;
K5_squad_mem_04 setPosATL _H_K_5_pos_04;
K5_squad_mem_05 setPosATL _H_K_5_pos_05;
K5_squad_mem_00 setUnitPos "Middle";
K5_squad_mem_01 setUnitPos "Up";
K5_squad_mem_02 setUnitPos "Up";
K5_squad_mem_03 setUnitPos "Up";
K5_squad_mem_04 setUnitPos "Up";
K5_squad_mem_05 setUnitPos "Middle";

		};
			_countarr = _countarr + 1;
	} foreach _HK_5_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for House K_5///-----------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------
///-----------------------
///-----------------------
///-----------------------
///Start Squad for House K_6  ///----------------------------------
///-----------------------
///-----------------------
///-----------------------
///18 Positions

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_H_K_6_pos_00 = _x modelToWorld (_house_K_6_List select 0);
_H_K_6_pos_01 = _x modelToWorld (_house_K_6_List select 1);
_H_K_6_pos_02 = _x modelToWorld (_house_K_6_List select 2);
_H_K_6_pos_03 = _x modelToWorld (_house_K_6_List select 3);
_H_K_6_pos_04 = _x modelToWorld (_house_K_6_List select 4);
_H_K_6_pos_05 = _x modelToWorld (_house_K_6_List select 5);
_H_K_6_pos_06 = _x modelToWorld (_house_K_6_List select 6);
_H_K_6_pos_07 = _x modelToWorld (_house_K_6_List select 7);
_H_K_6_pos_08 = _x modelToWorld (_house_K_6_List select 8);
_H_K_6_pos_09 = _x modelToWorld (_house_K_6_List select 9);
_H_K_6_pos_10 = _x modelToWorld (_house_K_6_List select 10);
_H_K_6_pos_11 = _x modelToWorld (_house_K_6_List select 11);
_H_K_6_pos_12 = _x modelToWorld (_house_K_6_List select 12);
_H_K_6_pos_13 = _x modelToWorld (_house_K_6_List select 13);
_H_K_6_pos_14 = _x modelToWorld (_house_K_6_List select 14);
_H_K_6_pos_15 = _x modelToWorld (_house_K_6_List select 15);
_H_K_6_pos_16 = _x modelToWorld (_house_K_6_List select 16);
_H_K_6_pos_17 = _x modelToWorld (_house_K_6_List select 17);


///Possible Units
_HK6_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
_HK6_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HK6_pos02Unit = _rifPosPos select (round(random _rifPosPosNum));
_HK6_pos03Unit = _rifPosPos select (round(random _rifPosPosNum));
_HK6_pos04Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HK6_pos05Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HK6_pos06Unit = _rifPosPos select (round(random _rifPosPosNum));
_HK6_pos07Unit = _rifPosPos select (round(random _rifPosPosNum));
_HK6_pos08Unit = _rifPosPos select (round(random _rifPosPosNum));
_HK6_pos09Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HK6_pos10Unit = _rifPosPos select (round(random _rifPosPosNum));
_HK6_pos11Unit = _rifPosPos select (round(random _rifPosPosNum));
_HK6_pos12Unit = _rifPosPos select (round(random _rifPosPosNum));
_HK6_pos13Unit = _rifPosPos select (round(random _rifPosPosNum));
_HK6_pos14Unit = _rifPosPos select (round(random _rifPosPosNum));
_HK6_pos15Unit = _atmgPosPos select (round(random _atmgPosPosNum)); 
_HK6_pos16Unit = _atPosPos select (round(random _atPosPosNum));
_HK6_pos17Unit = _atmgPosPos select (round(random _atmgPosPosNum));


 

_K6_squad = createGroup _factionside; ///Create Group



_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HK6_pos00Unit createUnit [getmarkerpos _initialSpawn, _K6_squad,"K6_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK6_pos01Unit createUnit [getmarkerpos _initialSpawn, _K6_squad,"K6_squad_mem_01 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK6_pos02Unit createUnit [getmarkerpos _initialSpawn, _K6_squad,"K6_squad_mem_02 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK6_pos03Unit createUnit [getmarkerpos _initialSpawn, _K6_squad,"K6_squad_mem_03 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HK6_pos04Unit createUnit [getmarkerpos _initialSpawn, _K6_squad,"K6_squad_mem_04 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK6_pos05Unit createUnit [getmarkerpos _initialSpawn, _K6_squad,"K6_squad_mem_05 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK6_pos06Unit createUnit [getmarkerpos _initialSpawn, _K6_squad,"K6_squad_mem_06 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK6_pos07Unit createUnit [getmarkerpos _initialSpawn, _K6_squad,"K6_squad_mem_07 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK6_pos08Unit createUnit [getmarkerpos _initialSpawn, _K6_squad,"K6_squad_mem_08 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK6_pos09Unit createUnit [getmarkerpos _initialSpawn, _K6_squad,"K6_squad_mem_09 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosBalconyOnOff == 1) then {_HK6_pos10Unit createUnit [getmarkerpos _initialSpawn, _K6_squad,"K6_squad_mem_10 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK6_pos11Unit createUnit [getmarkerpos _initialSpawn, _K6_squad,"K6_squad_mem_11 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK6_pos12Unit createUnit [getmarkerpos _initialSpawn, _K6_squad,"K6_squad_mem_12 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK6_pos13Unit createUnit [getmarkerpos _initialSpawn, _K6_squad,"K6_squad_mem_13 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK6_pos14Unit createUnit [getmarkerpos _initialSpawn, _K6_squad,"K6_squad_mem_14 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosBalconyOnOff == 1) then {_HK6_pos15Unit createUnit [getmarkerpos _initialSpawn, _K6_squad,"K6_squad_mem_15 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosBalconyOnOff == 1) then {_HK6_pos16Unit createUnit [getmarkerpos _initialSpawn, _K6_squad,"K6_squad_mem_16 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosBalconyOnOff == 1) then {_HK6_pos17Unit createUnit [getmarkerpos _initialSpawn, _K6_squad,"K6_squad_mem_17 = this;", _unitskill, _unitrank]};





{_x enableattack false} forEach units _K6_squad;
{dostop _x} foreach units _K6_squad;



_K6_squad_members = units _K6_squad;
K6_squad_mem_00 setunitpos "Middle"; K6_squad_mem_00 setPosATL _H_K_6_pos_00;
K6_squad_mem_01 setunitpos "Up"; K6_squad_mem_01 setPosATL _H_K_6_pos_01; 
K6_squad_mem_02 setunitpos "Up"; K6_squad_mem_02 setPosATL _H_K_6_pos_02;
K6_squad_mem_03 setunitpos "Up"; K6_squad_mem_03 setPosATL _H_K_6_pos_03;
K6_squad_mem_04 setunitpos "Middle"; K6_squad_mem_04 setPosATL _H_K_6_pos_04; 
K6_squad_mem_05 setunitpos "Up"; K6_squad_mem_05 setPosATL _H_K_6_pos_05;
K6_squad_mem_06 setunitpos "Up"; K6_squad_mem_06 setPosATL _H_K_6_pos_06;
K6_squad_mem_07 setunitpos "Middle"; K6_squad_mem_07 setPosATL _H_K_6_pos_07;
K6_squad_mem_08 setunitpos "Middle"; K6_squad_mem_08 setPosATL _H_K_6_pos_08;
K6_squad_mem_09 setunitpos "Middle"; K6_squad_mem_09 setPosATL _H_K_6_pos_09; 
K6_squad_mem_10 setunitpos "Middle"; K6_squad_mem_10 setPosATL _H_K_6_pos_10;
K6_squad_mem_11 setunitpos "Up"; K6_squad_mem_11 setPosATL _H_K_6_pos_11;
K6_squad_mem_12 setunitpos "Up"; K6_squad_mem_12 setPosATL _H_K_6_pos_12;
K6_squad_mem_13 setunitpos "Up"; K6_squad_mem_13 setPosATL _H_K_6_pos_13;
K6_squad_mem_14 setunitpos "Up"; K6_squad_mem_14 setPosATL _H_K_6_pos_14;
K6_squad_mem_15 setunitpos "Middle"; K6_squad_mem_15 setPosATL _H_K_6_pos_15; 
K6_squad_mem_16 setunitpos "Up"; K6_squad_mem_16 setPosATL _H_K_6_pos_16;
K6_squad_mem_17 setunitpos "Middle"; K6_squad_mem_17 setPosATL _H_K_6_pos_17;

		};
			_countarr = _countarr + 1;
	} foreach _HK_6_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for House K_6///-----------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------

///-----------------------
///-----------------------
///-----------------------
///Start Squad for House K_7  ///----------------------------------
///-----------------------
///-----------------------
///-----------------------
///14 Positions

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_H_K_7_pos_00 = _x modelToWorld (_house_K_7_List select 0);
_H_K_7_pos_01 = _x modelToWorld (_house_K_7_List select 1);
_H_K_7_pos_02 = _x modelToWorld (_house_K_7_List select 2);
_H_K_7_pos_03 = _x modelToWorld (_house_K_7_List select 3);
_H_K_7_pos_04 = _x modelToWorld (_house_K_7_List select 4);
_H_K_7_pos_05 = _x modelToWorld (_house_K_7_List select 5);
_H_K_7_pos_06 = _x modelToWorld (_house_K_7_List select 6);
_H_K_7_pos_07 = _x modelToWorld (_house_K_7_List select 7);
_H_K_7_pos_08 = _x modelToWorld (_house_K_7_List select 8);
_H_K_7_pos_09 = _x modelToWorld (_house_K_7_List select 9);
_H_K_7_pos_10 = _x modelToWorld (_house_K_7_List select 10);
_H_K_7_pos_11 = _x modelToWorld (_house_K_7_List select 11);
_H_K_7_pos_12 = _x modelToWorld (_house_K_7_List select 12);
_H_K_7_pos_13 = _x modelToWorld (_house_K_7_List select 13);



///Possible Units
_HK7_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
_HK7_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HK7_pos02Unit = _rifPosPos select (round(random _rifPosPosNum));
_HK7_pos03Unit = _rifPosPos select (round(random _rifPosPosNum));
_HK7_pos04Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HK7_pos05Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HK7_pos06Unit = _rifPosPos select (round(random _rifPosPosNum));
_HK7_pos07Unit = _rifPosPos select (round(random _rifPosPosNum));
_HK7_pos08Unit = _rifPosPos select (round(random _rifPosPosNum));
_HK7_pos09Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HK7_pos10Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HK7_pos11Unit = _rifPosPos select (round(random _rifPosPosNum));
_HK7_pos12Unit = _atPosPos select (round(random _atPosPosNum));
_HK7_pos13Unit = _mgPosPos select (round(random _mgPosPosNum));
 

_K7_squad = createGroup _factionside; ///Create Group



_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HK7_pos00Unit createUnit [getmarkerpos _initialSpawn, _K7_squad,"K7_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HK7_pos01Unit createUnit [getmarkerpos _initialSpawn, _K7_squad,"K7_squad_mem_01 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK7_pos02Unit createUnit [getmarkerpos _initialSpawn, _K7_squad,"K7_squad_mem_02 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK7_pos03Unit createUnit [getmarkerpos _initialSpawn, _K7_squad,"K7_squad_mem_03 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK7_pos04Unit createUnit [getmarkerpos _initialSpawn, _K7_squad,"K7_squad_mem_04 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK7_pos05Unit createUnit [getmarkerpos _initialSpawn, _K7_squad,"K7_squad_mem_05 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK7_pos06Unit createUnit [getmarkerpos _initialSpawn, _K7_squad,"K7_squad_mem_06 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK7_pos07Unit createUnit [getmarkerpos _initialSpawn, _K7_squad,"K7_squad_mem_07 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK7_pos08Unit createUnit [getmarkerpos _initialSpawn, _K7_squad,"K7_squad_mem_08 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK7_pos09Unit createUnit [getmarkerpos _initialSpawn, _K7_squad,"K7_squad_mem_09 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosBalconyOnOff == 1) then {_HK7_pos10Unit createUnit [getmarkerpos _initialSpawn, _K7_squad,"K7_squad_mem_10 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosBalconyOnOff == 1) then {_HK7_pos11Unit createUnit [getmarkerpos _initialSpawn, _K7_squad,"K7_squad_mem_11 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosBalconyOnOff == 1) then {_HK7_pos12Unit createUnit [getmarkerpos _initialSpawn, _K7_squad,"K7_squad_mem_12 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosBalconyOnOff == 1) then {_HK7_pos13Unit createUnit [getmarkerpos _initialSpawn, _K7_squad,"K7_squad_mem_13 = this;", _unitskill, _unitrank]};





{_x enableattack false} forEach units _K7_squad;
{dostop _x} foreach units _K7_squad;



_K7_squad_members = units _K7_squad;
K7_squad_mem_00 setunitpos "Middle"; K7_squad_mem_00 setPosATL _H_K_7_pos_00;
K7_squad_mem_01 setunitpos "Middle"; K7_squad_mem_01 setPosATL _H_K_7_pos_01; 
K7_squad_mem_02 setunitpos "Up"; K7_squad_mem_02 setPosATL _H_K_7_pos_02;
K7_squad_mem_03 setunitpos "Up"; K7_squad_mem_03 setPosATL _H_K_7_pos_03;
K7_squad_mem_04 setunitpos "Up"; K7_squad_mem_04 setPosATL _H_K_7_pos_04; 
K7_squad_mem_05 setunitpos "Up"; K7_squad_mem_05 setPosATL _H_K_7_pos_05;
K7_squad_mem_06 setunitpos "Middle"; K7_squad_mem_06 setPosATL _H_K_7_pos_06;
K7_squad_mem_07 setunitpos "Up"; K7_squad_mem_07 setPosATL _H_K_7_pos_07;
K7_squad_mem_08 setunitpos "Up"; K7_squad_mem_08 setPosATL _H_K_7_pos_08;
K7_squad_mem_09 setunitpos "Up"; K7_squad_mem_09 setPosATL _H_K_7_pos_09; 
K7_squad_mem_10 setunitpos "Middle"; K7_squad_mem_10 setPosATL _H_K_7_pos_10;
K7_squad_mem_11 setunitpos "Middle"; K7_squad_mem_11 setPosATL _H_K_7_pos_11;
K7_squad_mem_12 setunitpos "Middle"; K7_squad_mem_12 setPosATL _H_K_7_pos_12;
K7_squad_mem_13 setunitpos "Down"; K7_squad_mem_13 setPosATL _H_K_7_pos_13;

		};
			_countarr = _countarr + 1;
	} foreach _HK_7_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for House K_7///-----------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------

///-----------------------
///-----------------------
///-----------------------
///Start Squad for House K_8  ///----------------------------------
///-----------------------
///-----------------------
///-----------------------
///20 Positions

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_H_K_8_pos_00 = _x modelToWorld (_house_K_8_List select 0);
_H_K_8_pos_01 = _x modelToWorld (_house_K_8_List select 1);
_H_K_8_pos_02 = _x modelToWorld (_house_K_8_List select 2);
_H_K_8_pos_03 = _x modelToWorld (_house_K_8_List select 3);
_H_K_8_pos_04 = _x modelToWorld (_house_K_8_List select 4);
_H_K_8_pos_05 = _x modelToWorld (_house_K_8_List select 5);
_H_K_8_pos_06 = _x modelToWorld (_house_K_8_List select 6);
_H_K_8_pos_07 = _x modelToWorld (_house_K_8_List select 7);
_H_K_8_pos_08 = _x modelToWorld (_house_K_8_List select 8);
_H_K_8_pos_09 = _x modelToWorld (_house_K_8_List select 9);
_H_K_8_pos_10 = _x modelToWorld (_house_K_8_List select 10);
_H_K_8_pos_11 = _x modelToWorld (_house_K_8_List select 11);
_H_K_8_pos_12 = _x modelToWorld (_house_K_8_List select 12);
_H_K_8_pos_13 = _x modelToWorld (_house_K_8_List select 13);
_H_K_8_pos_14 = _x modelToWorld (_house_K_8_List select 14);
_H_K_8_pos_15 = _x modelToWorld (_house_K_8_List select 15);
_H_K_8_pos_16 = _x modelToWorld (_house_K_8_List select 16);
_H_K_8_pos_17 = _x modelToWorld (_house_K_8_List select 17);
_H_K_8_pos_18 = _x modelToWorld (_house_K_8_List select 18);

///Possible Units
_HK8_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
_HK8_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HK8_pos02Unit = _rifPosPos select (round(random _rifPosPosNum));
_HK8_pos03Unit = _rifPosPos select (round(random _rifPosPosNum));
_HK8_pos04Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HK8_pos05Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HK8_pos06Unit = _rifPosPos select (round(random _rifPosPosNum));
_HK8_pos07Unit = _rifPosPos select (round(random _rifPosPosNum));
_HK8_pos08Unit = _rifPosPos select (round(random _rifPosPosNum));
_HK8_pos09Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HK8_pos10Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HK8_pos11Unit = _rifPosPos select (round(random _rifPosPosNum));
_HK8_pos12Unit = _rifPosPos select (round(random _rifPosPosNum));
_HK8_pos13Unit = _rifPosPos select (round(random _rifPosPosNum));
_HK8_pos14Unit = _rifPosPos select (round(random _rifPosPosNum));
_HK8_pos15Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HK8_pos16Unit = _rifPosPos select (round(random _rifPosPosNum));
_HK8_pos17Unit = _rifPosPos select (round(random _rifPosPosNum));
_HK8_pos18Unit = _atmgPosPos select (round(random _atmgPosPosNum));

 

_K8_squad = createGroup _factionside; ///Create Group



_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));

if (random 1 <= _percentPosGar  && _PosDoorOnOff == 1) then {_HK8_pos00Unit createUnit [getmarkerpos _initialSpawn, _K8_squad,"K8_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK8_pos01Unit createUnit [getmarkerpos _initialSpawn, _K8_squad,"K8_squad_mem_01 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK8_pos02Unit createUnit [getmarkerpos _initialSpawn, _K8_squad,"K8_squad_mem_02 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK8_pos03Unit createUnit [getmarkerpos _initialSpawn, _K8_squad,"K8_squad_mem_03 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK8_pos04Unit createUnit [getmarkerpos _initialSpawn, _K8_squad,"K8_squad_mem_04 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HK8_pos05Unit createUnit [getmarkerpos _initialSpawn, _K8_squad,"K8_squad_mem_05 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK8_pos06Unit createUnit [getmarkerpos _initialSpawn, _K8_squad,"K8_squad_mem_06 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK8_pos07Unit createUnit [getmarkerpos _initialSpawn, _K8_squad,"K8_squad_mem_07 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HK8_pos08Unit createUnit [getmarkerpos _initialSpawn, _K8_squad,"K8_squad_mem_08 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HK8_pos09Unit createUnit [getmarkerpos _initialSpawn, _K8_squad,"K8_squad_mem_09 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosBalconyOnOff == 1) then {_HK8_pos10Unit createUnit [getmarkerpos _initialSpawn, _K8_squad,"K8_squad_mem_10 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK8_pos11Unit createUnit [getmarkerpos _initialSpawn, _K8_squad,"K8_squad_mem_11 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK8_pos12Unit createUnit [getmarkerpos _initialSpawn, _K8_squad,"K8_squad_mem_12 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HK8_pos13Unit createUnit [getmarkerpos _initialSpawn, _K8_squad,"K8_squad_mem_13 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK8_pos14Unit createUnit [getmarkerpos _initialSpawn, _K8_squad,"K8_squad_mem_14 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK8_pos15Unit createUnit [getmarkerpos _initialSpawn, _K8_squad,"K8_squad_mem_15 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HK8_pos16Unit createUnit [getmarkerpos _initialSpawn, _K8_squad,"K8_squad_mem_16 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HK8_pos17Unit createUnit [getmarkerpos _initialSpawn, _K8_squad,"K8_squad_mem_17 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HK8_pos18Unit createUnit [getmarkerpos _initialSpawn, _K8_squad,"K8_squad_mem_18 = this;", _unitskill, _unitrank]};  





{_x enableattack false} forEach units _K8_squad;
{dostop _x} foreach units _K8_squad;



_K8_squad_members = units _K8_squad;
K8_squad_mem_00 setunitpos "Middle"; K8_squad_mem_00 setPosATL _H_K_8_pos_00;
K8_squad_mem_01 setunitpos "Up"; K8_squad_mem_01 setPosATL _H_K_8_pos_01; 
K8_squad_mem_02 setunitpos "Up"; K8_squad_mem_02 setPosATL _H_K_8_pos_02;
K8_squad_mem_03 setunitpos "Up"; K8_squad_mem_03 setPosATL _H_K_8_pos_03;
K8_squad_mem_04 setunitpos "Up"; K8_squad_mem_04 setPosATL _H_K_8_pos_04; 
K8_squad_mem_05 setunitpos "Middle"; K8_squad_mem_05 setPosATL _H_K_8_pos_05;
K8_squad_mem_06 setunitpos "Up"; K8_squad_mem_06 setPosATL _H_K_8_pos_06;
K8_squad_mem_07 setunitpos "Up"; K8_squad_mem_07 setPosATL _H_K_8_pos_07;
K8_squad_mem_08 setunitpos "Middle"; K8_squad_mem_08 setPosATL _H_K_8_pos_08;
K8_squad_mem_09 setunitpos "Middle"; K8_squad_mem_09 setPosATL _H_K_8_pos_09; 
K8_squad_mem_10 setunitpos "Middle"; K8_squad_mem_10 setPosATL _H_K_8_pos_10;
K8_squad_mem_11 setunitpos "Up"; K8_squad_mem_11 setPosATL _H_K_8_pos_11;
K8_squad_mem_12 setunitpos "Up"; K8_squad_mem_12 setPosATL _H_K_8_pos_12;
K8_squad_mem_13 setunitpos "Middle"; K8_squad_mem_13 setPosATL _H_K_8_pos_13;
K8_squad_mem_14 setunitpos "Up"; K8_squad_mem_14 setPosATL _H_K_8_pos_14;
K8_squad_mem_15 setunitpos "Up"; K8_squad_mem_15 setPosATL _H_K_8_pos_15; 
K8_squad_mem_16 setunitpos "Up"; K8_squad_mem_16 setPosATL _H_K_8_pos_16;
K8_squad_mem_17 setunitpos "Middle"; K8_squad_mem_17 setPosATL _H_K_8_pos_17;
K8_squad_mem_18 setunitpos "Up"; K8_squad_mem_18 setPosATL _H_K_8_pos_18;


		};
			_countarr = _countarr + 1;
	} foreach _HK_8_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for House K_8///-----------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------

///-----------------------
///-----------------------
///-----------------------
///Start Squad for House C_1  ///----------------------------------
///-----------------------
///-----------------------
///-----------------------
///4 Positions

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_H_C_1_pos_00 = _x modelToWorld (_house_C_1_List select 0);
_H_C_1_pos_01 = _x modelToWorld (_house_C_1_List select 1);
_H_C_1_pos_02 = _x modelToWorld (_house_C_1_List select 2);
_H_C_1_pos_03 = _x modelToWorld (_house_C_1_List select 3);


///Possible Units
_HC_1_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC_1_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HC_1_pos02Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC_1_pos03Unit = _rifPosPos select (round(random _rifPosPosNum));


 

_C_1_squad = createGroup _factionside; ///Create Group



_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HC_1_pos00Unit createUnit [getmarkerpos _initialSpawn, _C_1_squad,"C_1_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC_1_pos01Unit createUnit [getmarkerpos _initialSpawn, _C_1_squad,"C_1_squad_mem_01 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC_1_pos02Unit createUnit [getmarkerpos _initialSpawn, _C_1_squad,"C_1_squad_mem_02 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC_1_pos03Unit createUnit [getmarkerpos _initialSpawn, _C_1_squad,"C_1_squad_mem_03 = this;", _unitskill, _unitrank]};





{_x enableattack false} forEach units _C_1_squad;
{dostop _x} foreach units _C_1_squad;



_C_1_squad_members = units _C_1_squad;
C_1_squad_mem_00 setPosATL _H_C_1_pos_00;
C_1_squad_mem_01 setPosATL _H_C_1_pos_01;
C_1_squad_mem_02 setPosATL _H_C_1_pos_02;
C_1_squad_mem_03 setPosATL _H_C_1_pos_03;
C_1_squad_mem_00 setUnitPos "Middle";
C_1_squad_mem_01 setUnitPos "Middle";
C_1_squad_mem_02 setUnitPos "Middle";
C_1_squad_mem_03 setUnitPos "Middle";

		};
			_countarr = _countarr + 1;
	} foreach _HC_1_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for House C_1///-----------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------

///-----------------------
///-----------------------
///-----------------------
///Start Squad for House C_1_v2  ///----------------------------------
///-----------------------
///-----------------------
///-----------------------
///4 Positions


_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_H_C_1_v2_pos_00 = _x modelToWorld (_house_C_1_v2_List select 0);
_H_C_1_v2_pos_01 = _x modelToWorld (_house_C_1_v2_List select 1);
_H_C_1_v2_pos_02 = _x modelToWorld (_house_C_1_v2_List select 2);
_H_C_1_v2_pos_03 = _x modelToWorld (_house_C_1_v2_List select 3);


///Possible Units
_HC_1_v2_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC_1_v2_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HC_1_v2_pos02Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC_1_v2_pos03Unit = _rifPosPos select (round(random _rifPosPosNum));


 

_C_1_v2_squad = createGroup _factionside; ///Create Group



_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC_1_v2_pos00Unit createUnit [getmarkerpos _initialSpawn, _C_1_v2_squad,"C_1_v2_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC_1_v2_pos01Unit createUnit [getmarkerpos _initialSpawn, _C_1_v2_squad,"C_1_v2_squad_mem_01 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC_1_v2_pos02Unit createUnit [getmarkerpos _initialSpawn, _C_1_v2_squad,"C_1_v2_squad_mem_02 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HC_1_v2_pos03Unit createUnit [getmarkerpos _initialSpawn, _C_1_v2_squad,"C_1_v2_squad_mem_03 = this;", _unitskill, _unitrank]};





{_x enableattack false} forEach units _C_1_v2_squad;
{dostop _x} foreach units _C_1_v2_squad;



_C_1_v2_squad_members = units _C_1_v2_squad;
C_1_v2_squad_mem_00 setPosATL _H_C_1_v2_pos_00;
C_1_v2_squad_mem_01 setPosATL _H_C_1_v2_pos_01;
C_1_v2_squad_mem_02 setPosATL _H_C_1_v2_pos_02;
C_1_v2_squad_mem_03 setPosATL _H_C_1_v2_pos_03;
C_1_v2_squad_mem_00 setUnitPos "Middle";
C_1_v2_squad_mem_01 setUnitPos "Middle";
C_1_v2_squad_mem_02 setUnitPos "Middle";
C_1_v2_squad_mem_03 setUnitPos "Middle";


		};
			_countarr = _countarr + 1;
	} foreach _HC_1v2_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for House C_1_v2///-----------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------

///-----------------------
///-----------------------
///-----------------------
///Start Squad for House C_2  ///----------------------------------
///-----------------------
///-----------------------
///-----------------------
///15 Positions

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_H_C_2_pos_00 = _x modelToWorld (_house_C_2_List select 0);
_H_C_2_pos_01 = _x modelToWorld (_house_C_2_List select 1);
_H_C_2_pos_02 = _x modelToWorld (_house_C_2_List select 2);
_H_C_2_pos_03 = _x modelToWorld (_house_C_2_List select 3);
_H_C_2_pos_04 = _x modelToWorld (_house_C_2_List select 4);
_H_C_2_pos_05 = _x modelToWorld (_house_C_2_List select 5);
_H_C_2_pos_06 = _x modelToWorld (_house_C_2_List select 6);
_H_C_2_pos_07 = _x modelToWorld (_house_C_2_List select 7);
_H_C_2_pos_08 = _x modelToWorld (_house_C_2_List select 8);
_H_C_2_pos_09 = _x modelToWorld (_house_C_2_List select 9);
_H_C_2_pos_10 = _x modelToWorld (_house_C_2_List select 10);
_H_C_2_pos_11 = _x modelToWorld (_house_C_2_List select 11);
_H_C_2_pos_12 = _x modelToWorld (_house_C_2_List select 12);
_H_C_2_pos_13 = _x modelToWorld (_house_C_2_List select 13);
_H_C_2_pos_14 = _x modelToWorld (_house_C_2_List select 14);

///Possible Units
_HC2_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC2_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HC2_pos02Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC2_pos03Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC2_pos04Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HC2_pos05Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HC2_pos06Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC2_pos07Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HC2_pos08Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC2_pos09Unit = _atmgPosPos select (round(random _atmgPosPosNum)); 
_HC2_pos10Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC2_pos11Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC2_pos12Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC2_pos13Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC2_pos14Unit = _rifPosPos select (round(random _rifPosPosNum));

_C2_squad = createGroup _factionside; ///Create Group



_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HC2_pos00Unit createUnit [getmarkerpos _initialSpawn, _C2_squad,"C2_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HC2_pos01Unit createUnit [getmarkerpos _initialSpawn, _C2_squad,"C2_squad_mem_01 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC2_pos02Unit createUnit [getmarkerpos _initialSpawn, _C2_squad,"C2_squad_mem_02 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HC2_pos03Unit createUnit [getmarkerpos _initialSpawn, _C2_squad,"C2_squad_mem_03 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HC2_pos04Unit createUnit [getmarkerpos _initialSpawn, _C2_squad,"C2_squad_mem_04 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC2_pos05Unit createUnit [getmarkerpos _initialSpawn, _C2_squad,"C2_squad_mem_05 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC2_pos06Unit createUnit [getmarkerpos _initialSpawn, _C2_squad,"C2_squad_mem_06 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosBalconyOnOff == 1) then {_HC2_pos07Unit createUnit [getmarkerpos _initialSpawn, _C2_squad,"C2_squad_mem_07 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosBalconyOnOff == 1) then {_HC2_pos08Unit createUnit [getmarkerpos _initialSpawn, _C2_squad,"C2_squad_mem_08 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosBalconyOnOff == 1) then {_HC2_pos09Unit createUnit [getmarkerpos _initialSpawn, _C2_squad,"C2_squad_mem_09 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC2_pos10Unit createUnit [getmarkerpos _initialSpawn, _C2_squad,"C2_squad_mem_10 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC2_pos11Unit createUnit [getmarkerpos _initialSpawn, _C2_squad,"C2_squad_mem_11 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC2_pos12Unit createUnit [getmarkerpos _initialSpawn, _C2_squad,"C2_squad_mem_12 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC2_pos13Unit createUnit [getmarkerpos _initialSpawn, _C2_squad,"C2_squad_mem_13 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC2_pos14Unit createUnit [getmarkerpos _initialSpawn, _C2_squad,"C2_squad_mem_14 = this;", _unitskill, _unitrank]};





{_x enableattack false} forEach units _C2_squad;
{dostop _x} foreach units _C2_squad;



_C2_squad_members = units _C2_squad;
C2_squad_mem_00 setunitpos "Middle"; C2_squad_mem_00 setPosATL _H_C_2_pos_00;
C2_squad_mem_01 setunitpos "Middle"; C2_squad_mem_01 setPosATL _H_C_2_pos_01; 
C2_squad_mem_02 setunitpos "Middle"; C2_squad_mem_02 setPosATL _H_C_2_pos_02;
C2_squad_mem_03 setunitpos "Middle"; C2_squad_mem_03 setPosATL _H_C_2_pos_03;
C2_squad_mem_04 setunitpos "Middle"; C2_squad_mem_04 setPosATL _H_C_2_pos_04; 
C2_squad_mem_05 setunitpos "Middle"; C2_squad_mem_05 setPosATL _H_C_2_pos_05;
C2_squad_mem_06 setunitpos "Up"; C2_squad_mem_06 setPosATL _H_C_2_pos_06;
C2_squad_mem_07 setunitpos "Middle"; C2_squad_mem_07 setPosATL _H_C_2_pos_07;
C2_squad_mem_08 setunitpos "Middle"; C2_squad_mem_08 setPosATL _H_C_2_pos_08;
C2_squad_mem_09 setunitpos "Middle"; C2_squad_mem_09 setPosATL _H_C_2_pos_09; 
C2_squad_mem_10 setunitpos "Up"; C2_squad_mem_10 setPosATL _H_C_2_pos_10;
C2_squad_mem_11 setunitpos "Up"; C2_squad_mem_11 setPosATL _H_C_2_pos_11;
C2_squad_mem_12 setunitpos "Up"; C2_squad_mem_12 setPosATL _H_C_2_pos_12;
C2_squad_mem_13 setunitpos "Up"; C2_squad_mem_13 setPosATL _H_C_2_pos_13;
C2_squad_mem_14 setunitpos "Up"; C2_squad_mem_14 setPosATL _H_C_2_pos_14;

		};
			_countarr = _countarr + 1;
	} foreach _HC_2_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for House C_2///-----------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------

///-----------------------
///-----------------------
///-----------------------
///Start Squad for House C_3  ///----------------------------------
///-----------------------
///-----------------------
///-----------------------
///24 Positions

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_H_C_3_pos_00 = _x modelToWorld (_house_C_3_List select 0);
_H_C_3_pos_01 = _x modelToWorld (_house_C_3_List select 1);
_H_C_3_pos_02 = _x modelToWorld (_house_C_3_List select 2);
_H_C_3_pos_03 = _x modelToWorld (_house_C_3_List select 3);
_H_C_3_pos_04 = _x modelToWorld (_house_C_3_List select 4);
_H_C_3_pos_05 = _x modelToWorld (_house_C_3_List select 5);
_H_C_3_pos_06 = _x modelToWorld (_house_C_3_List select 6);
_H_C_3_pos_07 = _x modelToWorld (_house_C_3_List select 7);
_H_C_3_pos_08 = _x modelToWorld (_house_C_3_List select 8);
_H_C_3_pos_09 = _x modelToWorld (_house_C_3_List select 9);
_H_C_3_pos_10 = _x modelToWorld (_house_C_3_List select 10);
_H_C_3_pos_11 = _x modelToWorld (_house_C_3_List select 11);
_H_C_3_pos_12 = _x modelToWorld (_house_C_3_List select 12);
_H_C_3_pos_13 = _x modelToWorld (_house_C_3_List select 13);
_H_C_3_pos_14 = _x modelToWorld (_house_C_3_List select 14);
_H_C_3_pos_15 = _x modelToWorld (_house_C_3_List select 15);
_H_C_3_pos_16 = _x modelToWorld (_house_C_3_List select 16);
_H_C_3_pos_17 = _x modelToWorld (_house_C_3_List select 17);
_H_C_3_pos_18 = _x modelToWorld (_house_C_3_List select 18);
_H_C_3_pos_19 = _x modelToWorld (_house_C_3_List select 19);
_H_C_3_pos_20 = _x modelToWorld (_house_C_3_List select 20);
_H_C_3_pos_21 = _x modelToWorld (_house_C_3_List select 21);
_H_C_3_pos_22 = _x modelToWorld (_house_C_3_List select 22);
_H_C_3_pos_23 = _x modelToWorld (_house_C_3_List select 23);


///Possible Units
_HC3_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC3_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HC3_pos02Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC3_pos03Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC3_pos04Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HC3_pos05Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HC3_pos06Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC3_pos07Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC3_pos08Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC3_pos09Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HC3_pos10Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC3_pos11Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC3_pos12Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC3_pos13Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC3_pos14Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC3_pos15Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC3_pos16Unit = _snipPosPos select (round(random _snipPosPosNum));
_HC3_pos17Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HC3_pos18Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HC3_pos19Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC3_pos20Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HC3_pos21Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HC3_pos22Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HC3_pos23Unit = _atmgPosPos select (round(random _atmgPosPosNum));



_C3_squad = createGroup _factionside; ///Create Group



_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HC3_pos00Unit createUnit [getmarkerpos _initialSpawn, _C3_squad,"C3_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HC3_pos01Unit createUnit [getmarkerpos _initialSpawn, _C3_squad,"C3_squad_mem_01 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC3_pos02Unit createUnit [getmarkerpos _initialSpawn, _C3_squad,"C3_squad_mem_02 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HC3_pos03Unit createUnit [getmarkerpos _initialSpawn, _C3_squad,"C3_squad_mem_03 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC3_pos04Unit createUnit [getmarkerpos _initialSpawn, _C3_squad,"C3_squad_mem_04 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC3_pos05Unit createUnit [getmarkerpos _initialSpawn, _C3_squad,"C3_squad_mem_05 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC3_pos06Unit createUnit [getmarkerpos _initialSpawn, _C3_squad,"C3_squad_mem_06 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC3_pos07Unit createUnit [getmarkerpos _initialSpawn, _C3_squad,"C3_squad_mem_07 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC3_pos08Unit createUnit [getmarkerpos _initialSpawn, _C3_squad,"C3_squad_mem_08 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC3_pos09Unit createUnit [getmarkerpos _initialSpawn, _C3_squad,"C3_squad_mem_09 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC3_pos10Unit createUnit [getmarkerpos _initialSpawn, _C3_squad,"C3_squad_mem_10 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC3_pos11Unit createUnit [getmarkerpos _initialSpawn, _C3_squad,"C3_squad_mem_11 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC3_pos12Unit createUnit [getmarkerpos _initialSpawn, _C3_squad,"C3_squad_mem_12 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC3_pos13Unit createUnit [getmarkerpos _initialSpawn, _C3_squad,"C3_squad_mem_13 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC3_pos14Unit createUnit [getmarkerpos _initialSpawn, _C3_squad,"C3_squad_mem_14 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC3_pos15Unit createUnit [getmarkerpos _initialSpawn, _C3_squad,"C3_squad_mem_15 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HC3_pos16Unit createUnit [getmarkerpos _initialSpawn, _C3_squad,"C3_squad_mem_16 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HC3_pos17Unit createUnit [getmarkerpos _initialSpawn, _C3_squad,"C3_squad_mem_17 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HC3_pos18Unit createUnit [getmarkerpos _initialSpawn, _C3_squad,"C3_squad_mem_18 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HC3_pos19Unit createUnit [getmarkerpos _initialSpawn, _C3_squad,"C3_squad_mem_19 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HC3_pos20Unit createUnit [getmarkerpos _initialSpawn, _C3_squad,"C3_squad_mem_20 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HC3_pos21Unit createUnit [getmarkerpos _initialSpawn, _C3_squad,"C3_squad_mem_21 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HC3_pos22Unit createUnit [getmarkerpos _initialSpawn, _C3_squad,"C3_squad_mem_22 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HC3_pos23Unit createUnit [getmarkerpos _initialSpawn, _C3_squad,"C3_squad_mem_23 = this;", _unitskill, _unitrank]};








{_x enableattack false} forEach units _C3_squad;
{dostop _x} foreach units _C3_squad;



_C3_squad_members = units _C3_squad;
C3_squad_mem_00 setunitpos "Middle"; C3_squad_mem_00 setPosATL _H_C_3_pos_00;
C3_squad_mem_01 setunitpos "Middle"; C3_squad_mem_01 setPosATL _H_C_3_pos_01; 
C3_squad_mem_02 setunitpos "Middle"; C3_squad_mem_02 setPosATL _H_C_3_pos_02;
C3_squad_mem_03 setunitpos "Middle"; C3_squad_mem_03 setPosATL _H_C_3_pos_03;
C3_squad_mem_04 setunitpos "Up"; C3_squad_mem_04 setPosATL _H_C_3_pos_04; 
C3_squad_mem_05 setunitpos "Middle"; C3_squad_mem_05 setPosATL _H_C_3_pos_05;
C3_squad_mem_06 setunitpos "Up"; C3_squad_mem_06 setPosATL _H_C_3_pos_06;
C3_squad_mem_07 setunitpos "Up"; C3_squad_mem_07 setPosATL _H_C_3_pos_07;
C3_squad_mem_08 setunitpos "Up"; C3_squad_mem_08 setPosATL _H_C_3_pos_08;
C3_squad_mem_09 setunitpos "Up"; C3_squad_mem_09 setPosATL _H_C_3_pos_09; 
C3_squad_mem_10 setunitpos "Up"; C3_squad_mem_10 setPosATL _H_C_3_pos_10;
C3_squad_mem_11 setunitpos "Up"; C3_squad_mem_11 setPosATL _H_C_3_pos_11;
C3_squad_mem_12 setunitpos "Up"; C3_squad_mem_12 setPosATL _H_C_3_pos_12;
C3_squad_mem_13 setunitpos "Up"; C3_squad_mem_13 setPosATL _H_C_3_pos_13;
C3_squad_mem_14 setunitpos "Up"; C3_squad_mem_14 setPosATL _H_C_3_pos_14;
C3_squad_mem_15 setunitpos "Up"; C3_squad_mem_15 setPosATL _H_C_3_pos_15;
C3_squad_mem_16 setunitpos "Middle"; C3_squad_mem_16 setPosATL _H_C_3_pos_16;
C3_squad_mem_17 setunitpos "Middle"; C3_squad_mem_17 setPosATL _H_C_3_pos_17;
C3_squad_mem_18 setunitpos "Middle"; C3_squad_mem_18 setPosATL _H_C_3_pos_18;
C3_squad_mem_19 setunitpos "Middle"; C3_squad_mem_19 setPosATL _H_C_3_pos_19;
C3_squad_mem_20 setunitpos "Middle"; C3_squad_mem_20 setPosATL _H_C_3_pos_20;
C3_squad_mem_21 setunitpos "Middle"; C3_squad_mem_21 setPosATL _H_C_3_pos_21;
C3_squad_mem_22 setunitpos "Middle"; C3_squad_mem_22 setPosATL _H_C_3_pos_22;
C3_squad_mem_23 setunitpos "Middle"; C3_squad_mem_23 setPosATL _H_C_3_pos_23;

		};
			_countarr = _countarr + 1;
	} foreach _HC_3_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for House C_3///-----------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------

///-----------------------
///-----------------------
///-----------------------
///Start Squad for House C_4  ///----------------------------------
///-----------------------
///-----------------------
///-----------------------
///18 Positions

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_H_C_4_pos_00 = _x modelToWorld (_house_C_4_List select 0);
_H_C_4_pos_01 = _x modelToWorld (_house_C_4_List select 1);
_H_C_4_pos_02 = _x modelToWorld (_house_C_4_List select 2);
_H_C_4_pos_03 = _x modelToWorld (_house_C_4_List select 3);
_H_C_4_pos_04 = _x modelToWorld (_house_C_4_List select 4);
_H_C_4_pos_05 = _x modelToWorld (_house_C_4_List select 5);
_H_C_4_pos_06 = _x modelToWorld (_house_C_4_List select 6);
_H_C_4_pos_07 = _x modelToWorld (_house_C_4_List select 7);
_H_C_4_pos_08 = _x modelToWorld (_house_C_4_List select 8);
_H_C_4_pos_09 = _x modelToWorld (_house_C_4_List select 9);
_H_C_4_pos_10 = _x modelToWorld (_house_C_4_List select 10);
_H_C_4_pos_11 = _x modelToWorld (_house_C_4_List select 11);
_H_C_4_pos_12 = _x modelToWorld (_house_C_4_List select 12);
_H_C_4_pos_13 = _x modelToWorld (_house_C_4_List select 13);
_H_C_4_pos_14 = _x modelToWorld (_house_C_4_List select 14);
_H_C_4_pos_15 = _x modelToWorld (_house_C_4_List select 15);
_H_C_4_pos_16 = _x modelToWorld (_house_C_4_List select 16);
_H_C_4_pos_17 = _x modelToWorld (_house_C_4_List select 17);



///Possible Units
_HC4_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC4_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HC4_pos02Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC4_pos03Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC4_pos04Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HC4_pos05Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HC4_pos06Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC4_pos07Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC4_pos08Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC4_pos09Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HC4_pos10Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC4_pos11Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC4_pos12Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC4_pos13Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HC4_pos14Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HC4_pos15Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC4_pos16Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC4_pos17Unit = _atmgPosPos select (round(random _atmgPosPosNum));

_C4_squad = createGroup _factionside; ///Create Group



_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));


if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC4_pos00Unit createUnit [getmarkerpos _initialSpawn, _C4_squad,"C4_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC4_pos01Unit createUnit [getmarkerpos _initialSpawn, _C4_squad,"C4_squad_mem_01 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HC4_pos02Unit createUnit [getmarkerpos _initialSpawn, _C4_squad,"C4_squad_mem_02 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC4_pos03Unit createUnit [getmarkerpos _initialSpawn, _C4_squad,"C4_squad_mem_03 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC4_pos04Unit createUnit [getmarkerpos _initialSpawn, _C4_squad,"C4_squad_mem_04 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC4_pos05Unit createUnit [getmarkerpos _initialSpawn, _C4_squad,"C4_squad_mem_05 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC4_pos06Unit createUnit [getmarkerpos _initialSpawn, _C4_squad,"C4_squad_mem_06 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HC4_pos07Unit createUnit [getmarkerpos _initialSpawn, _C4_squad,"C4_squad_mem_07 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC4_pos08Unit createUnit [getmarkerpos _initialSpawn, _C4_squad,"C4_squad_mem_08 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC4_pos09Unit createUnit [getmarkerpos _initialSpawn, _C4_squad,"C4_squad_mem_09 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC4_pos10Unit createUnit [getmarkerpos _initialSpawn, _C4_squad,"C4_squad_mem_10 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC4_pos11Unit createUnit [getmarkerpos _initialSpawn, _C4_squad,"C4_squad_mem_11 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC4_pos12Unit createUnit [getmarkerpos _initialSpawn, _C4_squad,"C4_squad_mem_12 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosBalconyOnOff == 1) then {_HC4_pos13Unit createUnit [getmarkerpos _initialSpawn, _C4_squad,"C4_squad_mem_13 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosBalconyOnOff == 1) then {_HC4_pos14Unit createUnit [getmarkerpos _initialSpawn, _C4_squad,"C4_squad_mem_14 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC4_pos15Unit createUnit [getmarkerpos _initialSpawn, _C4_squad,"C4_squad_mem_15 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC4_pos16Unit createUnit [getmarkerpos _initialSpawn, _C4_squad,"C4_squad_mem_16 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HC4_pos17Unit createUnit [getmarkerpos _initialSpawn, _C4_squad,"C4_squad_mem_17 = this;", _unitskill, _unitrank]};





{_x enableattack false} forEach units _C4_squad;
{dostop _x} foreach units _C4_squad;



_C4_squad_members = units _C4_squad;
C4_squad_mem_00 setunitpos "Up"; C4_squad_mem_00 setPosATL _H_C_4_pos_00;
C4_squad_mem_01 setunitpos "Up"; C4_squad_mem_01 setPosATL _H_C_4_pos_01; 
C4_squad_mem_02 setunitpos "Middle"; C4_squad_mem_02 setPosATL _H_C_4_pos_02;
C4_squad_mem_03 setunitpos "Up"; C4_squad_mem_03 setPosATL _H_C_4_pos_03;
C4_squad_mem_04 setunitpos "Up"; C4_squad_mem_04 setPosATL _H_C_4_pos_04; 
C4_squad_mem_05 setunitpos "Up"; C4_squad_mem_05 setPosATL _H_C_4_pos_05;
C4_squad_mem_06 setunitpos "Up"; C4_squad_mem_06 setPosATL _H_C_4_pos_06;
C4_squad_mem_07 setunitpos "Middle"; C4_squad_mem_07 setPosATL _H_C_4_pos_07;
C4_squad_mem_08 setunitpos "Up"; C4_squad_mem_08 setPosATL _H_C_4_pos_08;
C4_squad_mem_09 setunitpos "Up"; C4_squad_mem_09 setPosATL _H_C_4_pos_09; 
C4_squad_mem_10 setunitpos "Up"; C4_squad_mem_10 setPosATL _H_C_4_pos_10;
C4_squad_mem_11 setunitpos "Up"; C4_squad_mem_11 setPosATL _H_C_4_pos_11;
C4_squad_mem_12 setunitpos "Up"; C4_squad_mem_12 setPosATL _H_C_4_pos_12;
C4_squad_mem_13 setunitpos "Up"; C4_squad_mem_13 setPosATL _H_C_4_pos_13;
C4_squad_mem_14 setunitpos "Up"; C4_squad_mem_14 setPosATL _H_C_4_pos_14;
C4_squad_mem_15 setunitpos "Up"; C4_squad_mem_15 setPosATL _H_C_4_pos_15;
C4_squad_mem_16 setunitpos "Up"; C4_squad_mem_16 setPosATL _H_C_4_pos_16;
C4_squad_mem_17 setunitpos "Middle"; C4_squad_mem_17 setPosATL _H_C_4_pos_17;


		};
			_countarr = _countarr + 1;
	} foreach _HC_4_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for House C_4///-----------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------

///-----------------------
///-----------------------
///-----------------------
///Start Squad for House C_5  ///----------------------------------
///-----------------------
///-----------------------
///-----------------------
///14 Positions

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_H_C_5_pos_00 = _x modelToWorld (_house_C_5_List select 0);
_H_C_5_pos_01 = _x modelToWorld (_house_C_5_List select 1);
_H_C_5_pos_02 = _x modelToWorld (_house_C_5_List select 2);
_H_C_5_pos_03 = _x modelToWorld (_house_C_5_List select 3);
_H_C_5_pos_04 = _x modelToWorld (_house_C_5_List select 4);
_H_C_5_pos_05 = _x modelToWorld (_house_C_5_List select 5);
_H_C_5_pos_06 = _x modelToWorld (_house_C_5_List select 6);
_H_C_5_pos_07 = _x modelToWorld (_house_C_5_List select 7);
_H_C_5_pos_08 = _x modelToWorld (_house_C_5_List select 8);
_H_C_5_pos_09 = _x modelToWorld (_house_C_5_List select 9);
_H_C_5_pos_10 = _x modelToWorld (_house_C_5_List select 10);
_H_C_5_pos_11 = _x modelToWorld (_house_C_5_List select 11);
_H_C_5_pos_12 = _x modelToWorld (_house_C_5_List select 12);
_H_C_5_pos_13 = _x modelToWorld (_house_C_5_List select 13);

///Possible Units
_HC5_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC5_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HC5_pos02Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC5_pos03Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC5_pos04Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HC5_pos05Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HC5_pos06Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC5_pos07Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HC5_pos08Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HC5_pos09Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HC5_pos10Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC5_pos11Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC5_pos12Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HC5_pos13Unit = _rifPosPos select (round(random _rifPosPosNum));

_C5_squad = createGroup _factionside; ///Create Group



_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HC5_pos00Unit createUnit [getmarkerpos _initialSpawn, _C5_squad,"C5_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC5_pos01Unit createUnit [getmarkerpos _initialSpawn, _C5_squad,"C5_squad_mem_01 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC5_pos02Unit createUnit [getmarkerpos _initialSpawn, _C5_squad,"C5_squad_mem_02 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC5_pos03Unit createUnit [getmarkerpos _initialSpawn, _C5_squad,"C5_squad_mem_03 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC5_pos04Unit createUnit [getmarkerpos _initialSpawn, _C5_squad,"C5_squad_mem_04 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC5_pos05Unit createUnit [getmarkerpos _initialSpawn, _C5_squad,"C5_squad_mem_05 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HC5_pos06Unit createUnit [getmarkerpos _initialSpawn, _C5_squad,"C5_squad_mem_06 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HC5_pos07Unit createUnit [getmarkerpos _initialSpawn, _C5_squad,"C5_squad_mem_07 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HC5_pos08Unit createUnit [getmarkerpos _initialSpawn, _C5_squad,"C5_squad_mem_08 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HC5_pos09Unit createUnit [getmarkerpos _initialSpawn, _C5_squad,"C5_squad_mem_09 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HC5_pos10Unit createUnit [getmarkerpos _initialSpawn, _C5_squad,"C5_squad_mem_10 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HC5_pos11Unit createUnit [getmarkerpos _initialSpawn, _C5_squad,"C5_squad_mem_11 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HC5_pos12Unit createUnit [getmarkerpos _initialSpawn, _C5_squad,"C5_squad_mem_12 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HC5_pos13Unit createUnit [getmarkerpos _initialSpawn, _C5_squad,"C5_squad_mem_13 = this;", _unitskill, _unitrank]};


{_x enableattack false} forEach units _C5_squad;
{dostop _x} foreach units _C5_squad;



_C5_squad_members = units _C5_squad;
C5_squad_mem_00 setunitpos "Middle"; C5_squad_mem_00 setPosATL _H_C_5_pos_00;
C5_squad_mem_01 setunitpos "Up"; C5_squad_mem_01 setPosATL _H_C_5_pos_01; 
C5_squad_mem_02 setunitpos "Up"; C5_squad_mem_02 setPosATL _H_C_5_pos_02;
C5_squad_mem_03 setunitpos "Up"; C5_squad_mem_03 setPosATL _H_C_5_pos_03;
C5_squad_mem_04 setunitpos "Up"; C5_squad_mem_04 setPosATL _H_C_5_pos_04; 
C5_squad_mem_05 setunitpos "Up"; C5_squad_mem_05 setPosATL _H_C_5_pos_05;
C5_squad_mem_06 setunitpos "Middle"; C5_squad_mem_06 setPosATL _H_C_5_pos_06;
C5_squad_mem_07 setunitpos "Middle"; C5_squad_mem_07 setPosATL _H_C_5_pos_07;
C5_squad_mem_08 setunitpos "Middle"; C5_squad_mem_08 setPosATL _H_C_5_pos_08;
C5_squad_mem_09 setunitpos "Middle"; C5_squad_mem_09 setPosATL _H_C_5_pos_09; 
C5_squad_mem_10 setunitpos "Middle"; C5_squad_mem_10 setPosATL _H_C_5_pos_10;
C5_squad_mem_11 setunitpos "Middle"; C5_squad_mem_11 setPosATL _H_C_5_pos_11;
C5_squad_mem_12 setunitpos "Middle"; C5_squad_mem_12 setPosATL _H_C_5_pos_12;
C5_squad_mem_13 setunitpos "Middle"; C5_squad_mem_13 setPosATL _H_C_5_pos_13;



		};
			_countarr = _countarr + 1;
	} foreach _HC_5_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for House C_5///-----------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------

///-----------------------
///-----------------------
///-----------------------
///Start Squad for House C_5_v1  ///-------------------------------
///-----------------------
///-----------------------
///-----------------------
///15 Positions

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_H_C_5_v1_pos_00 = _x modelToWorld (_house_C_5_v1_List select 0);
_H_C_5_v1_pos_01 = _x modelToWorld (_house_C_5_v1_List select 1);
_H_C_5_v1_pos_02 = _x modelToWorld (_house_C_5_v1_List select 2);
_H_C_5_v1_pos_03 = _x modelToWorld (_house_C_5_v1_List select 3);
_H_C_5_v1_pos_04 = _x modelToWorld (_house_C_5_v1_List select 4);
_H_C_5_v1_pos_05 = _x modelToWorld (_house_C_5_v1_List select 5);
_H_C_5_v1_pos_06 = _x modelToWorld (_house_C_5_v1_List select 6);
_H_C_5_v1_pos_07 = _x modelToWorld (_house_C_5_v1_List select 7);
_H_C_5_v1_pos_08 = _x modelToWorld (_house_C_5_v1_List select 8);
_H_C_5_v1_pos_09 = _x modelToWorld (_house_C_5_v1_List select 9);
_H_C_5_v1_pos_10 = _x modelToWorld (_house_C_5_v1_List select 10);
_H_C_5_v1_pos_11 = _x modelToWorld (_house_C_5_v1_List select 11);
_H_C_5_v1_pos_12 = _x modelToWorld (_house_C_5_v1_List select 12);
_H_C_5_v1_pos_13 = _x modelToWorld (_house_C_5_v1_List select 13);
_H_C_5_v1_pos_14 = _x modelToWorld (_house_C_5_v1_List select 14);

///Possible Units
_HC5_v1_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC5_v1_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HC5_v1_pos02Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC5_v1_pos03Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC5_v1_pos04Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HC5_v1_pos05Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HC5_v1_pos06Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC5_v1_pos07Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC5_v1_pos08Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HC5_v1_pos09Unit = _atmgPosPos select (round(random _atmgPosPosNum)); 
_HC5_v1_pos10Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HC5_v1_pos11Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC5_v1_pos12Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC5_v1_pos13Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC5_v1_pos14Unit = _rifPosPos select (round(random _rifPosPosNum));

_C5_v1_squad = createGroup _factionside; ///Create Group



_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));


if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HC5_v1_pos00Unit createUnit [getmarkerpos _initialSpawn, _C5_v1_squad,"C5_v1_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC5_v1_pos01Unit createUnit [getmarkerpos _initialSpawn, _C5_v1_squad,"C5_v1_squad_mem_01 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC5_v1_pos02Unit createUnit [getmarkerpos _initialSpawn, _C5_v1_squad,"C5_v1_squad_mem_02 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC5_v1_pos03Unit createUnit [getmarkerpos _initialSpawn, _C5_v1_squad,"C5_v1_squad_mem_03 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC5_v1_pos04Unit createUnit [getmarkerpos _initialSpawn, _C5_v1_squad,"C5_v1_squad_mem_04 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC5_v1_pos05Unit createUnit [getmarkerpos _initialSpawn, _C5_v1_squad,"C5_v1_squad_mem_05 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HC5_v1_pos06Unit createUnit [getmarkerpos _initialSpawn, _C5_v1_squad,"C5_v1_squad_mem_06 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HC5_v1_pos07Unit createUnit [getmarkerpos _initialSpawn, _C5_v1_squad,"C5_v1_squad_mem_07 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HC5_v1_pos08Unit createUnit [getmarkerpos _initialSpawn, _C5_v1_squad,"C5_v1_squad_mem_08 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HC5_v1_pos09Unit createUnit [getmarkerpos _initialSpawn, _C5_v1_squad,"C5_v1_squad_mem_09 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HC5_v1_pos10Unit createUnit [getmarkerpos _initialSpawn, _C5_v1_squad,"C5_v1_squad_mem_10 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HC5_v1_pos11Unit createUnit [getmarkerpos _initialSpawn, _C5_v1_squad,"C5_v1_squad_mem_11 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC5_v1_pos12Unit createUnit [getmarkerpos _initialSpawn, _C5_v1_squad,"C5_v1_squad_mem_12 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC5_v1_pos13Unit createUnit [getmarkerpos _initialSpawn, _C5_v1_squad,"C5_v1_squad_mem_13 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC5_v1_pos14Unit createUnit [getmarkerpos _initialSpawn, _C5_v1_squad,"C5_v1_squad_mem_14 = this;", _unitskill, _unitrank]};




{_x enableattack false} forEach units _C5_v1_squad;
{dostop _x} foreach units _C5_v1_squad;



_C5_v1_squad_members = units _C5_v1_squad;
C5_v1_squad_mem_00 setunitpos "Middle"; C5_v1_squad_mem_00 setPosATL _H_C_5_v1_pos_00;
C5_v1_squad_mem_01 setunitpos "Up"; C5_v1_squad_mem_01 setPosATL _H_C_5_v1_pos_01; 
C5_v1_squad_mem_02 setunitpos "Up"; C5_v1_squad_mem_02 setPosATL _H_C_5_v1_pos_02;
C5_v1_squad_mem_03 setunitpos "Up"; C5_v1_squad_mem_03 setPosATL _H_C_5_v1_pos_03;
C5_v1_squad_mem_04 setunitpos "Up"; C5_v1_squad_mem_04 setPosATL _H_C_5_v1_pos_04; 
C5_v1_squad_mem_05 setunitpos "Up"; C5_v1_squad_mem_05 setPosATL _H_C_5_v1_pos_05;
C5_v1_squad_mem_06 setunitpos "Middle"; C5_v1_squad_mem_06 setPosATL _H_C_5_v1_pos_06;
C5_v1_squad_mem_07 setunitpos "Middle"; C5_v1_squad_mem_07 setPosATL _H_C_5_v1_pos_07;
C5_v1_squad_mem_08 setunitpos "Middle"; C5_v1_squad_mem_08 setPosATL _H_C_5_v1_pos_08;
C5_v1_squad_mem_09 setunitpos "Middle"; C5_v1_squad_mem_09 setPosATL _H_C_5_v1_pos_09; 
C5_v1_squad_mem_10 setunitpos "Middle"; C5_v1_squad_mem_10 setPosATL _H_C_5_v1_pos_10;
C5_v1_squad_mem_11 setunitpos "Up"; C5_v1_squad_mem_11 setPosATL _H_C_5_v1_pos_11;
C5_v1_squad_mem_12 setunitpos "Up"; C5_v1_squad_mem_12 setPosATL _H_C_5_v1_pos_12;
C5_v1_squad_mem_13 setunitpos "Up"; C5_v1_squad_mem_13 setPosATL _H_C_5_v1_pos_13;
C5_v1_squad_mem_14 setunitpos "Up"; C5_v1_squad_mem_14 setPosATL _H_C_5_v1_pos_14;


		};
			_countarr = _countarr + 1;
	} foreach _HC_5v1_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for House C_5_v1///-----------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------
///-----------------------
///-----------------------
///-----------------------
///Start Squad for House C_5_v2  ///-------------------------------
///-----------------------
///-----------------------
///-----------------------
///15 Positions

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_H_C_5_v2_pos_00 = _x modelToWorld (_house_C_5_v2_List select 0);
_H_C_5_v2_pos_01 = _x modelToWorld (_house_C_5_v2_List select 1);
_H_C_5_v2_pos_02 = _x modelToWorld (_house_C_5_v2_List select 2);
_H_C_5_v2_pos_03 = _x modelToWorld (_house_C_5_v2_List select 3);
_H_C_5_v2_pos_04 = _x modelToWorld (_house_C_5_v2_List select 4);
_H_C_5_v2_pos_05 = _x modelToWorld (_house_C_5_v2_List select 5);
_H_C_5_v2_pos_06 = _x modelToWorld (_house_C_5_v2_List select 6);
_H_C_5_v2_pos_07 = _x modelToWorld (_house_C_5_v2_List select 7);
_H_C_5_v2_pos_08 = _x modelToWorld (_house_C_5_v2_List select 8);
_H_C_5_v2_pos_09 = _x modelToWorld (_house_C_5_v2_List select 9);
_H_C_5_v2_pos_10 = _x modelToWorld (_house_C_5_v2_List select 10);
_H_C_5_v2_pos_11 = _x modelToWorld (_house_C_5_v2_List select 11);
_H_C_5_v2_pos_12 = _x modelToWorld (_house_C_5_v2_List select 12);
_H_C_5_v2_pos_13 = _x modelToWorld (_house_C_5_v2_List select 13);
_H_C_5_v2_pos_14 = _x modelToWorld (_house_C_5_v2_List select 14);

///Possible Units
_HC5_v2_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC5_v2_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HC5_v2_pos02Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC5_v2_pos03Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC5_v2_pos04Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HC5_v2_pos05Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HC5_v2_pos06Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC5_v2_pos07Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC5_v2_pos08Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC5_v2_pos09Unit = _atmgPosPos select (round(random _atmgPosPosNum)); 
_HC5_v2_pos10Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC5_v2_pos11Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HC5_v2_pos12Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HC5_v2_pos13Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC5_v2_pos14Unit = _rifPosPos select (round(random _rifPosPosNum));

_C5_v2_squad = createGroup _factionside; ///Create Group



_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HC5_v2_pos00Unit createUnit [getmarkerpos _initialSpawn, _C5_v2_squad,"C5_v2_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC5_v2_pos01Unit createUnit [getmarkerpos _initialSpawn, _C5_v2_squad,"C5_v2_squad_mem_01 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC5_v2_pos02Unit createUnit [getmarkerpos _initialSpawn, _C5_v2_squad,"C5_v2_squad_mem_02 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC5_v2_pos03Unit createUnit [getmarkerpos _initialSpawn, _C5_v2_squad,"C5_v2_squad_mem_03 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC5_v2_pos04Unit createUnit [getmarkerpos _initialSpawn, _C5_v2_squad,"C5_v2_squad_mem_04 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC5_v2_pos05Unit createUnit [getmarkerpos _initialSpawn, _C5_v2_squad,"C5_v2_squad_mem_05 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HC5_v2_pos06Unit createUnit [getmarkerpos _initialSpawn, _C5_v2_squad,"C5_v2_squad_mem_06 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HC5_v2_pos07Unit createUnit [getmarkerpos _initialSpawn, _C5_v2_squad,"C5_v2_squad_mem_07 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HC5_v2_pos08Unit createUnit [getmarkerpos _initialSpawn, _C5_v2_squad,"C5_v2_squad_mem_08 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HC5_v2_pos09Unit createUnit [getmarkerpos _initialSpawn, _C5_v2_squad,"C5_v2_squad_mem_09 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HC5_v2_pos10Unit createUnit [getmarkerpos _initialSpawn, _C5_v2_squad,"C5_v2_squad_mem_10 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HC5_v2_pos11Unit createUnit [getmarkerpos _initialSpawn, _C5_v2_squad,"C5_v2_squad_mem_11 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HC5_v2_pos12Unit createUnit [getmarkerpos _initialSpawn, _C5_v2_squad,"C5_v2_squad_mem_12 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC5_v2_pos13Unit createUnit [getmarkerpos _initialSpawn, _C5_v2_squad,"C5_v2_squad_mem_13 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC5_v2_pos14Unit createUnit [getmarkerpos _initialSpawn, _C5_v2_squad,"C5_v2_squad_mem_14 = this;", _unitskill, _unitrank]};




{_x enableattack false} forEach units _C5_v2_squad;
{dostop _x} foreach units _C5_v2_squad;



_C5_v2_squad_members = units _C5_v2_squad;
C5_v2_squad_mem_00 setunitpos "Middle"; C5_v2_squad_mem_00 setPosATL _H_C_5_v2_pos_00;
C5_v2_squad_mem_01 setunitpos "Up"; C5_v2_squad_mem_01 setPosATL _H_C_5_v2_pos_01; 
C5_v2_squad_mem_02 setunitpos "Up"; C5_v2_squad_mem_02 setPosATL _H_C_5_v2_pos_02;
C5_v2_squad_mem_03 setunitpos "Up"; C5_v2_squad_mem_03 setPosATL _H_C_5_v2_pos_03;
C5_v2_squad_mem_04 setunitpos "Up"; C5_v2_squad_mem_04 setPosATL _H_C_5_v2_pos_04; 
C5_v2_squad_mem_05 setunitpos "Up"; C5_v2_squad_mem_05 setPosATL _H_C_5_v2_pos_05;
C5_v2_squad_mem_06 setunitpos "Middle"; C5_v2_squad_mem_06 setPosATL _H_C_5_v2_pos_06;
C5_v2_squad_mem_07 setunitpos "Middle"; C5_v2_squad_mem_07 setPosATL _H_C_5_v2_pos_07;
C5_v2_squad_mem_08 setunitpos "Middle"; C5_v2_squad_mem_08 setPosATL _H_C_5_v2_pos_08;
C5_v2_squad_mem_09 setunitpos "Middle"; C5_v2_squad_mem_09 setPosATL _H_C_5_v2_pos_09; 
C5_v2_squad_mem_10 setunitpos "Middle"; C5_v2_squad_mem_10 setPosATL _H_C_5_v2_pos_10;
C5_v2_squad_mem_11 setunitpos "Middle"; C5_v2_squad_mem_11 setPosATL _H_C_5_v2_pos_11;
C5_v2_squad_mem_12 setunitpos "Middle"; C5_v2_squad_mem_12 setPosATL _H_C_5_v2_pos_12;
C5_v2_squad_mem_13 setunitpos "Up"; C5_v2_squad_mem_13 setPosATL _H_C_5_v2_pos_13;
C5_v2_squad_mem_14 setunitpos "Up"; C5_v2_squad_mem_14 setPosATL _H_C_5_v2_pos_14;


		};
			_countarr = _countarr + 1;
	} foreach _HC_5v2_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for House C_5_v2///-----------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------
///-----------------------
///-----------------------
///-----------------------
///Start Squad for House C_5_v3  ///-------------------------------
///-----------------------
///-----------------------
///-----------------------
///14 Positions

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_H_C_5_v3_pos_00 = _x modelToWorld (_house_C_5_v3_List select 0);
_H_C_5_v3_pos_01 = _x modelToWorld (_house_C_5_v3_List select 1);
_H_C_5_v3_pos_02 = _x modelToWorld (_house_C_5_v3_List select 2);
_H_C_5_v3_pos_03 = _x modelToWorld (_house_C_5_v3_List select 3);
_H_C_5_v3_pos_04 = _x modelToWorld (_house_C_5_v3_List select 4);
_H_C_5_v3_pos_05 = _x modelToWorld (_house_C_5_v3_List select 5);
_H_C_5_v3_pos_06 = _x modelToWorld (_house_C_5_v3_List select 6);
_H_C_5_v3_pos_07 = _x modelToWorld (_house_C_5_v3_List select 7);
_H_C_5_v3_pos_08 = _x modelToWorld (_house_C_5_v3_List select 8);
_H_C_5_v3_pos_09 = _x modelToWorld (_house_C_5_v3_List select 9);
_H_C_5_v3_pos_10 = _x modelToWorld (_house_C_5_v3_List select 10);
_H_C_5_v3_pos_11 = _x modelToWorld (_house_C_5_v3_List select 11);
_H_C_5_v3_pos_12 = _x modelToWorld (_house_C_5_v3_List select 12);
_H_C_5_v3_pos_13 = _x modelToWorld (_house_C_5_v3_List select 13);

///Possible Units
_HC5_v3_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC5_v3_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HC5_v3_pos02Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC5_v3_pos03Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC5_v3_pos04Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HC5_v3_pos05Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HC5_v3_pos06Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC5_v3_pos07Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC5_v3_pos08Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HC5_v3_pos09Unit = _atmgPosPos select (round(random _atmgPosPosNum)); 
_HC5_v3_pos10Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC5_v3_pos11Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC5_v3_pos12Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC5_v3_pos13Unit = _rifPosPos select (round(random _rifPosPosNum));

_C5_v3_squad = createGroup _factionside; ///Create Group



_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HC5_v3_pos00Unit createUnit [getmarkerpos _initialSpawn, _C5_v3_squad,"C5_v3_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC5_v3_pos01Unit createUnit [getmarkerpos _initialSpawn, _C5_v3_squad,"C5_v3_squad_mem_01 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC5_v3_pos02Unit createUnit [getmarkerpos _initialSpawn, _C5_v3_squad,"C5_v3_squad_mem_02 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC5_v3_pos03Unit createUnit [getmarkerpos _initialSpawn, _C5_v3_squad,"C5_v3_squad_mem_03 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC5_v3_pos04Unit createUnit [getmarkerpos _initialSpawn, _C5_v3_squad,"C5_v3_squad_mem_04 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC5_v3_pos05Unit createUnit [getmarkerpos _initialSpawn, _C5_v3_squad,"C5_v3_squad_mem_05 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HC5_v3_pos06Unit createUnit [getmarkerpos _initialSpawn, _C5_v3_squad,"C5_v3_squad_mem_06 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HC5_v3_pos07Unit createUnit [getmarkerpos _initialSpawn, _C5_v3_squad,"C5_v3_squad_mem_07 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HC5_v3_pos08Unit createUnit [getmarkerpos _initialSpawn, _C5_v3_squad,"C5_v3_squad_mem_08 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HC5_v3_pos09Unit createUnit [getmarkerpos _initialSpawn, _C5_v3_squad,"C5_v3_squad_mem_09 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC5_v3_pos10Unit createUnit [getmarkerpos _initialSpawn, _C5_v3_squad,"C5_v3_squad_mem_10 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC5_v3_pos11Unit createUnit [getmarkerpos _initialSpawn, _C5_v3_squad,"C5_v3_squad_mem_11 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC5_v3_pos12Unit createUnit [getmarkerpos _initialSpawn, _C5_v3_squad,"C5_v3_squad_mem_12 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC5_v3_pos13Unit createUnit [getmarkerpos _initialSpawn, _C5_v3_squad,"C5_v3_squad_mem_13 = this;", _unitskill, _unitrank]};




{_x enableattack false} forEach units _C5_v3_squad;
{dostop _x} foreach units _C5_v3_squad;



_C5_v3_squad_members = units _C5_v3_squad;
C5_v3_squad_mem_00 setunitpos "Middle"; C5_v3_squad_mem_00 setPosATL _H_C_5_v3_pos_00;
C5_v3_squad_mem_01 setunitpos "Up"; C5_v3_squad_mem_01 setPosATL _H_C_5_v3_pos_01; 
C5_v3_squad_mem_02 setunitpos "Up"; C5_v3_squad_mem_02 setPosATL _H_C_5_v3_pos_02;
C5_v3_squad_mem_03 setunitpos "Up"; C5_v3_squad_mem_03 setPosATL _H_C_5_v3_pos_03;
C5_v3_squad_mem_04 setunitpos "Up"; C5_v3_squad_mem_04 setPosATL _H_C_5_v3_pos_04; 
C5_v3_squad_mem_05 setunitpos "Up"; C5_v3_squad_mem_05 setPosATL _H_C_5_v3_pos_05;
C5_v3_squad_mem_06 setunitpos "Middle"; C5_v3_squad_mem_06 setPosATL _H_C_5_v3_pos_06;
C5_v3_squad_mem_07 setunitpos "Middle"; C5_v3_squad_mem_07 setPosATL _H_C_5_v3_pos_07;
C5_v3_squad_mem_08 setunitpos "Middle"; C5_v3_squad_mem_08 setPosATL _H_C_5_v3_pos_08;
C5_v3_squad_mem_09 setunitpos "Middle"; C5_v3_squad_mem_09 setPosATL _H_C_5_v3_pos_09; 
C5_v3_squad_mem_10 setunitpos "Up"; C5_v3_squad_mem_10 setPosATL _H_C_5_v3_pos_10;
C5_v3_squad_mem_11 setunitpos "Up"; C5_v3_squad_mem_11 setPosATL _H_C_5_v3_pos_11;
C5_v3_squad_mem_12 setunitpos "Up"; C5_v3_squad_mem_12 setPosATL _H_C_5_v3_pos_12;
C5_v3_squad_mem_13 setunitpos "Up"; C5_v3_squad_mem_13 setPosATL _H_C_5_v3_pos_13;


		};
			_countarr = _countarr + 1;
	} foreach _HC_5v3_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for House C_5_v3///-----------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------


///-----------------------
///-----------------------
///-----------------------
///Start Squad for House C_9  ///----------------------------------
///-----------------------
///-----------------------
///-----------------------
///17 Positions

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_H_C_9_pos_00 = _x modelToWorld (_house_C_9_List select 0);
_H_C_9_pos_01 = _x modelToWorld (_house_C_9_List select 1);
_H_C_9_pos_02 = _x modelToWorld (_house_C_9_List select 2);
_H_C_9_pos_03 = _x modelToWorld (_house_C_9_List select 3);
_H_C_9_pos_04 = _x modelToWorld (_house_C_9_List select 4);
_H_C_9_pos_05 = _x modelToWorld (_house_C_9_List select 5);
_H_C_9_pos_06 = _x modelToWorld (_house_C_9_List select 6);
_H_C_9_pos_07 = _x modelToWorld (_house_C_9_List select 7);
_H_C_9_pos_08 = _x modelToWorld (_house_C_9_List select 8);
_H_C_9_pos_09 = _x modelToWorld (_house_C_9_List select 9);
_H_C_9_pos_10 = _x modelToWorld (_house_C_9_List select 10);
_H_C_9_pos_11 = _x modelToWorld (_house_C_9_List select 11);
_H_C_9_pos_12 = _x modelToWorld (_house_C_9_List select 12);
_H_C_9_pos_13 = _x modelToWorld (_house_C_9_List select 13);
_H_C_9_pos_14 = _x modelToWorld (_house_C_9_List select 14);
_H_C_9_pos_15 = _x modelToWorld (_house_C_9_List select 15);
_H_C_9_pos_16 = _x modelToWorld (_house_C_9_List select 16);

///Possible Units
_HC9_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC9_pos01Unit = _atmgPosPos select (round(random _atmgPosPosNum)); 
_HC9_pos02Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC9_pos03Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC9_pos04Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HC9_pos05Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HC9_pos06Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC9_pos07Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC9_pos08Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HC9_pos09Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HC9_pos10Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC9_pos11Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC9_pos12Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HC9_pos13Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HC9_pos14Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HC9_pos15Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HC9_pos16Unit = _atmgPosPos select (round(random _atmgPosPosNum));

_C9_squad = createGroup _factionside; ///Create Group



_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HC9_pos00Unit createUnit [getmarkerpos _initialSpawn, _C9_squad,"C9_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HC9_pos01Unit createUnit [getmarkerpos _initialSpawn, _C9_squad,"C9_squad_mem_01 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC9_pos02Unit createUnit [getmarkerpos _initialSpawn, _C9_squad,"C9_squad_mem_02 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC9_pos03Unit createUnit [getmarkerpos _initialSpawn, _C9_squad,"C9_squad_mem_03 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC9_pos04Unit createUnit [getmarkerpos _initialSpawn, _C9_squad,"C9_squad_mem_04 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC9_pos05Unit createUnit [getmarkerpos _initialSpawn, _C9_squad,"C9_squad_mem_05 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC9_pos06Unit createUnit [getmarkerpos _initialSpawn, _C9_squad,"C9_squad_mem_06 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC9_pos07Unit createUnit [getmarkerpos _initialSpawn, _C9_squad,"C9_squad_mem_07 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosBalconyOnOff == 1) then {_HC9_pos08Unit createUnit [getmarkerpos _initialSpawn, _C9_squad,"C9_squad_mem_08 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosBalconyOnOff == 1) then {_HC9_pos09Unit createUnit [getmarkerpos _initialSpawn, _C9_squad,"C9_squad_mem_09 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosBalconyOnOff == 1) then {_HC9_pos10Unit createUnit [getmarkerpos _initialSpawn, _C9_squad,"C9_squad_mem_10 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HC9_pos11Unit createUnit [getmarkerpos _initialSpawn, _C9_squad,"C9_squad_mem_11 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HC9_pos12Unit createUnit [getmarkerpos _initialSpawn, _C9_squad,"C9_squad_mem_12 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HC9_pos13Unit createUnit [getmarkerpos _initialSpawn, _C9_squad,"C9_squad_mem_13 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HC9_pos14Unit createUnit [getmarkerpos _initialSpawn, _C9_squad,"C9_squad_mem_14 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HC9_pos15Unit createUnit [getmarkerpos _initialSpawn, _C9_squad,"C9_squad_mem_15 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HC9_pos16Unit createUnit [getmarkerpos _initialSpawn, _C9_squad,"C9_squad_mem_16 = this;", _unitskill, _unitrank]};





{_x enableattack false} forEach units _C9_squad;
{dostop _x} foreach units _C9_squad;



_C9_squad_members = units _C9_squad;
C9_squad_mem_00 setunitpos "Middle"; C9_squad_mem_00 setPosATL _H_C_9_pos_00;
C9_squad_mem_01 setunitpos "Middle"; C9_squad_mem_01 setPosATL _H_C_9_pos_01; 
C9_squad_mem_02 setunitpos "Up"; C9_squad_mem_02 setPosATL _H_C_9_pos_02;
C9_squad_mem_03 setunitpos "Up"; C9_squad_mem_03 setPosATL _H_C_9_pos_03;
C9_squad_mem_04 setunitpos "Up"; C9_squad_mem_04 setPosATL _H_C_9_pos_04; 
C9_squad_mem_05 setunitpos "Up"; C9_squad_mem_05 setPosATL _H_C_9_pos_05;
C9_squad_mem_06 setunitpos "Up"; C9_squad_mem_06 setPosATL _H_C_9_pos_06;
C9_squad_mem_07 setunitpos "Up"; C9_squad_mem_07 setPosATL _H_C_9_pos_07;
C9_squad_mem_08 setunitpos "Middle"; C9_squad_mem_08 setPosATL _H_C_9_pos_08;
C9_squad_mem_09 setunitpos "Up"; C9_squad_mem_09 setPosATL _H_C_9_pos_09; 
C9_squad_mem_10 setunitpos "Up"; C9_squad_mem_10 setPosATL _H_C_9_pos_10;
C9_squad_mem_11 setunitpos "Middle"; C9_squad_mem_11 setPosATL _H_C_9_pos_11;
C9_squad_mem_12 setunitpos "Middle"; C9_squad_mem_12 setPosATL _H_C_9_pos_12;
C9_squad_mem_13 setunitpos "Middle"; C9_squad_mem_13 setPosATL _H_C_9_pos_13;
C9_squad_mem_14 setunitpos "Up"; C9_squad_mem_14 setPosATL _H_C_9_pos_14;
C9_squad_mem_15 setunitpos "Up"; C9_squad_mem_15 setPosATL _H_C_9_pos_15;
C9_squad_mem_16 setunitpos "Middle"; C9_squad_mem_16 setPosATL _H_C_9_pos_16;

		};
			_countarr = _countarr + 1;
	} foreach _HC_9_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for House C_9///-----------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------


///-----------------------
///-----------------------
///-----------------------
///Start Squad for House C_10  ///----------------------------------
///-----------------------
///-----------------------
///-----------------------
///23 Positions

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_H_C_10_pos_00 = _x modelToWorld (_house_C_10_List select 0);
_H_C_10_pos_01 = _x modelToWorld (_house_C_10_List select 1);
_H_C_10_pos_02 = _x modelToWorld (_house_C_10_List select 2);
_H_C_10_pos_03 = _x modelToWorld (_house_C_10_List select 3);
_H_C_10_pos_04 = _x modelToWorld (_house_C_10_List select 4);
_H_C_10_pos_05 = _x modelToWorld (_house_C_10_List select 5);
_H_C_10_pos_06 = _x modelToWorld (_house_C_10_List select 6);
_H_C_10_pos_07 = _x modelToWorld (_house_C_10_List select 7);
_H_C_10_pos_08 = _x modelToWorld (_house_C_10_List select 8);
_H_C_10_pos_09 = _x modelToWorld (_house_C_10_List select 9);
_H_C_10_pos_10 = _x modelToWorld (_house_C_10_List select 10);
_H_C_10_pos_11 = _x modelToWorld (_house_C_10_List select 11);
_H_C_10_pos_12 = _x modelToWorld (_house_C_10_List select 12);
_H_C_10_pos_13 = _x modelToWorld (_house_C_10_List select 13);
_H_C_10_pos_14 = _x modelToWorld (_house_C_10_List select 14);
_H_C_10_pos_15 = _x modelToWorld (_house_C_10_List select 15);
_H_C_10_pos_16 = _x modelToWorld (_house_C_10_List select 16);
_H_C_10_pos_17 = _x modelToWorld (_house_C_10_List select 17);
_H_C_10_pos_18 = _x modelToWorld (_house_C_10_List select 18);
_H_C_10_pos_19 = _x modelToWorld (_house_C_10_List select 19);
_H_C_10_pos_20 = _x modelToWorld (_house_C_10_List select 20);
_H_C_10_pos_21 = _x modelToWorld (_house_C_10_List select 21);
_H_C_10_pos_22 = _x modelToWorld (_house_C_10_List select 22);

///Possible Units
_HC10_pos00Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HC10_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HC10_pos02Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC10_pos03Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC10_pos04Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HC10_pos05Unit = _mgPosPos select (round(random _mgPosPosNum)); 
_HC10_pos06Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC10_pos07Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC10_pos08Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC10_pos09Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HC10_pos10Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HC10_pos11Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HC10_pos12Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC10_pos13Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC10_pos14Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HC10_pos15Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HC10_pos16Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HC10_pos17Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HC10_pos18Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC10_pos19Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HC10_pos20Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HC10_pos21Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC10_pos22Unit = _snipPosPos select (round(random _snipPosPosNum));

_C10_squad = createGroup _factionside; ///Create Group


_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));


if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HC10_pos00Unit createUnit [getmarkerpos _initialSpawn, _C10_squad,"C10_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HC10_pos01Unit createUnit [getmarkerpos _initialSpawn, _C10_squad,"C10_squad_mem_01 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC10_pos02Unit createUnit [getmarkerpos _initialSpawn, _C10_squad,"C10_squad_mem_02 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC10_pos03Unit createUnit [getmarkerpos _initialSpawn, _C10_squad,"C10_squad_mem_03 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC10_pos04Unit createUnit [getmarkerpos _initialSpawn, _C10_squad,"C10_squad_mem_04 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC10_pos05Unit createUnit [getmarkerpos _initialSpawn, _C10_squad,"C10_squad_mem_05 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC10_pos06Unit createUnit [getmarkerpos _initialSpawn, _C10_squad,"C10_squad_mem_06 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC10_pos07Unit createUnit [getmarkerpos _initialSpawn, _C10_squad,"C10_squad_mem_07 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC10_pos08Unit createUnit [getmarkerpos _initialSpawn, _C10_squad,"C10_squad_mem_08 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosBalconyOnOff == 1) then {_HC10_pos09Unit createUnit [getmarkerpos _initialSpawn, _C10_squad,"C10_squad_mem_09 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosBalconyOnOff == 1) then {_HC10_pos10Unit createUnit [getmarkerpos _initialSpawn, _C10_squad,"C10_squad_mem_10 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosBalconyOnOff == 1) then {_HC10_pos11Unit createUnit [getmarkerpos _initialSpawn, _C10_squad,"C10_squad_mem_11 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC10_pos12Unit createUnit [getmarkerpos _initialSpawn, _C10_squad,"C10_squad_mem_12 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosBalconyOnOff == 1) then {_HC10_pos13Unit createUnit [getmarkerpos _initialSpawn, _C10_squad,"C10_squad_mem_13 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosBalconyOnOff == 1) then {_HC10_pos14Unit createUnit [getmarkerpos _initialSpawn, _C10_squad,"C10_squad_mem_14 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosBalconyOnOff == 1) then {_HC10_pos15Unit createUnit [getmarkerpos _initialSpawn, _C10_squad,"C10_squad_mem_15 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HC10_pos16Unit createUnit [getmarkerpos _initialSpawn, _C10_squad,"C10_squad_mem_16 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HC10_pos17Unit createUnit [getmarkerpos _initialSpawn, _C10_squad,"C10_squad_mem_17 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HC10_pos18Unit createUnit [getmarkerpos _initialSpawn, _C10_squad,"C10_squad_mem_18 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HC10_pos19Unit createUnit [getmarkerpos _initialSpawn, _C10_squad,"C10_squad_mem_19 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HC10_pos20Unit createUnit [getmarkerpos _initialSpawn, _C10_squad,"C10_squad_mem_20 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HC10_pos21Unit createUnit [getmarkerpos _initialSpawn, _C10_squad,"C10_squad_mem_21 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HC10_pos22Unit createUnit [getmarkerpos _initialSpawn, _C10_squad,"C10_squad_mem_22 = this;", _unitskill, _unitrank]};




{_x enableattack false} forEach units _C10_squad;
{dostop _x} foreach units _C10_squad;



_C10_squad_members = units _C10_squad;
C10_squad_mem_00 setunitpos "AUTO"; C10_squad_mem_00 setPosATL _H_C_10_pos_00;
C10_squad_mem_01 setunitpos "AUTO"; C10_squad_mem_01 setPosATL _H_C_10_pos_01; 
C10_squad_mem_02 setunitpos "Up"; C10_squad_mem_02 setPosATL _H_C_10_pos_02;
C10_squad_mem_03 setunitpos "Middle"; C10_squad_mem_03 setPosATL _H_C_10_pos_03;
C10_squad_mem_04 setunitpos "Up"; C10_squad_mem_04 setPosATL _H_C_10_pos_04; 
C10_squad_mem_05 setunitpos "Up"; C10_squad_mem_05 setPosATL _H_C_10_pos_05;
C10_squad_mem_06 setunitpos "Up"; C10_squad_mem_06 setPosATL _H_C_10_pos_06;
C10_squad_mem_07 setunitpos "Up"; C10_squad_mem_07 setPosATL _H_C_10_pos_07;
C10_squad_mem_08 setunitpos "Up"; C10_squad_mem_08 setPosATL _H_C_10_pos_08;
C10_squad_mem_09 setunitpos "Middle"; C10_squad_mem_09 setPosATL _H_C_10_pos_09; 
C10_squad_mem_10 setunitpos "Up"; C10_squad_mem_10 setPosATL _H_C_10_pos_10;
C10_squad_mem_11 setunitpos "Up"; C10_squad_mem_11 setPosATL _H_C_10_pos_11;
C10_squad_mem_12 setunitpos "Up"; C10_squad_mem_12 setPosATL _H_C_10_pos_12;
C10_squad_mem_13 setunitpos "Middle"; C10_squad_mem_13 setPosATL _H_C_10_pos_13;
C10_squad_mem_14 setunitpos "Up"; C10_squad_mem_14 setPosATL _H_C_10_pos_14;
C10_squad_mem_15 setunitpos "Up"; C10_squad_mem_15 setPosATL _H_C_10_pos_15;
C10_squad_mem_16 setunitpos "Up"; C10_squad_mem_16 setPosATL _H_C_10_pos_16;
C10_squad_mem_17 setunitpos "Up"; C10_squad_mem_17 setPosATL _H_C_10_pos_17;
C10_squad_mem_18 setunitpos "Up"; C10_squad_mem_18 setPosATL _H_C_10_pos_18;
C10_squad_mem_19 setunitpos "Up"; C10_squad_mem_19 setPosATL _H_C_10_pos_19;
C10_squad_mem_20 setunitpos "Up"; C10_squad_mem_20 setPosATL _H_C_10_pos_20;
C10_squad_mem_21 setunitpos "Up"; C10_squad_mem_21 setPosATL _H_C_10_pos_21;
C10_squad_mem_22 setunitpos "AUTO"; C10_squad_mem_22 setPosATL _H_C_10_pos_22;

		};
			_countarr = _countarr + 1;
	} foreach _HC_10_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for House C_10///-----------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------


///-----------------------
///-----------------------
///-----------------------
///Start Squad for House C_11  ///----------------------------------
///-----------------------
///-----------------------
///-----------------------
///8 Positions

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_H_C_11_pos_00 = _x modelToWorld (_house_C_11_List select 0);
_H_C_11_pos_01 = _x modelToWorld (_house_C_11_List select 1);
_H_C_11_pos_02 = _x modelToWorld (_house_C_11_List select 2);
_H_C_11_pos_03 = _x modelToWorld (_house_C_11_List select 3);
_H_C_11_pos_04 = _x modelToWorld (_house_C_11_List select 4);
_H_C_11_pos_05 = _x modelToWorld (_house_C_11_List select 5);
_H_C_11_pos_06 = _x modelToWorld (_house_C_11_List select 6);
_H_C_11_pos_07 = _x modelToWorld (_house_C_11_List select 7);

///Possible Units
_HC11_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC11_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HC11_pos02Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC11_pos03Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC11_pos04Unit = _atmgPosPos select (round(random _atmgPosPosNum)); 
_HC11_pos05Unit = _atmgPosPos select (round(random _atmgPosPosNum)); 
_HC11_pos06Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC11_pos07Unit = _rifPosPos select (round(random _rifPosPosNum));

_C11_squad = createGroup _factionside; ///Create Group



_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));


if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HC11_pos00Unit createUnit [getmarkerpos _initialSpawn, _C11_squad,"C11_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HC11_pos01Unit createUnit [getmarkerpos _initialSpawn, _C11_squad,"C11_squad_mem_01 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC11_pos02Unit createUnit [getmarkerpos _initialSpawn, _C11_squad,"C11_squad_mem_02 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC11_pos03Unit createUnit [getmarkerpos _initialSpawn, _C11_squad,"C11_squad_mem_03 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosBalconyOnOff == 1) then {_HC11_pos04Unit createUnit [getmarkerpos _initialSpawn, _C11_squad,"C11_squad_mem_04 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosBalconyOnOff == 1) then {_HC11_pos05Unit createUnit [getmarkerpos _initialSpawn, _C11_squad,"C11_squad_mem_05 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosBalconyOnOff == 1) then {_HC11_pos06Unit createUnit [getmarkerpos _initialSpawn, _C11_squad,"C11_squad_mem_06 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC11_pos07Unit createUnit [getmarkerpos _initialSpawn, _C11_squad,"C11_squad_mem_07 = this;", _unitskill, _unitrank]};




{_x enableattack false} forEach units _C11_squad;
{dostop _x} foreach units _C11_squad;



_C11_squad_members = units _C11_squad;
C11_squad_mem_00 setunitpos "Middle"; C11_squad_mem_00 setPosATL _H_C_11_pos_00;
C11_squad_mem_01 setunitpos "Middle"; C11_squad_mem_01 setPosATL _H_C_11_pos_01; 
C11_squad_mem_02 setunitpos "Up"; C11_squad_mem_02 setPosATL _H_C_11_pos_02;
C11_squad_mem_03 setunitpos "Up"; C11_squad_mem_03 setPosATL _H_C_11_pos_03;
C11_squad_mem_04 setunitpos "Up"; C11_squad_mem_04 setPosATL _H_C_11_pos_04; 
C11_squad_mem_05 setunitpos "Up"; C11_squad_mem_05 setPosATL _H_C_11_pos_05;
C11_squad_mem_06 setunitpos "Up"; C11_squad_mem_06 setPosATL _H_C_11_pos_06;
C11_squad_mem_07 setunitpos "Up"; C11_squad_mem_07 setPosATL _H_C_11_pos_07;

		};
			_countarr = _countarr + 1;
	} foreach _HC_11_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for House C_11///-----------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------

///-----------------------
///-----------------------
///-----------------------
///Start Squad for House C_12  ///----------------------------------
///-----------------------
///-----------------------
///-----------------------
///13 Positions

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_H_C_12_pos_00 = _x modelToWorld (_house_C_12_List select 0);
_H_C_12_pos_01 = _x modelToWorld (_house_C_12_List select 1);
_H_C_12_pos_02 = _x modelToWorld (_house_C_12_List select 2);
_H_C_12_pos_03 = _x modelToWorld (_house_C_12_List select 3);
_H_C_12_pos_04 = _x modelToWorld (_house_C_12_List select 4);
_H_C_12_pos_05 = _x modelToWorld (_house_C_12_List select 5);
_H_C_12_pos_06 = _x modelToWorld (_house_C_12_List select 6);
_H_C_12_pos_07 = _x modelToWorld (_house_C_12_List select 7);
_H_C_12_pos_08 = _x modelToWorld (_house_C_12_List select 8);
_H_C_12_pos_09 = _x modelToWorld (_house_C_12_List select 9);
_H_C_12_pos_10 = _x modelToWorld (_house_C_12_List select 10);
_H_C_12_pos_11 = _x modelToWorld (_house_C_12_List select 11);
_H_C_12_pos_12 = _x modelToWorld (_house_C_12_List select 12);


///Possible Units
_HC12_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC12_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HC12_pos02Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HC12_pos03Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC12_pos04Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HC12_pos05Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HC12_pos06Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC12_pos07Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC12_pos08Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC12_pos09Unit = _atmgPosPos select (round(random _atmgPosPosNum)); 
_HC12_pos10Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC12_pos11Unit = _rifPosPos select (round(random _rifPosPosNum));
_HC12_pos12Unit = _rifPosPos select (round(random _rifPosPosNum));
 

_C12_squad = createGroup _factionside; ///Create Group



_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HC12_pos00Unit createUnit [getmarkerpos _initialSpawn, _C12_squad,"C12_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HC12_pos01Unit createUnit [getmarkerpos _initialSpawn, _C12_squad,"C12_squad_mem_01 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HC12_pos02Unit createUnit [getmarkerpos _initialSpawn, _C12_squad,"C12_squad_mem_02 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HC12_pos03Unit createUnit [getmarkerpos _initialSpawn, _C12_squad,"C12_squad_mem_03 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HC12_pos04Unit createUnit [getmarkerpos _initialSpawn, _C12_squad,"C12_squad_mem_04 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HC12_pos05Unit createUnit [getmarkerpos _initialSpawn, _C12_squad,"C12_squad_mem_05 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC12_pos06Unit createUnit [getmarkerpos _initialSpawn, _C12_squad,"C12_squad_mem_06 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HC12_pos07Unit createUnit [getmarkerpos _initialSpawn, _C12_squad,"C12_squad_mem_07 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosBalconyOnOff == 1) then {_HC12_pos08Unit createUnit [getmarkerpos _initialSpawn, _C12_squad,"C12_squad_mem_08 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosBalconyOnOff == 1) then {_HC12_pos09Unit createUnit [getmarkerpos _initialSpawn, _C12_squad,"C12_squad_mem_09 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosBalconyOnOff == 1) then {_HC12_pos10Unit createUnit [getmarkerpos _initialSpawn, _C12_squad,"C12_squad_mem_10 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosBalconyOnOff == 1) then {_HC12_pos11Unit createUnit [getmarkerpos _initialSpawn, _C12_squad,"C12_squad_mem_11 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosBalconyOnOff == 1) then {_HC12_pos12Unit createUnit [getmarkerpos _initialSpawn, _C12_squad,"C12_squad_mem_12 = this;", _unitskill, _unitrank]};





{_x enableattack false} forEach units _C12_squad;
{dostop _x} foreach units _C12_squad;



_C12_squad_members = units _C12_squad;
C12_squad_mem_00 setunitpos "Middle"; C12_squad_mem_00 setPosATL _H_C_12_pos_00;
C12_squad_mem_01 setunitpos "Up"; C12_squad_mem_01 setPosATL _H_C_12_pos_01; 
C12_squad_mem_02 setunitpos "Up"; C12_squad_mem_02 setPosATL _H_C_12_pos_02;
C12_squad_mem_03 setunitpos "Up"; C12_squad_mem_03 setPosATL _H_C_12_pos_03;
C12_squad_mem_04 setunitpos "Up"; C12_squad_mem_04 setPosATL _H_C_12_pos_04; 
C12_squad_mem_05 setunitpos "Middle"; C12_squad_mem_05 setPosATL _H_C_12_pos_05;
C12_squad_mem_06 setunitpos "Up"; C12_squad_mem_06 setPosATL _H_C_12_pos_06;
C12_squad_mem_07 setunitpos "Up"; C12_squad_mem_07 setPosATL _H_C_12_pos_07;
C12_squad_mem_08 setunitpos "Middle"; C12_squad_mem_08 setPosATL _H_C_12_pos_08;
C12_squad_mem_09 setunitpos "Middle"; C12_squad_mem_09 setPosATL _H_C_12_pos_09; 
C12_squad_mem_10 setunitpos "Middle"; C12_squad_mem_10 setPosATL _H_C_12_pos_10;
C12_squad_mem_11 setunitpos "Up"; C12_squad_mem_11 setPosATL _H_C_12_pos_11;
C12_squad_mem_12 setunitpos "Up"; C12_squad_mem_12 setPosATL _H_C_12_pos_12;

		};
			_countarr = _countarr + 1;
	} foreach _HC_12_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for House C_12///-----------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------

///-----------------------
///-----------------------
///-----------------------
///Start Squad for House HMQS_1  ///----------------------------------
///-----------------------
///-----------------------
///-----------------------
///6 Positions

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_H_HMQS_1_pos_00 = _x modelToWorld (_house_HMQS_1_List select 0);
_H_HMQS_1_pos_01 = _x modelToWorld (_house_HMQS_1_List select 1);
_H_HMQS_1_pos_02 = _x modelToWorld (_house_HMQS_1_List select 2);
_H_HMQS_1_pos_03 = _x modelToWorld (_house_HMQS_1_List select 3);
_H_HMQS_1_pos_04 = _x modelToWorld (_house_HMQS_1_List select 4);
_H_HMQS_1_pos_05 = _x modelToWorld (_house_HMQS_1_List select 5);

///Possible Units
_HHMQS1_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
_HHMQS1_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HHMQS1_pos02Unit = _rifPosPos select (round(random _rifPosPosNum));
_HHMQS1_pos03Unit = _rifPosPos select (round(random _rifPosPosNum));
_HHMQS1_pos04Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HHMQS1_pos05Unit = _rifPosPos select (round(random _rifPosPosNum)); 
 

_HMQS1_squad = createGroup _factionside; ///Create Group



_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));


if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HHMQS1_pos00Unit createUnit [getmarkerpos _initialSpawn, _HMQS1_squad,"HMQS1_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HHMQS1_pos01Unit createUnit [getmarkerpos _initialSpawn, _HMQS1_squad,"HMQS1_squad_mem_01 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HHMQS1_pos02Unit createUnit [getmarkerpos _initialSpawn, _HMQS1_squad,"HMQS1_squad_mem_02 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HHMQS1_pos03Unit createUnit [getmarkerpos _initialSpawn, _HMQS1_squad,"HMQS1_squad_mem_03 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HHMQS1_pos04Unit createUnit [getmarkerpos _initialSpawn, _HMQS1_squad,"HMQS1_squad_mem_04 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HHMQS1_pos05Unit createUnit [getmarkerpos _initialSpawn, _HMQS1_squad,"HMQS1_squad_mem_05 = this;", _unitskill, _unitrank]};





{_x enableattack false} forEach units _HMQS1_squad;
{dostop _x} foreach units _HMQS1_squad;



_HMQS1_squad_members = units _HMQS1_squad;
HMQS1_squad_mem_00 setPosATL _H_HMQS_1_pos_00;
HMQS1_squad_mem_01 setPosATL _H_HMQS_1_pos_01;
HMQS1_squad_mem_02 setPosATL _H_HMQS_1_pos_02;
HMQS1_squad_mem_03 setPosATL _H_HMQS_1_pos_03;
HMQS1_squad_mem_04 setPosATL _H_HMQS_1_pos_04;
HMQS1_squad_mem_05 setPosATL _H_HMQS_1_pos_05;
HMQS1_squad_mem_00 setUnitPos "Middle";
HMQS1_squad_mem_01 setUnitPos "Up";
HMQS1_squad_mem_02 setUnitPos "Up";
HMQS1_squad_mem_03 setUnitPos "Middle";
HMQS1_squad_mem_04 setUnitPos "Middle";
HMQS1_squad_mem_05 setUnitPos "Up";

		};
			_countarr = _countarr + 1;
	} foreach _HMQS_1_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for House HMQS_1///-----------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------

///-----------------------
///-----------------------
///-----------------------
///Start Squad for House HMQS_2  ///----------------------------------
///-----------------------
///-----------------------
///-----------------------
///6 Positions

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_H_HMQS_2_pos_00 = _x modelToWorld (_house_HMQS_2_List select 0);
_H_HMQS_2_pos_01 = _x modelToWorld (_house_HMQS_2_List select 1);
_H_HMQS_2_pos_02 = _x modelToWorld (_house_HMQS_2_List select 2);

///Possible Units
_HHMQS2_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
_HHMQS2_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HHMQS2_pos02Unit = _rifPosPos select (round(random _rifPosPosNum));

_HMQS2_squad = createGroup _factionside; ///Create Group



_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HHMQS2_pos00Unit createUnit [getmarkerpos _initialSpawn, _HMQS2_squad,"HMQS2_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HHMQS2_pos01Unit createUnit [getmarkerpos _initialSpawn, _HMQS2_squad,"HMQS2_squad_mem_01 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HHMQS2_pos02Unit createUnit [getmarkerpos _initialSpawn, _HMQS2_squad,"HMQS2_squad_mem_02 = this;", _unitskill, _unitrank]};




{_x enableattack false} forEach units _HMQS2_squad;
{dostop _x} foreach units _HMQS2_squad;



_HMQS2_squad_members = units _HMQS2_squad;
HMQS2_squad_mem_00 setPosATL _H_HMQS_2_pos_00;
HMQS2_squad_mem_01 setPosATL _H_HMQS_2_pos_01;
HMQS2_squad_mem_02 setPosATL _H_HMQS_2_pos_02;
HMQS2_squad_mem_00 setUnitPos "Middle";
HMQS2_squad_mem_01 setUnitPos "Middle";
HMQS2_squad_mem_02 setUnitPos "Middle";

		};
			_countarr = _countarr + 1;
	} foreach _HMQS_2_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for House HMQS_2///-----------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------

///-----------------------
///-----------------------
///-----------------------
///Start Squad for House HMQT_1  ///----------------------------------
///-----------------------
///-----------------------
///-----------------------
///6 Positions

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_H_HMQT_1_pos_00 = _x modelToWorld (_house_HMQT_1_List select 0);
_H_HMQT_1_pos_01 = _x modelToWorld (_house_HMQT_1_List select 1);
_H_HMQT_1_pos_02 = _x modelToWorld (_house_HMQT_1_List select 2);
_H_HMQT_1_pos_03 = _x modelToWorld (_house_HMQT_1_List select 3);

///Possible Units
_HHMQT1_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
_HHMQT1_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HHMQT1_pos02Unit = _rifPosPos select (round(random _rifPosPosNum));
_HHMQT1_pos03Unit = _rifPosPos select (round(random _rifPosPosNum)); 

_HMQT1_squad = createGroup _factionside; ///Create Group



_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));


if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HHMQT1_pos00Unit createUnit [getmarkerpos _initialSpawn, _HMQT1_squad,"HMQT1_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HHMQT1_pos01Unit createUnit [getmarkerpos _initialSpawn, _HMQT1_squad,"HMQT1_squad_mem_01 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HHMQT1_pos02Unit createUnit [getmarkerpos _initialSpawn, _HMQT1_squad,"HMQT1_squad_mem_02 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HHMQT1_pos03Unit createUnit [getmarkerpos _initialSpawn, _HMQT1_squad,"HMQT1_squad_mem_03 = this;", _unitskill, _unitrank]};




{_x enableattack false} forEach units _HMQT1_squad;
{dostop _x} foreach units _HMQT1_squad;



_HMQT1_squad_members = units _HMQT1_squad;
HMQT1_squad_mem_00 setPosATL _H_HMQT_1_pos_00;
HMQT1_squad_mem_01 setPosATL _H_HMQT_1_pos_01;
HMQT1_squad_mem_02 setPosATL _H_HMQT_1_pos_02;
HMQT1_squad_mem_03 setPosATL _H_HMQT_1_pos_03;
HMQT1_squad_mem_00 setUnitPos "Middle";
HMQT1_squad_mem_01 setUnitPos "Up";
HMQT1_squad_mem_02 setUnitPos "Middle";
HMQT1_squad_mem_03 setUnitPos "Up";

		};
			_countarr = _countarr + 1;
	} foreach _HMQT_1_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for House HMQT_1///-----------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------

///-----------------------
///-----------------------
///-----------------------
///Start Squad for House HMQT_2  ///----------------------------------
///-----------------------
///-----------------------
///-----------------------
///6 Positions

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_H_HMQT_2_pos_00 = _x modelToWorld (_house_HMQT_2_List select 0);
_H_HMQT_2_pos_01 = _x modelToWorld (_house_HMQT_2_List select 1);
_H_HMQT_2_pos_02 = _x modelToWorld (_house_HMQT_2_List select 2);
_H_HMQT_2_pos_03 = _x modelToWorld (_house_HMQT_2_List select 3);
_H_HMQT_2_pos_04 = _x modelToWorld (_house_HMQT_2_List select 4);
_H_HMQT_2_pos_05 = _x modelToWorld (_house_HMQT_2_List select 5);
_H_HMQT_2_pos_06 = _x modelToWorld (_house_HMQT_2_List select 6);

///Possible Units
_HHMQT2_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
_HHMQT2_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HHMQT2_pos02Unit = _rifPosPos select (round(random _rifPosPosNum));
_HHMQT2_pos03Unit = _rifPosPos select (round(random _rifPosPosNum));
_HHMQT2_pos04Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HHMQT2_pos05Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HHMQT2_pos06Unit = _rifPosPos select (round(random _rifPosPosNum)); 

_HMQT2_squad = createGroup _factionside; ///Create Group



_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HHMQT2_pos00Unit createUnit [getmarkerpos _initialSpawn, _HMQT2_squad,"HMQT2_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HHMQT2_pos01Unit createUnit [getmarkerpos _initialSpawn, _HMQT2_squad,"HMQT2_squad_mem_01 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HHMQT2_pos02Unit createUnit [getmarkerpos _initialSpawn, _HMQT2_squad,"HMQT2_squad_mem_02 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HHMQT2_pos03Unit createUnit [getmarkerpos _initialSpawn, _HMQT2_squad,"HMQT2_squad_mem_03 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HHMQT2_pos04Unit createUnit [getmarkerpos _initialSpawn, _HMQT2_squad,"HMQT2_squad_mem_04 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HHMQT2_pos05Unit createUnit [getmarkerpos _initialSpawn, _HMQT2_squad,"HMQT2_squad_mem_05 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HHMQT2_pos06Unit createUnit [getmarkerpos _initialSpawn, _HMQT2_squad,"HMQT2_squad_mem_06 = this;", _unitskill, _unitrank]};




{_x enableattack false} forEach units _HMQT2_squad;
{dostop _x} foreach units _HMQT2_squad;



_HMQT2_squad_members = units _HMQT2_squad;
HMQT2_squad_mem_00 setPosATL _H_HMQT_2_pos_00;
HMQT2_squad_mem_01 setPosATL _H_HMQT_2_pos_01;
HMQT2_squad_mem_02 setPosATL _H_HMQT_2_pos_02;
HMQT2_squad_mem_03 setPosATL _H_HMQT_2_pos_03;
HMQT2_squad_mem_04 setPosATL _H_HMQT_2_pos_04;
HMQT2_squad_mem_05 setPosATL _H_HMQT_2_pos_05;
HMQT2_squad_mem_06 setPosATL _H_HMQT_2_pos_06;
HMQT2_squad_mem_00 setUnitPos "Up";
HMQT2_squad_mem_01 setUnitPos "Up";
HMQT2_squad_mem_02 setUnitPos "Up";
HMQT2_squad_mem_03 setUnitPos "Up";
HMQT2_squad_mem_04 setUnitPos "Up";
HMQT2_squad_mem_05 setUnitPos "Middle";
HMQT2_squad_mem_06 setUnitPos "Middle";

		};
			_countarr = _countarr + 1;
	} foreach _HMQT_2_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for House HMQT_2///-----------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------

///-----------------------
///-----------------------
///-----------------------
///Start Squad for House HMQB_1 ///--------------------------------
///-----------------------
///-----------------------
///-----------------------
///2 Positions

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_HMQB_1_pos_00 = _x modelToWorld (_mosque_minaret_1_List select 0);
_HMQB_1_pos_01 = _x modelToWorld (_mosque_minaret_1_List select 1);

///Possible Units
_HMQB1_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
_HMQB1_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 

_HMQB1_squad = createGroup _factionside; ///Create Group



_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HMQB1_pos00Unit createUnit [getmarkerpos _initialSpawn, _HMQB1_squad,"HMQB1_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HMQB1_pos01Unit createUnit [getmarkerpos _initialSpawn, _HMQB1_squad,"HMQB1_squad_mem_01 = this;", _unitskill, _unitrank]};  




{_x enableattack false} forEach units _HMQB1_squad;
{dostop _x} foreach units _HMQB1_squad;



_HMQB1_squad_members = units _HMQB1_squad;
HMQB1_squad_mem_00 setPosATL _HMQB_1_pos_00;
HMQB1_squad_mem_01 setPosATL _HMQB_1_pos_01;
HMQB1_squad_mem_00 setUnitPos "Up";
HMQB1_squad_mem_01 setUnitPos "Up";


		};
			_countarr = _countarr + 1;
	} foreach _HMQB_1_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for House HMQB_1///-----------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------
///-----------------------
///-----------------------
///-----------------------
///Start Squad for House HMQB_2 ///--------------------------------
///-----------------------
///-----------------------
///-----------------------
///2 Positions

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_HMQB_2_pos_00 = _x modelToWorld (_mosque_minaret_2_List select 0);
_HMQB_2_pos_01 = _x modelToWorld (_mosque_minaret_2_List select 1);

///Possible Units
_HMQB2_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
_HMQB2_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 


_HMQB2_squad = createGroup _factionside; ///Create Group



_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HMQB2_pos00Unit createUnit [getmarkerpos _initialSpawn, _HMQB2_squad,"HMQB2_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HMQB2_pos01Unit createUnit [getmarkerpos _initialSpawn, _HMQB2_squad,"HMQB2_squad_mem_01 = this;", _unitskill, _unitrank]};  




{_x enableattack false} forEach units _HMQB2_squad;
{dostop _x} foreach units _HMQB2_squad;



_HMQB2_squad_members = units _HMQB2_squad;
HMQB2_squad_mem_00 setPosATL _HMQB_2_pos_00;
HMQB2_squad_mem_01 setPosATL _HMQB_2_pos_01;
HMQB2_squad_mem_00 setUnitPos "Up";
HMQB2_squad_mem_01 setUnitPos "Up";


		};
			_countarr = _countarr + 1;
	} foreach _HMQB_2_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for House HMQB_2///-----------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------
///-----------------------
///-----------------------
///-----------------------
///Start Squad for House HMQW_2 ///--------------------------------
///-----------------------
///-----------------------
///-----------------------
///2 Positions

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_HMQW_2_pos_00 = _x modelToWorld (_mosque_W_G_List select 0);
_HMQW_2_pos_01 = _x modelToWorld (_mosque_W_G_List select 1);

///Possible Units
_HMQW2_pos00Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HMQW2_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 

_HMQW2_squad = createGroup _factionside; ///Create Group



_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));


if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HMQW2_pos00Unit createUnit [getmarkerpos _initialSpawn, _HMQW2_squad,"HMQW2_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HMQW2_pos01Unit createUnit [getmarkerpos _initialSpawn, _HMQW2_squad,"HMQW2_squad_mem_01 = this;", _unitskill, _unitrank]};  




{_x enableattack false} forEach units _HMQW2_squad;
{dostop _x} foreach units _HMQW2_squad;



_HMQW2_squad_members = units _HMQW2_squad;
HMQW2_squad_mem_00 setPosATL _HMQW_2_pos_00;
HMQW2_squad_mem_01 setPosATL _HMQW_2_pos_01;
HMQW2_squad_mem_00 setUnitPos "Middle";
HMQW2_squad_mem_01 setUnitPos "Middle";


		};
			_countarr = _countarr + 1;
	} foreach _HMQW_2_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for House HMQW_2///-----------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------

///-----------------------
///-----------------------
///-----------------------
///Start Squad for House HMQW_3 ///--------------------------------
///-----------------------
///-----------------------
///-----------------------
///2 Positions

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_HMQW_3_pos_00 = _x modelToWorld (_mosque_W_C_List select 0);
_HMQW_3_pos_01 = _x modelToWorld (_mosque_W_C_List select 1);

///Possible Units
_HMQW3_pos00Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HMQW3_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 

_HMQW3_squad = createGroup _factionside; ///Create Group



_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HMQW3_pos00Unit createUnit [getmarkerpos _initialSpawn, _HMQW3_squad,"HMQW3_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HMQW3_pos01Unit createUnit [getmarkerpos _initialSpawn, _HMQW3_squad,"HMQW3_squad_mem_01 = this;", _unitskill, _unitrank]};  


{_x enableattack false} forEach units _HMQW3_squad;
{dostop _x} foreach units _HMQW3_squad;



_HMQW3_squad_members = units _HMQW3_squad;
HMQW3_squad_mem_00 setPosATL _HMQW_3_pos_00;
HMQW3_squad_mem_01 setPosATL _HMQW_3_pos_01;
HMQW3_squad_mem_00 setUnitPos "Middle";
HMQW3_squad_mem_01 setUnitPos "Middle";


		};
			_countarr = _countarr + 1;
	} foreach _HMQW_3_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for House HMQW_3///-----------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------

///-----------------------
///-----------------------
///-----------------------
///Start Squad for House HMQW_1 ///--------------------------------
///-----------------------
///-----------------------
///-----------------------
///3 Positions

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_HMQW_1_pos_00 = _x modelToWorld (_mosque_W_C_List select 0);
_HMQW_1_pos_01 = _x modelToWorld (_mosque_W_C_List select 1);
_HMQW_1_pos_02 = _x modelToWorld (_mosque_W_C_List select 2);

///Possible Units
_HMQW1_pos00Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HMQW1_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HMQW1_pos02Unit = _rifPosPos select (round(random _rifPosPosNum)); 

_HMQW1_squad = createGroup _factionside; ///Create Group



_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HMQW1_pos00Unit createUnit [getmarkerpos _initialSpawn, _HMQW1_squad,"HMQW1_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HMQW1_pos01Unit createUnit [getmarkerpos _initialSpawn, _HMQW1_squad,"HMQW1_squad_mem_01 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HMQW1_pos02Unit createUnit [getmarkerpos _initialSpawn, _HMQW1_squad,"HMQW1_squad_mem_02 = this;", _unitskill, _unitrank]};




{_x enableattack false} forEach units _HMQW1_squad;
{dostop _x} foreach units _HMQW1_squad;



_HMQW1_squad_members = units _HMQW1_squad;
HMQW1_squad_mem_00 setPosATL _HMQW_1_pos_00;
HMQW1_squad_mem_01 setPosATL _HMQW_1_pos_01;
HMQW1_squad_mem_02 setPosATL _HMQW_1_pos_02;
HMQW1_squad_mem_00 setUnitPos "Middle";
HMQW1_squad_mem_01 setUnitPos "Middle";
HMQW1_squad_mem_02 setUnitPos "Middle";

		};
			_countarr = _countarr + 1;
	} foreach _HMQW_1_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for House HMQW_1///-----------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------

///-----------------------
///-----------------------
///-----------------------
///Start Squad for House HMQHQ_1 ///--------------------------------
///-----------------------
///-----------------------
///-----------------------
///2 Positions

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_HMQHQ_1_pos_00 = _x modelToWorld (_mosque_big_List select 0);
_HMQHQ_1_pos_01 = _x modelToWorld (_mosque_big_List select 1);

///Possible Units
_HMQHQ1_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
_HMQHQ1_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 

_HMQHQ1_squad = createGroup _factionside; ///Create Group



_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HMQHQ1_pos00Unit createUnit [getmarkerpos _initialSpawn, _HMQHQ1_squad,"HMQHQ1_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HMQHQ1_pos01Unit createUnit [getmarkerpos _initialSpawn, _HMQHQ1_squad,"HMQHQ1_squad_mem_01 = this;", _unitskill, _unitrank]};  




{_x enableattack false} forEach units _HMQHQ1_squad;
{dostop _x} foreach units _HMQHQ1_squad;



_HMQHQ1_squad_members = units _HMQHQ1_squad;
HMQHQ1_squad_mem_00 setPosATL _HMQHQ_1_pos_00;
HMQHQ1_squad_mem_01 setPosATL _HMQHQ_1_pos_01;


HMQHQ1_squad_mem_00 setUnitPos "Middle";
HMQHQ1_squad_mem_01 setUnitPos "Middle";

		};
			_countarr = _countarr + 1;
	} foreach _HMQHQ_1_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for House HMQHQ_1///-----------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------

///-----------------------
///-----------------------
///-----------------------
///Start Squad for House HMQHQ_2 ///--------------------------------
///-----------------------
///-----------------------
///-----------------------
///6 Positions

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_HMQHQ_2_pos_00 = _x modelToWorld (_mosque_big2_List select 0);
_HMQHQ_2_pos_01 = _x modelToWorld (_mosque_big2_List select 1);
_HMQHQ_2_pos_02 = _x modelToWorld (_mosque_big2_List select 2);
_HMQHQ_2_pos_03 = _x modelToWorld (_mosque_big2_List select 3);
_HMQHQ_2_pos_04 = _x modelToWorld (_mosque_big2_List select 4);
_HMQHQ_2_pos_05 = _x modelToWorld (_mosque_big2_List select 5);

///Possible Units
_HMQHQ2_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
_HMQHQ2_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HMQHQ2_pos02Unit = _rifPosPos select (round(random _rifPosPosNum));
_HMQHQ2_pos03Unit = _rifPosPos select (round(random _rifPosPosNum));
_HMQHQ2_pos04Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HMQHQ2_pos05Unit = _rifPosPos select (round(random _rifPosPosNum)); 

_HMQHQ2_squad = createGroup _factionside; ///Create Group



_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));


if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HMQHQ2_pos00Unit createUnit [getmarkerpos _initialSpawn, _HMQHQ2_squad,"HMQHQ2_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HMQHQ2_pos01Unit createUnit [getmarkerpos _initialSpawn, _HMQHQ2_squad,"HMQHQ2_squad_mem_01 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HMQHQ2_pos02Unit createUnit [getmarkerpos _initialSpawn, _HMQHQ2_squad,"HMQHQ2_squad_mem_02 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HMQHQ2_pos03Unit createUnit [getmarkerpos _initialSpawn, _HMQHQ2_squad,"HMQHQ2_squad_mem_03 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HMQHQ2_pos04Unit createUnit [getmarkerpos _initialSpawn, _HMQHQ2_squad,"HMQHQ2_squad_mem_04 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HMQHQ2_pos05Unit createUnit [getmarkerpos _initialSpawn, _HMQHQ2_squad,"HMQHQ2_squad_mem_05 = this;", _unitskill, _unitrank]};




{_x enableattack false} forEach units _HMQHQ2_squad;
{dostop _x} foreach units _HMQHQ2_squad;



_HMQHQ2_squad_members = units _HMQHQ2_squad;
HMQHQ2_squad_mem_00 setPosATL _HMQHQ_2_pos_00;
HMQHQ2_squad_mem_01 setPosATL _HMQHQ_2_pos_01;
HMQHQ2_squad_mem_02 setPosATL _HMQHQ_2_pos_02;
HMQHQ2_squad_mem_03 setPosATL _HMQHQ_2_pos_03;
HMQHQ2_squad_mem_04 setPosATL _HMQHQ_2_pos_04;
HMQHQ2_squad_mem_05 setPosATL _HMQHQ_2_pos_05;

HMQHQ2_squad_mem_00 setUnitPos "Middle";
HMQHQ2_squad_mem_01 setUnitPos "Middle";
HMQHQ2_squad_mem_02 setUnitPos "Up";
HMQHQ2_squad_mem_03 setUnitPos "Middle";
HMQHQ2_squad_mem_04 setUnitPos "Middle";
HMQHQ2_squad_mem_05 setUnitPos "Middle";


		};
			_countarr = _countarr + 1;
	} foreach _HMQHQ_2_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for House HMQHQ_1///-----------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------

///-----------------------
///-----------------------
///-----------------------
///Start Squad for House HIS_1///----------------------------------
///-----------------------
///-----------------------
///-----------------------
///18 Positions

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_HIS_1_pos_00 = _x modelToWorld (_ind_shed_02_List select 0);
_HIS_1_pos_01 = _x modelToWorld (_ind_shed_02_List select 1);
_HIS_1_pos_02 = _x modelToWorld (_ind_shed_02_List select 2);
_HIS_1_pos_03 = _x modelToWorld (_ind_shed_02_List select 3);
_HIS_1_pos_04 = _x modelToWorld (_ind_shed_02_List select 4);
_HIS_1_pos_05 = _x modelToWorld (_ind_shed_02_List select 5);
_HIS_1_pos_06 = _x modelToWorld (_ind_shed_02_List select 6);
_HIS_1_pos_07 = _x modelToWorld (_ind_shed_02_List select 7);
_HIS_1_pos_08 = _x modelToWorld (_ind_shed_02_List select 8);
_HIS_1_pos_09 = _x modelToWorld (_ind_shed_02_List select 9);
_HIS_1_pos_10 = _x modelToWorld (_ind_shed_02_List select 10);
_HIS_1_pos_11 = _x modelToWorld (_ind_shed_02_List select 11);
_HIS_1_pos_12 = _x modelToWorld (_ind_shed_02_List select 12);
_HIS_1_pos_13 = _x modelToWorld (_ind_shed_02_List select 13);
_HIS_1_pos_14 = _x modelToWorld (_ind_shed_02_List select 14);
_HIS_1_pos_15 = _x modelToWorld (_ind_shed_02_List select 15);
_HIS_1_pos_16 = _x modelToWorld (_ind_shed_02_List select 16);
_HIS_1_pos_17 = _x modelToWorld (_ind_shed_02_List select 17);



///Possible Units
_HIS1_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
_HIS1_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HIS1_pos02Unit = _rifPosPos select (round(random _rifPosPosNum));
_HIS1_pos03Unit = _rifPosPos select (round(random _rifPosPosNum));
_HIS1_pos04Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HIS1_pos05Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HIS1_pos06Unit = _rifPosPos select (round(random _rifPosPosNum));
_HIS1_pos07Unit = _rifPosPos select (round(random _rifPosPosNum));
_HIS1_pos08Unit = _rifPosPos select (round(random _rifPosPosNum));
_HIS1_pos09Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HIS1_pos10Unit = _rifPosPos select (round(random _rifPosPosNum));
_HIS1_pos11Unit = _rifPosPos select (round(random _rifPosPosNum));
_HIS1_pos12Unit = _rifPosPos select (round(random _rifPosPosNum));
_HIS1_pos13Unit = _rifPosPos select (round(random _rifPosPosNum));
_HIS1_pos14Unit = _rifPosPos select (round(random _rifPosPosNum));
_HIS1_pos15Unit = _rifPosPos select (round(random _rifPosPosNum));
_HIS1_pos16Unit = _rifPosPos select (round(random _rifPosPosNum));
_HIS1_pos17Unit = _rifPosPos select (round(random _rifPosPosNum));

_HIS1_squad = createGroup _factionside; ///Create Group



_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));


if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HIS1_pos00Unit createUnit [getmarkerpos _initialSpawn, _HIS1_squad,"HIS1_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HIS1_pos01Unit createUnit [getmarkerpos _initialSpawn, _HIS1_squad,"HIS1_squad_mem_01 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HIS1_pos02Unit createUnit [getmarkerpos _initialSpawn, _HIS1_squad,"HIS1_squad_mem_02 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HIS1_pos03Unit createUnit [getmarkerpos _initialSpawn, _HIS1_squad,"HIS1_squad_mem_03 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HIS1_pos04Unit createUnit [getmarkerpos _initialSpawn, _HIS1_squad,"HIS1_squad_mem_04 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HIS1_pos05Unit createUnit [getmarkerpos _initialSpawn, _HIS1_squad,"HIS1_squad_mem_05 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HIS1_pos06Unit createUnit [getmarkerpos _initialSpawn, _HIS1_squad,"HIS1_squad_mem_06 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HIS1_pos07Unit createUnit [getmarkerpos _initialSpawn, _HIS1_squad,"HIS1_squad_mem_07 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HIS1_pos08Unit createUnit [getmarkerpos _initialSpawn, _HIS1_squad,"HIS1_squad_mem_08 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HIS1_pos09Unit createUnit [getmarkerpos _initialSpawn, _HIS1_squad,"HIS1_squad_mem_09 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HIS1_pos10Unit createUnit [getmarkerpos _initialSpawn, _HIS1_squad,"HIS1_squad_mem_10 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HIS1_pos11Unit createUnit [getmarkerpos _initialSpawn, _HIS1_squad,"HIS1_squad_mem_11 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HIS1_pos12Unit createUnit [getmarkerpos _initialSpawn, _HIS1_squad,"HIS1_squad_mem_12 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HIS1_pos13Unit createUnit [getmarkerpos _initialSpawn, _HIS1_squad,"HIS1_squad_mem_13 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HIS1_pos14Unit createUnit [getmarkerpos _initialSpawn, _HIS1_squad,"HIS1_squad_mem_14 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HIS1_pos15Unit createUnit [getmarkerpos _initialSpawn, _HIS1_squad,"HIS1_squad_mem_15 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HIS1_pos16Unit createUnit [getmarkerpos _initialSpawn, _HIS1_squad,"HIS1_squad_mem_16 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HIS1_pos17Unit createUnit [getmarkerpos _initialSpawn, _HIS1_squad,"HIS1_squad_mem_17 = this;", _unitskill, _unitrank]};





{_x enableattack false} forEach units _HIS1_squad;
{dostop _x} foreach units _HIS1_squad;



_HIS1_squad_members = units _HIS1_squad;
HIS1_squad_mem_00 setunitpos "Middle"; HIS1_squad_mem_00 setPosATL _HIS_1_pos_00;
HIS1_squad_mem_01 setunitpos "Up"; HIS1_squad_mem_01 setPosATL _HIS_1_pos_01; 
HIS1_squad_mem_02 setunitpos "Up"; HIS1_squad_mem_02 setPosATL _HIS_1_pos_02;
HIS1_squad_mem_03 setunitpos "Up"; HIS1_squad_mem_03 setPosATL _HIS_1_pos_03;
HIS1_squad_mem_04 setunitpos "Up"; HIS1_squad_mem_04 setPosATL _HIS_1_pos_04; 
HIS1_squad_mem_05 setunitpos "Up"; HIS1_squad_mem_05 setPosATL _HIS_1_pos_05;
HIS1_squad_mem_06 setunitpos "Up"; HIS1_squad_mem_06 setPosATL _HIS_1_pos_06;
HIS1_squad_mem_07 setunitpos "Middle"; HIS1_squad_mem_07 setPosATL _HIS_1_pos_07;
HIS1_squad_mem_08 setunitpos "Up"; HIS1_squad_mem_08 setPosATL _HIS_1_pos_08;
HIS1_squad_mem_09 setunitpos "Middle"; HIS1_squad_mem_09 setPosATL _HIS_1_pos_09; 
HIS1_squad_mem_10 setunitpos "Up"; HIS1_squad_mem_10 setPosATL _HIS_1_pos_10;
HIS1_squad_mem_11 setunitpos "Up"; HIS1_squad_mem_11 setPosATL _HIS_1_pos_11;
HIS1_squad_mem_12 setunitpos "Up"; HIS1_squad_mem_12 setPosATL _HIS_1_pos_12;
HIS1_squad_mem_13 setunitpos "Up"; HIS1_squad_mem_13 setPosATL _HIS_1_pos_13;
HIS1_squad_mem_14 setunitpos "Middle"; HIS1_squad_mem_14 setPosATL _HIS_1_pos_14;
HIS1_squad_mem_15 setunitpos "Middle"; HIS1_squad_mem_15 setPosATL _HIS_1_pos_15;
HIS1_squad_mem_16 setunitpos "Up"; HIS1_squad_mem_16 setPosATL _HIS_1_pos_16;
HIS1_squad_mem_17 setunitpos "Up"; HIS1_squad_mem_17 setPosATL _HIS_1_pos_17;


		};
			_countarr = _countarr + 1;
	} foreach _HIS_1_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for House HIS_1///-----------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------

///-----------------------
///-----------------------
///-----------------------
///Start Squad for Bunker Big  ///---------------------------------
///-----------------------
///-----------------------
///-----------------------
///9 Positions

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_B_B_pos_00 = _x modelToWorld (_bunker_Big_List select 0);
_B_B_pos_01 = _x modelToWorld (_bunker_Big_List select 1);
_B_B_pos_02 = _x modelToWorld (_bunker_Big_List select 2);
_B_B_pos_03 = _x modelToWorld (_bunker_Big_List select 3);
_B_B_pos_04 = _x modelToWorld (_bunker_Big_List select 4);
_B_B_pos_05 = _x modelToWorld (_bunker_Big_List select 5);
_B_B_pos_06 = _x modelToWorld (_bunker_Big_List select 6);
_B_B_pos_07 = _x modelToWorld (_bunker_Big_List select 7);
_B_B_pos_08 = _x modelToWorld (_bunker_Big_List select 8);


///Possible Units
_BB_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
_BB_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_BB_pos02Unit = _rifPosPos select (round(random _rifPosPosNum));
_BB_pos03Unit = _rifPosPos select (round(random _rifPosPosNum));
_BB_pos04Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_BB_pos05Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_BB_pos06Unit = _rifPosPos select (round(random _rifPosPosNum));
_BB_pos07Unit = _rifPosPos select (round(random _rifPosPosNum));
_BB_pos08Unit = _rifPosPos select (round(random _rifPosPosNum));


_BB_squad = createGroup _factionside; ///Create Group



_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BB_pos00Unit createUnit [getmarkerpos _initialSpawn, _BB_squad,"BB_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BB_pos01Unit createUnit [getmarkerpos _initialSpawn, _BB_squad,"BB_squad_mem_01 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BB_pos02Unit createUnit [getmarkerpos _initialSpawn, _BB_squad,"BB_squad_mem_02 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BB_pos03Unit createUnit [getmarkerpos _initialSpawn, _BB_squad,"BB_squad_mem_03 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BB_pos04Unit createUnit [getmarkerpos _initialSpawn, _BB_squad,"BB_squad_mem_04 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BB_pos05Unit createUnit [getmarkerpos _initialSpawn, _BB_squad,"BB_squad_mem_05 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BB_pos06Unit createUnit [getmarkerpos _initialSpawn, _BB_squad,"BB_squad_mem_06 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BB_pos07Unit createUnit [getmarkerpos _initialSpawn, _BB_squad,"BB_squad_mem_07 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BB_pos08Unit createUnit [getmarkerpos _initialSpawn, _BB_squad,"BB_squad_mem_08 = this;", _unitskill, _unitrank]};




{_x enableattack false} forEach units _BB_squad;
{dostop _x} foreach units _BB_squad;



_BB_squad_members = units _BB_squad;
BB_squad_mem_00 setunitpos "Up"; BB_squad_mem_00 setPosATL _B_B_pos_00;
BB_squad_mem_01 setunitpos "Up"; BB_squad_mem_01 setPosATL _B_B_pos_01; 
BB_squad_mem_02 setunitpos "Up"; BB_squad_mem_02 setPosATL _B_B_pos_02;
BB_squad_mem_03 setunitpos "Up"; BB_squad_mem_03 setPosATL _B_B_pos_03;
BB_squad_mem_04 setunitpos "Up"; BB_squad_mem_04 setPosATL _B_B_pos_04; 
BB_squad_mem_05 setunitpos "Up"; BB_squad_mem_05 setPosATL _B_B_pos_05;
BB_squad_mem_06 setunitpos "Up"; BB_squad_mem_06 setPosATL _B_B_pos_06;
BB_squad_mem_07 setunitpos "Up"; BB_squad_mem_07 setPosATL _B_B_pos_07;
BB_squad_mem_08 setunitpos "Up"; BB_squad_mem_08 setPosATL _B_B_pos_08;

		};
			_countarr = _countarr + 1;
	} foreach _bunker_1_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for Bunker Big///----------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------
///-----------------------
///-----------------------
///-----------------------
///Start Squad for Bunker Small  ///---------------------------------
///-----------------------
///-----------------------
///-----------------------
///1 Position

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_B_S_pos_00 = _x modelToWorld (_bunker_small_List select 0);

///Possible Units
_BS_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));

_BS_squad = createGroup _factionside; ///Create Group



_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));


if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BS_pos00Unit createUnit [getmarkerpos _initialSpawn, _BS_squad,"BS_squad_mem_00 = this;", _unitskill, _unitrank]};




{_x enableattack false} forEach units _BS_squad;
{dostop _x} foreach units _BS_squad;



_BS_squad_members = units _BS_squad;
BS_squad_mem_00 setunitpos "Middle"; BS_squad_mem_00 setPosATL _B_S_pos_00;

		};
			_countarr = _countarr + 1;
	} foreach _bunker_2_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for Bunker Small///----------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------
///-----------------------
///-----------------------
///-----------------------
///Start Squad for Barracks 1  ///-------------------------------
///-----------------------
///-----------------------
///-----------------------
///10 Positions

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_HMB_1_pos_00 = _x modelToWorld (_barracks_1_List select 0);
_HMB_1_pos_01 = _x modelToWorld (_barracks_1_List select 1);
_HMB_1_pos_02 = _x modelToWorld (_barracks_1_List select 2);
_HMB_1_pos_03 = _x modelToWorld (_barracks_1_List select 3);
_HMB_1_pos_04 = _x modelToWorld (_barracks_1_List select 4);
_HMB_1_pos_05 = _x modelToWorld (_barracks_1_List select 5);
_HMB_1_pos_06 = _x modelToWorld (_barracks_1_List select 6);
_HMB_1_pos_07 = _x modelToWorld (_barracks_1_List select 7);
_HMB_1_pos_08 = _x modelToWorld (_barracks_1_List select 8);
_HMB_1_pos_09 = _x modelToWorld (_barracks_1_List select 9);

///Possible Units
_HMB1_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
_HMB1_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HMB1_pos02Unit = _rifPosPos select (round(random _rifPosPosNum));
_HMB1_pos03Unit = _rifPosPos select (round(random _rifPosPosNum));
_HMB1_pos04Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HMB1_pos05Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HMB1_pos06Unit = _rifPosPos select (round(random _rifPosPosNum));
_HMB1_pos07Unit = _rifPosPos select (round(random _rifPosPosNum));
_HMB1_pos08Unit = _rifPosPos select (round(random _rifPosPosNum));
_HMB1_pos09Unit = _rifPosPos select (round(random _rifPosPosNum)); 



_HMB1_squad = createGroup _factionside; ///Create Group



_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HMB1_pos00Unit createUnit [getmarkerpos _initialSpawn, _HMB1_squad,"HMB1_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HMB1_pos01Unit createUnit [getmarkerpos _initialSpawn, _HMB1_squad,"HMB1_squad_mem_01 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HMB1_pos02Unit createUnit [getmarkerpos _initialSpawn, _HMB1_squad,"HMB1_squad_mem_02 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HMB1_pos03Unit createUnit [getmarkerpos _initialSpawn, _HMB1_squad,"HMB1_squad_mem_03 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HMB1_pos04Unit createUnit [getmarkerpos _initialSpawn, _HMB1_squad,"HMB1_squad_mem_04 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HMB1_pos05Unit createUnit [getmarkerpos _initialSpawn, _HMB1_squad,"HMB1_squad_mem_05 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HMB1_pos06Unit createUnit [getmarkerpos _initialSpawn, _HMB1_squad,"HMB1_squad_mem_06 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HMB1_pos07Unit createUnit [getmarkerpos _initialSpawn, _HMB1_squad,"HMB1_squad_mem_07 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HMB1_pos08Unit createUnit [getmarkerpos _initialSpawn, _HMB1_squad,"HMB1_squad_mem_08 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HMB1_pos09Unit createUnit [getmarkerpos _initialSpawn, _HMB1_squad,"HMB1_squad_mem_09 = this;", _unitskill, _unitrank]};  




{_x enableattack false} forEach units _HMB1_squad;
{dostop _x} foreach units _HMB1_squad;



_HMB1_squad_members = units _HMB1_squad;
HMB1_squad_mem_00 setunitpos "Middle"; HMB1_squad_mem_00 setPosATL _HMB_1_pos_00;
HMB1_squad_mem_01 setunitpos "Up"; HMB1_squad_mem_01 setPosATL _HMB_1_pos_01; 
HMB1_squad_mem_02 setunitpos "Up"; HMB1_squad_mem_02 setPosATL _HMB_1_pos_02;
HMB1_squad_mem_03 setunitpos "Up"; HMB1_squad_mem_03 setPosATL _HMB_1_pos_03;
HMB1_squad_mem_04 setunitpos "Up"; HMB1_squad_mem_04 setPosATL _HMB_1_pos_04; 
HMB1_squad_mem_05 setunitpos "Up"; HMB1_squad_mem_05 setPosATL _HMB_1_pos_05;
HMB1_squad_mem_06 setunitpos "Up"; HMB1_squad_mem_06 setPosATL _HMB_1_pos_06;
HMB1_squad_mem_07 setunitpos "Up"; HMB1_squad_mem_07 setPosATL _HMB_1_pos_07;
HMB1_squad_mem_08 setunitpos "Up"; HMB1_squad_mem_08 setPosATL _HMB_1_pos_08;
HMB1_squad_mem_09 setunitpos "Up"; HMB1_squad_mem_09 setPosATL _HMB_1_pos_09; 

		};
			_countarr = _countarr + 1;
	} foreach _HMB_1_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for Barracks 1///-----------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------

///-----------------------
///-----------------------
///-----------------------
///Start Squad for Base Tower  ///---------------------------------
///-----------------------
///-----------------------
///-----------------------
///1 Position

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_B_TT_pos_00 = _x modelToWorld (_base_tower_List select 0);

///Possible Units
_BTT_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));

_BTT_squad = createGroup _factionside; ///Create Group



_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));


if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_BTT_pos00Unit createUnit [getmarkerpos _initialSpawn, _BTT_squad,"BTT_squad_mem_00 = this;", _unitskill, _unitrank]};




{_x enableattack false} forEach units _BTT_squad;
{dostop _x} foreach units _BTT_squad;



_BTT_squad_members = units _BTT_squad;
BTT_squad_mem_00 setunitpos "Up"; BTT_squad_mem_00 setPosATL _B_TT_pos_00;

		};
			_countarr = _countarr + 1;
	} foreach _land_vez_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for Bunker Small///----------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------

///-----------------------
///-----------------------
///-----------------------
///Start Squad for Barracks 2  ///---------------------------------
///-----------------------
///-----------------------
///-----------------------
///1 Position

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_HMB_2_pos_00 = _x modelToWorld (_barrack_2_List select 0);

///Possible Units
_HMB_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));

_HMB_squad = createGroup _factionside; ///Create Group



_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));


if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HMB_pos00Unit createUnit [getmarkerpos _initialSpawn, _HMB_squad,"HMB_squad_mem_00 = this;", _unitskill, _unitrank]};


{_x enableattack false} forEach units _HMB_squad;
{dostop _x} foreach units _HMB_squad;



_HMB_squad_members = units _HMB_squad;
HMB_squad_mem_00 setunitpos "Middle"; HMB_squad_mem_00 setPosATL _HMB_2_pos_00;

		};
			_countarr = _countarr + 1;
	} foreach _HMB_2_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for Barracks 2///----------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------

///-----------------------
///-----------------------
///-----------------------
///Start Squad for Coltan Mine ///---------------------------------
///-----------------------
///-----------------------
///-----------------------
///15 Positions

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_C_M_pos_00 = _x modelToWorld (_coltan_Mine_List select 0);
_C_M_pos_01 = _x modelToWorld (_coltan_Mine_List select 1);
_C_M_pos_02 = _x modelToWorld (_coltan_Mine_List select 2);
_C_M_pos_03 = _x modelToWorld (_coltan_Mine_List select 3);
_C_M_pos_04 = _x modelToWorld (_coltan_Mine_List select 4);
_C_M_pos_05 = _x modelToWorld (_coltan_Mine_List select 5);
_C_M_pos_06 = _x modelToWorld (_coltan_Mine_List select 6);
_C_M_pos_07 = _x modelToWorld (_coltan_Mine_List select 7);
_C_M_pos_08 = _x modelToWorld (_coltan_Mine_List select 8);
_C_M_pos_09 = _x modelToWorld (_coltan_Mine_List select 9);
_C_M_pos_10 = _x modelToWorld (_coltan_Mine_List select 10);
_C_M_pos_11 = _x modelToWorld (_coltan_Mine_List select 11);
_C_M_pos_12 = _x modelToWorld (_coltan_Mine_List select 12);
_C_M_pos_13 = _x modelToWorld (_coltan_Mine_List select 13);
_C_M_pos_14 = _x modelToWorld (_coltan_Mine_List select 14);

///Possible Units
_CM_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
_CM_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_CM_pos02Unit = _rifPosPos select (round(random _rifPosPosNum));
_CM_pos03Unit = _rifPosPos select (round(random _rifPosPosNum));
_CM_pos04Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_CM_pos05Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_CM_pos06Unit = _rifPosPos select (round(random _rifPosPosNum));
_CM_pos07Unit = _rifPosPos select (round(random _rifPosPosNum));
_CM_pos08Unit = _rifPosPos select (round(random _rifPosPosNum));
_CM_pos09Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_CM_pos10Unit = _rifPosPos select (round(random _rifPosPosNum));
_CM_pos11Unit = _rifPosPos select (round(random _rifPosPosNum));
_CM_pos12Unit = _rifPosPos select (round(random _rifPosPosNum));
_CM_pos13Unit = _rifPosPos select (round(random _rifPosPosNum));
_CM_pos14Unit = _rifPosPos select (round(random _rifPosPosNum));

_CM1_squad = createGroup _factionside; ///Create Group



_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));


if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_CM_pos00Unit createUnit [getmarkerpos _initialSpawn, _CM1_squad,"CM1_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_CM_pos01Unit createUnit [getmarkerpos _initialSpawn, _CM1_squad,"CM1_squad_mem_01 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_CM_pos02Unit createUnit [getmarkerpos _initialSpawn, _CM1_squad,"CM1_squad_mem_02 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_CM_pos03Unit createUnit [getmarkerpos _initialSpawn, _CM1_squad,"CM1_squad_mem_03 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_CM_pos04Unit createUnit [getmarkerpos _initialSpawn, _CM1_squad,"CM1_squad_mem_04 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_CM_pos05Unit createUnit [getmarkerpos _initialSpawn, _CM1_squad,"CM1_squad_mem_05 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_CM_pos06Unit createUnit [getmarkerpos _initialSpawn, _CM1_squad,"CM1_squad_mem_06 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_CM_pos07Unit createUnit [getmarkerpos _initialSpawn, _CM1_squad,"CM1_squad_mem_07 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_CM_pos08Unit createUnit [getmarkerpos _initialSpawn, _CM1_squad,"CM1_squad_mem_08 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_CM_pos09Unit createUnit [getmarkerpos _initialSpawn, _CM1_squad,"CM1_squad_mem_09 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_CM_pos10Unit createUnit [getmarkerpos _initialSpawn, _CM1_squad,"CM1_squad_mem_10 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_CM_pos11Unit createUnit [getmarkerpos _initialSpawn, _CM1_squad,"CM1_squad_mem_11 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_CM_pos12Unit createUnit [getmarkerpos _initialSpawn, _CM1_squad,"CM1_squad_mem_12 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_CM_pos13Unit createUnit [getmarkerpos _initialSpawn, _CM1_squad,"CM1_squad_mem_13 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_CM_pos14Unit createUnit [getmarkerpos _initialSpawn, _CM1_squad,"CM1_squad_mem_14 = this;", _unitskill, _unitrank]};




{_x enableattack false} forEach units _CM1_squad;
{dostop _x} foreach units _CM1_squad;



_CM1_squad_members = units _CM1_squad;
CM1_squad_mem_00 setunitpos "Up"; CM1_squad_mem_00 setPosATL _C_M_pos_00;
CM1_squad_mem_01 setunitpos "Up"; CM1_squad_mem_01 setPosATL _C_M_pos_01; 
CM1_squad_mem_02 setunitpos "Up"; CM1_squad_mem_02 setPosATL _C_M_pos_02;
CM1_squad_mem_03 setunitpos "Middle"; CM1_squad_mem_03 setPosATL _C_M_pos_03;
CM1_squad_mem_04 setunitpos "Middle"; CM1_squad_mem_04 setPosATL _C_M_pos_04; 
CM1_squad_mem_05 setunitpos "Middle"; CM1_squad_mem_05 setPosATL _C_M_pos_05;
CM1_squad_mem_06 setunitpos "Middle"; CM1_squad_mem_06 setPosATL _C_M_pos_06;
CM1_squad_mem_07 setunitpos "Middle"; CM1_squad_mem_07 setPosATL _C_M_pos_07;
CM1_squad_mem_08 setunitpos "Middle"; CM1_squad_mem_08 setPosATL _C_M_pos_08;
CM1_squad_mem_09 setunitpos "Middle"; CM1_squad_mem_09 setPosATL _C_M_pos_09; 
CM1_squad_mem_10 setunitpos "Middle"; CM1_squad_mem_10 setPosATL _C_M_pos_10;
CM1_squad_mem_11 setunitpos "Up"; CM1_squad_mem_11 setPosATL _C_M_pos_11;
CM1_squad_mem_12 setunitpos "Middle"; CM1_squad_mem_12 setPosATL _C_M_pos_12;
CM1_squad_mem_13 setunitpos "Middle"; CM1_squad_mem_13 setPosATL _C_M_pos_13;
CM1_squad_mem_14 setunitpos "Middle"; CM1_squad_mem_14 setPosATL _C_M_pos_14;

		};
			_countarr = _countarr + 1;
	} foreach _coltan_mine2_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for Coltan Mine///---------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------

///-----------------------
///-----------------------
///-----------------------
///Start Squad for Fuel Station 1///-------------------------------
///-----------------------
///-----------------------
///-----------------------
///3 Positions

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_H_FS1_pos_00 = _x modelToWorld (_fuel_station_1_List select 0);
_H_FS1_pos_01 = _x modelToWorld (_fuel_station_1_List select 1);
_H_FS1_pos_02 = _x modelToWorld (_fuel_station_1_List select 2);

///Possible Units
_HFS1_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
_HFS1_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HFS1_pos02Unit = _rifPosPos select (round(random _rifPosPosNum));

_HFS1_squad = createGroup _factionside; ///Create Group


_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HFS1_pos00Unit createUnit [getmarkerpos _initialSpawn, _HFS1_squad,"HFS1_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HFS1_pos01Unit createUnit [getmarkerpos _initialSpawn, _HFS1_squad,"HFS1_squad_mem_01 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HFS1_pos02Unit createUnit [getmarkerpos _initialSpawn, _HFS1_squad,"HFS1_squad_mem_02 = this;", _unitskill, _unitrank]};




{_x enableattack false} forEach units _HFS1_squad;
{dostop _x} foreach units _HFS1_squad;



_HFS1_squad_members = units _HFS1_squad;
HFS1_squad_mem_00 setunitpos "Up"; HFS1_squad_mem_00 setPosATL _H_FS1_pos_00;
HFS1_squad_mem_01 setunitpos "Up"; HFS1_squad_mem_01 setPosATL _H_FS1_pos_01; 
HFS1_squad_mem_02 setunitpos "Up"; HFS1_squad_mem_02 setPosATL _H_FS1_pos_02;

		};
			_countarr = _countarr + 1;
	} foreach _HFS_1_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for Fuel Station 1///------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------

///-----------------------
///-----------------------
///-----------------------
///Start Squad for Fuel Station 2///-------------------------------
///-----------------------
///-----------------------
///-----------------------
///3 Positions

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_H_FS2_pos_00 = _x modelToWorld (_fuel_station_2_List select 0);
_H_FS2_pos_01 = _x modelToWorld (_fuel_station_2_List select 1);
_H_FS2_pos_02 = _x modelToWorld (_fuel_station_2_List select 2);

///Possible Units
_HFS2_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
_HFS2_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HFS2_pos02Unit = _rifPosPos select (round(random _rifPosPosNum));

_HFS2_squad = createGroup _factionside; ///Create Group



_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HFS2_pos00Unit createUnit [getmarkerpos _initialSpawn, _HFS2_squad,"HFS2_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HFS2_pos01Unit createUnit [getmarkerpos _initialSpawn, _HFS2_squad,"HFS2_squad_mem_01 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HFS2_pos02Unit createUnit [getmarkerpos _initialSpawn, _HFS2_squad,"HFS2_squad_mem_02 = this;", _unitskill, _unitrank]};




{_x enableattack false} forEach units _HFS2_squad;
{dostop _x} foreach units _HFS2_squad;



_HFS2_squad_members = units _HFS1_squad;
HFS2_squad_mem_00 setunitpos "Up"; HFS2_squad_mem_00 setPosATL _H_FS2_pos_00;
HFS2_squad_mem_01 setunitpos "Up"; HFS2_squad_mem_01 setPosATL _H_FS2_pos_01; 
HFS2_squad_mem_02 setunitpos "Up"; HFS2_squad_mem_02 setPosATL _H_FS2_pos_02;

		};
			_countarr = _countarr + 1;
	} foreach _HFS_2_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for Fuel Station 2///------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------

///-----------------------
///-----------------------
///-----------------------
///Start Squad for Oil Tower ///---------------------------------
///-----------------------
///-----------------------
///-----------------------
///5 Positions

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_O_T_1_pos_00 = _x modelToWorld (_oil_tower_List select 0);
_O_T_1_pos_01 = _x modelToWorld (_oil_tower_List select 1);
_O_T_1_pos_02 = _x modelToWorld (_oil_tower_List select 2);
_O_T_1_pos_03 = _x modelToWorld (_oil_tower_List select 3);
_O_T_1_pos_04 = _x modelToWorld (_oil_tower_List select 4);

///Possible Units
_OT_1_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
_OT_1_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_OT_1_pos02Unit = _rifPosPos select (round(random _rifPosPosNum));
_OT_1_pos03Unit = _rifPosPos select (round(random _rifPosPosNum));
_OT_1_pos04Unit = _rifPosPos select (round(random _rifPosPosNum)); 

_OT_1_squad = createGroup _factionside; ///Create Group



_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));


if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_OT_1_pos00Unit createUnit [getmarkerpos _initialSpawn, _OT_1_squad,"OT_1_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_OT_1_pos01Unit createUnit [getmarkerpos _initialSpawn, _OT_1_squad,"OT_1_squad_mem_01 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_OT_1_pos02Unit createUnit [getmarkerpos _initialSpawn, _OT_1_squad,"OT_1_squad_mem_02 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_OT_1_pos03Unit createUnit [getmarkerpos _initialSpawn, _OT_1_squad,"OT_1_squad_mem_03 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_OT_1_pos04Unit createUnit [getmarkerpos _initialSpawn, _OT_1_squad,"OT_1_squad_mem_04 = this;", _unitskill, _unitrank]};




{_x enableattack false} forEach units _OT_1_squad;
{dostop _x} foreach units _OT_1_squad;



_OT_1_squad_members = units _OT_11_squad;
OT_1_squad_mem_00 setunitpos "Middle"; OT_1_squad_mem_00 setPosATL _O_T_1_pos_00;
OT_1_squad_mem_01 setunitpos "Middle"; OT_1_squad_mem_01 setPosATL _O_T_1_pos_01; 
OT_1_squad_mem_02 setunitpos "Up"; OT_1_squad_mem_02 setPosATL _O_T_1_pos_02;
OT_1_squad_mem_03 setunitpos "Up"; OT_1_squad_mem_03 setPosATL _O_T_1_pos_03;
OT_1_squad_mem_04 setunitpos "Middle"; OT_1_squad_mem_04 setPosATL _O_T_1_pos_04; 

		};
			_countarr = _countarr + 1;
	} foreach _oil_tower_1_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for Oil Tower  ///---------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------

///-----------------------
///-----------------------
///-----------------------
///Start Squad for Mil Hanger///-------------------------------
///-----------------------
///-----------------------
///-----------------------
///2 Positions

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_M_H1_pos_00 = _x modelToWorld (_hanger_1_List select 0);
_M_H1_pos_01 = _x modelToWorld (_hanger_1_List select 1);

///Possible Units
_MH1_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
_MH1_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 

_MH1_squad = createGroup _factionside; ///Create Group



_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));


if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_MH1_pos00Unit createUnit [getmarkerpos _initialSpawn, _MH1_squad,"MH1_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_MH1_pos01Unit createUnit [getmarkerpos _initialSpawn, _MH1_squad,"MH1_squad_mem_01 = this;", _unitskill, _unitrank]};  




{_x enableattack false} forEach units _MH1_squad;
{dostop _x} foreach units _MH1_squad;



_MH1_squad_members = units _HFS1_squad;
MH1_squad_mem_00 setunitpos "Middle"; MH1_squad_mem_00 setPosATL _M_H1_pos_00;
MH1_squad_mem_01 setunitpos "Middle"; MH1_squad_mem_01 setPosATL _M_H1_pos_01; 

		};
			_countarr = _countarr + 1;
	} foreach _mil_hanger_1_List;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for Mil Hanger///------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------


///-----------------------
///-----------------------
///-----------------------
///Start Squad for Ind Garage 01 ///-------------------------------
///-----------------------
///-----------------------
///-----------------------
///2 Positions

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_I_G1_pos_00 = _x modelToWorld (_ind_Garage_01_List select 0);
_I_G1_pos_01 = _x modelToWorld (_ind_Garage_01_List select 1);

///Possible Units
_IG1_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
_IG1_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 

_IG1_squad = createGroup _factionside; ///Create Group

_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_IG1_pos00Unit createUnit [getmarkerpos _initialSpawn, _IG1_squad,"IG1_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_IG1_pos01Unit createUnit [getmarkerpos _initialSpawn, _IG1_squad,"IG1_squad_mem_01 = this;", _unitskill, _unitrank]};  

{_x enableattack false} forEach units _IG1_squad;
{dostop _x} foreach units _IG1_squad;

_IG1_squad_members = units _IG1_squad;
IG1_squad_mem_00 setunitpos "Middle"; IG1_squad_mem_00 setPosATL _I_G1_pos_00;
IG1_squad_mem_01 setunitpos "Middle"; IG1_squad_mem_01 setPosATL _I_G1_pos_01; 
		};
			_countarr = _countarr + 1;
	} foreach _HIG_1_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for Ind Garage 01///------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------


///-----------------------
///-----------------------
///-----------------------
///Start Squad for Building_WIP  ///-------------------------------
///-----------------------
///-----------------------
///-----------------------
///95 Positions

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_B_WIP_pos_00 = _x modelToWorld (_building_WIP_List select 0);
_B_WIP_pos_01 = _x modelToWorld (_building_WIP_List select 1);
_B_WIP_pos_02 = _x modelToWorld (_building_WIP_List select 2);
_B_WIP_pos_03 = _x modelToWorld (_building_WIP_List select 3);
_B_WIP_pos_04 = _x modelToWorld (_building_WIP_List select 4);
_B_WIP_pos_05 = _x modelToWorld (_building_WIP_List select 5);
_B_WIP_pos_06 = _x modelToWorld (_building_WIP_List select 6);
_B_WIP_pos_07 = _x modelToWorld (_building_WIP_List select 7);
_B_WIP_pos_08 = _x modelToWorld (_building_WIP_List select 8);
_B_WIP_pos_09 = _x modelToWorld (_building_WIP_List select 9);
_B_WIP_pos_10 = _x modelToWorld (_building_WIP_List select 10);
_B_WIP_pos_11 = _x modelToWorld (_building_WIP_List select 11);
_B_WIP_pos_12 = _x modelToWorld (_building_WIP_List select 12);
_B_WIP_pos_13 = _x modelToWorld (_building_WIP_List select 13);
_B_WIP_pos_14 = _x modelToWorld (_building_WIP_List select 14);
_B_WIP_pos_15 = _x modelToWorld (_building_WIP_List select 15);
_B_WIP_pos_16 = _x modelToWorld (_building_WIP_List select 16);
_B_WIP_pos_17 = _x modelToWorld (_building_WIP_List select 17);
_B_WIP_pos_18 = _x modelToWorld (_building_WIP_List select 18);
_B_WIP_pos_19 = _x modelToWorld (_building_WIP_List select 19);
_B_WIP_pos_20 = _x modelToWorld (_building_WIP_List select 20);
_B_WIP_pos_21 = _x modelToWorld (_building_WIP_List select 21);
_B_WIP_pos_22 = _x modelToWorld (_building_WIP_List select 22);
_B_WIP_pos_23 = _x modelToWorld (_building_WIP_List select 23);
_B_WIP_pos_24 = _x modelToWorld (_building_WIP_List select 24);
_B_WIP_pos_25 = _x modelToWorld (_building_WIP_List select 25);
_B_WIP_pos_26 = _x modelToWorld (_building_WIP_List select 26);
_B_WIP_pos_27 = _x modelToWorld (_building_WIP_List select 27);
_B_WIP_pos_28 = _x modelToWorld (_building_WIP_List select 28);
_B_WIP_pos_29 = _x modelToWorld (_building_WIP_List select 29);
_B_WIP_pos_30 = _x modelToWorld (_building_WIP_List select 30);
_B_WIP_pos_31 = _x modelToWorld (_building_WIP_List select 31);
_B_WIP_pos_32 = _x modelToWorld (_building_WIP_List select 32);
_B_WIP_pos_33 = _x modelToWorld (_building_WIP_List select 33);
_B_WIP_pos_34 = _x modelToWorld (_building_WIP_List select 34);
_B_WIP_pos_35 = _x modelToWorld (_building_WIP_List select 35);
_B_WIP_pos_36 = _x modelToWorld (_building_WIP_List select 36);
_B_WIP_pos_37 = _x modelToWorld (_building_WIP_List select 37);
_B_WIP_pos_38 = _x modelToWorld (_building_WIP_List select 38);
_B_WIP_pos_39 = _x modelToWorld (_building_WIP_List select 39);
_B_WIP_pos_40 = _x modelToWorld (_building_WIP_List select 40);
_B_WIP_pos_41 = _x modelToWorld (_building_WIP_List select 41);
_B_WIP_pos_42 = _x modelToWorld (_building_WIP_List select 42);
_B_WIP_pos_43 = _x modelToWorld (_building_WIP_List select 43);
_B_WIP_pos_44 = _x modelToWorld (_building_WIP_List select 44);
_B_WIP_pos_45 = _x modelToWorld (_building_WIP_List select 45);
_B_WIP_pos_46 = _x modelToWorld (_building_WIP_List select 46);
_B_WIP_pos_47 = _x modelToWorld (_building_WIP_List select 47);
_B_WIP_pos_48 = _x modelToWorld (_building_WIP_List select 48);
_B_WIP_pos_49 = _x modelToWorld (_building_WIP_List select 49);
_B_WIP_pos_50 = _x modelToWorld (_building_WIP_List select 50);
_B_WIP_pos_51 = _x modelToWorld (_building_WIP_List select 51);
_B_WIP_pos_52 = _x modelToWorld (_building_WIP_List select 52);
_B_WIP_pos_53 = _x modelToWorld (_building_WIP_List select 53);
_B_WIP_pos_54 = _x modelToWorld (_building_WIP_List select 54);
_B_WIP_pos_55 = _x modelToWorld (_building_WIP_List select 55);
_B_WIP_pos_56 = _x modelToWorld (_building_WIP_List select 56);
_B_WIP_pos_57 = _x modelToWorld (_building_WIP_List select 57);
_B_WIP_pos_58 = _x modelToWorld (_building_WIP_List select 58);
_B_WIP_pos_59 = _x modelToWorld (_building_WIP_List select 59);
_B_WIP_pos_60 = _x modelToWorld (_building_WIP_List select 60);
_B_WIP_pos_61 = _x modelToWorld (_building_WIP_List select 61);
_B_WIP_pos_62 = _x modelToWorld (_building_WIP_List select 62);
_B_WIP_pos_63 = _x modelToWorld (_building_WIP_List select 63);
_B_WIP_pos_64 = _x modelToWorld (_building_WIP_List select 64);
_B_WIP_pos_65 = _x modelToWorld (_building_WIP_List select 65);
_B_WIP_pos_66 = _x modelToWorld (_building_WIP_List select 66);
_B_WIP_pos_67 = _x modelToWorld (_building_WIP_List select 67);
_B_WIP_pos_68 = _x modelToWorld (_building_WIP_List select 68);
_B_WIP_pos_69 = _x modelToWorld (_building_WIP_List select 69);
_B_WIP_pos_70 = _x modelToWorld (_building_WIP_List select 70);
_B_WIP_pos_71 = _x modelToWorld (_building_WIP_List select 71);
_B_WIP_pos_72 = _x modelToWorld (_building_WIP_List select 72);
_B_WIP_pos_73 = _x modelToWorld (_building_WIP_List select 73);
_B_WIP_pos_74 = _x modelToWorld (_building_WIP_List select 74);
_B_WIP_pos_75 = _x modelToWorld (_building_WIP_List select 75);
_B_WIP_pos_76 = _x modelToWorld (_building_WIP_List select 76);
_B_WIP_pos_77 = _x modelToWorld (_building_WIP_List select 77);
_B_WIP_pos_78 = _x modelToWorld (_building_WIP_List select 78);
_B_WIP_pos_79 = _x modelToWorld (_building_WIP_List select 79);
_B_WIP_pos_80 = _x modelToWorld (_building_WIP_List select 80);
_B_WIP_pos_81 = _x modelToWorld (_building_WIP_List select 81);
_B_WIP_pos_82 = _x modelToWorld (_building_WIP_List select 82);
_B_WIP_pos_83 = _x modelToWorld (_building_WIP_List select 83);
_B_WIP_pos_84 = _x modelToWorld (_building_WIP_List select 84);
_B_WIP_pos_85 = _x modelToWorld (_building_WIP_List select 85);
_B_WIP_pos_86 = _x modelToWorld (_building_WIP_List select 86);
_B_WIP_pos_87 = _x modelToWorld (_building_WIP_List select 87);
_B_WIP_pos_88 = _x modelToWorld (_building_WIP_List select 88);
_B_WIP_pos_89 = _x modelToWorld (_building_WIP_List select 89);
_B_WIP_pos_90 = _x modelToWorld (_building_WIP_List select 90);
_B_WIP_pos_91 = _x modelToWorld (_building_WIP_List select 91);
_B_WIP_pos_92 = _x modelToWorld (_building_WIP_List select 92);
_B_WIP_pos_93 = _x modelToWorld (_building_WIP_List select 93);
_B_WIP_pos_94 = _x modelToWorld (_building_WIP_List select 94);


///Possible Units
_BWIP_pos00Unit = _atPosPos select (round(random _atPosPosNum));
_BWIP_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_BWIP_pos02Unit = _mgPosPos select (round(random _mgPosPosNum));
_BWIP_pos03Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos04Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_BWIP_pos05Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_BWIP_pos06Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos07Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos08Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos09Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_BWIP_pos10Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos11Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos12Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos13Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos14Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos15Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos16Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos17Unit = _mgPosPos select (round(random _mgPosPosNum));
_BWIP_pos18Unit = _mgPosPos select (round(random _mgPosPosNum));
_BWIP_pos19Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos20Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos21Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos22Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos23Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos24Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos25Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_BWIP_pos26Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos27Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos28Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_BWIP_pos29Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_BWIP_pos30Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos31Unit = _mgPosPos select (round(random _mgPosPosNum));
_BWIP_pos32Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos33Unit = _atPosPos select (round(random _atPosPosNum)); 
_BWIP_pos34Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos35Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos36Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos37Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos38Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos39Unit = _atPosPos select (round(random _atPosPosNum));
_BWIP_pos40Unit = _atPosPos select (round(random _atPosPosNum));
_BWIP_pos41Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos42Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos43Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos44Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos45Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos46Unit = _atPosPos select (round(random _atPosPosNum));
_BWIP_pos47Unit = _atPosPos select (round(random _atPosPosNum));
_BWIP_pos48Unit = _mgPosPos select (round(random _mgPosPosNum));
_BWIP_pos49Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_BWIP_pos50Unit = _mgPosPos select (round(random _mgPosPosNum));
_BWIP_pos51Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos52Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_BWIP_pos53Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_BWIP_pos54Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos55Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos56Unit = _atPosPos select (round(random _atPosPosNum));
_BWIP_pos57Unit = _atPosPos select (round(random _atPosPosNum)); 
_BWIP_pos58Unit = _mgPosPos select (round(random _mgPosPosNum));
_BWIP_pos59Unit = _mgPosPos select (round(random _mgPosPosNum));
_BWIP_pos60Unit = _mgPosPos select (round(random _mgPosPosNum));
_BWIP_pos61Unit = _atPosPos select (round(random _atPosPosNum));
_BWIP_pos62Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos63Unit = _atPosPos select (round(random _atPosPosNum));
_BWIP_pos64Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos65Unit = _atPosPos select (round(random _atPosPosNum));
_BWIP_pos66Unit = _mgPosPos select (round(random _mgPosPosNum));
_BWIP_pos67Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos68Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos69Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos70Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos71Unit = _atPosPos select (round(random _atPosPosNum));
_BWIP_pos72Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos73Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos74Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos75Unit = _atPosPos select (round(random _atPosPosNum));
_BWIP_pos76Unit = _atPosPos select (round(random _atPosPosNum));
_BWIP_pos77Unit = _atPosPos select (round(random _atPosPosNum)); 
_BWIP_pos78Unit = _atPosPos select (round(random _atPosPosNum));
_BWIP_pos79Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos80Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos81Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos82Unit = _atPosPos select (round(random _atPosPosNum));
_BWIP_pos83Unit = _atPosPos select (round(random _atPosPosNum));
_BWIP_pos84Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos85Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos86Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos87Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos88Unit = _atPosPos select (round(random _atPosPosNum));
_BWIP_pos89Unit = _mgPosPos select (round(random _mgPosPosNum));
_BWIP_pos90Unit = _mgPosPos select (round(random _mgPosPosNum));
_BWIP_pos91Unit = _mgPosPos select (round(random _mgPosPosNum));
_BWIP_pos92Unit = _atPosPos select (round(random _atPosPosNum));
_BWIP_pos93Unit = _rifPosPos select (round(random _rifPosPosNum));
_BWIP_pos94Unit = _rifPosPos select (round(random _rifPosPosNum));

_BWIPS_squad = createGroup _factionside; ///Create Group



_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos00Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos01Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_01 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos02Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_02 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos03Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_03 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos04Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_04 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos05Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_05 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_BWIP_pos06Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_06 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_BWIP_pos07Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_07 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_BWIP_pos08Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_08 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_BWIP_pos09Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_09 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_BWIP_pos10Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_10 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_BWIP_pos11Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_11 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_BWIP_pos12Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_12 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_BWIP_pos13Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_13 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos14Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_14 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos15Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_15 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos16Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_16 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos17Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_17 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos18Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_18 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos19Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_19 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos20Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_20 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos21Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_21 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos22Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_22 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos23Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_23 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos24Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_24 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos25Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_25 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos26Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_26 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos27Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_27 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos28Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_28 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos29Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_29 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos30Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_30 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos31Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_31 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos32Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_32 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos33Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_33 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos34Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_34 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos35Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_35 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos36Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_36 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos37Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_37 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos38Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_38 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos39Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_39 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos40Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_40 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos41Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_41 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos42Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_42 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos43Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_43 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos44Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_44 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos45Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_45 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos46Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_46 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos47Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_47 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos48Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_48 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos49Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_49 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosBalconyOnOff == 1) then {_BWIP_pos50Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_50 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos51Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_51 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos52Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_52 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos53Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_53 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos54Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_54 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos55Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_55 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos56Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_56 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos57Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_57 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos58Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_58 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos59Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_59 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos60Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_60 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos61Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_61 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos62Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_62 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos63Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_63 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos64Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_64 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos65Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_65 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos66Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_66 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos67Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_67 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos68Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_68 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos69Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_69 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos70Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_70 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos71Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_71 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos72Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_72 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos73Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_73 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos74Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_74 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos75Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_75 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos76Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_76 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos77Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_77 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos78Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_78 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos79Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_79 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos80Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_80 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos81Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_81 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_BWIP_pos82Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_82 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_BWIP_pos83Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_83 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_BWIP_pos84Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_84 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_BWIP_pos85Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_85 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_BWIP_pos86Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_86 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_BWIP_pos87Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_87 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_BWIP_pos88Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_88 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_BWIP_pos89Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_89 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_BWIP_pos90Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_90 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_BWIP_pos91Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_91 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_BWIP_pos92Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_92 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_BWIP_pos93Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_93 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_BWIP_pos94Unit createUnit [getmarkerpos _initialSpawn, _BWIPS_squad,"BWIPS_squad_mem_94 = this;", _unitskill, _unitrank]};





{_x enableattack false} forEach units _BWIPS_squad;
{dostop _x} foreach units _BWIPS_squad;



_BWIPS_squad_members = units _BWIPS_squad;
BWIPS_squad_mem_00 setunitpos "Middle"; BWIPS_squad_mem_00 setPosATL _B_WIP_pos_00;
BWIPS_squad_mem_01 setunitpos "Middle"; BWIPS_squad_mem_01 setPosATL _B_WIP_pos_01; 
BWIPS_squad_mem_02 setunitpos "Down"; BWIPS_squad_mem_02 setPosATL _B_WIP_pos_02;
BWIPS_squad_mem_03 setunitpos "Middle"; BWIPS_squad_mem_03 setPosATL _B_WIP_pos_03;
BWIPS_squad_mem_04 setunitpos "Middle"; BWIPS_squad_mem_04 setPosATL _B_WIP_pos_04; 
BWIPS_squad_mem_05 setunitpos "Middle"; BWIPS_squad_mem_05 setPosATL _B_WIP_pos_05;
BWIPS_squad_mem_06 setunitpos "Middle"; BWIPS_squad_mem_06 setPosATL _B_WIP_pos_06;
BWIPS_squad_mem_07 setunitpos "Middle"; BWIPS_squad_mem_07 setPosATL _B_WIP_pos_07;
BWIPS_squad_mem_08 setunitpos "Middle"; BWIPS_squad_mem_08 setPosATL _B_WIP_pos_08;
BWIPS_squad_mem_09 setunitpos "Middle"; BWIPS_squad_mem_09 setPosATL _B_WIP_pos_09; 
BWIPS_squad_mem_10 setunitpos "Middle"; BWIPS_squad_mem_10 setPosATL _B_WIP_pos_10;
BWIPS_squad_mem_11 setunitpos "Middle"; BWIPS_squad_mem_11 setPosATL _B_WIP_pos_11;
BWIPS_squad_mem_12 setunitpos "Middle"; BWIPS_squad_mem_12 setPosATL _B_WIP_pos_12;
BWIPS_squad_mem_13 setunitpos "Middle"; BWIPS_squad_mem_13 setPosATL _B_WIP_pos_13;
BWIPS_squad_mem_14 setunitpos "Up"; BWIPS_squad_mem_14 setPosATL _B_WIP_pos_14;
BWIPS_squad_mem_15 setunitpos "Up"; BWIPS_squad_mem_15 setPosATL _B_WIP_pos_15;
BWIPS_squad_mem_16 setunitpos "Up"; BWIPS_squad_mem_16 setPosATL _B_WIP_pos_16;
BWIPS_squad_mem_17 setunitpos "Up"; BWIPS_squad_mem_17 setPosATL _B_WIP_pos_17;
BWIPS_squad_mem_18 setunitpos "Middle"; BWIPS_squad_mem_18 setPosATL _B_WIP_pos_18;
BWIPS_squad_mem_19 setunitpos "Middle"; BWIPS_squad_mem_19 setPosATL _B_WIP_pos_19;
BWIPS_squad_mem_20 setunitpos "Middle"; BWIPS_squad_mem_20 setPosATL _B_WIP_pos_20;
BWIPS_squad_mem_21 setunitpos "Middle"; BWIPS_squad_mem_21 setPosATL _B_WIP_pos_21;
BWIPS_squad_mem_22 setunitpos "Middle"; BWIPS_squad_mem_22 setPosATL _B_WIP_pos_22;
BWIPS_squad_mem_23 setunitpos "Middle"; BWIPS_squad_mem_23 setPosATL _B_WIP_pos_23;
BWIPS_squad_mem_24 setunitpos "Middle"; BWIPS_squad_mem_24 setPosATL _B_WIP_pos_24;
BWIPS_squad_mem_25 setunitpos "Middle"; BWIPS_squad_mem_25 setPosATL _B_WIP_pos_25; 
BWIPS_squad_mem_26 setunitpos "Middle"; BWIPS_squad_mem_26 setPosATL _B_WIP_pos_26;
BWIPS_squad_mem_27 setunitpos "Middle"; BWIPS_squad_mem_27 setPosATL _B_WIP_pos_27;
BWIPS_squad_mem_28 setunitpos "Middle"; BWIPS_squad_mem_28 setPosATL _B_WIP_pos_28; 
BWIPS_squad_mem_29 setunitpos "Middle"; BWIPS_squad_mem_29 setPosATL _B_WIP_pos_29;
BWIPS_squad_mem_30 setunitpos "Down"; BWIPS_squad_mem_30 setPosATL _B_WIP_pos_30;
BWIPS_squad_mem_31 setunitpos "Middle"; BWIPS_squad_mem_31 setPosATL _B_WIP_pos_31;
BWIPS_squad_mem_32 setunitpos "Down"; BWIPS_squad_mem_32 setPosATL _B_WIP_pos_32;
BWIPS_squad_mem_33 setunitpos "Up"; BWIPS_squad_mem_33 setPosATL _B_WIP_pos_33; 
BWIPS_squad_mem_34 setunitpos "Up"; BWIPS_squad_mem_34 setPosATL _B_WIP_pos_34;
BWIPS_squad_mem_35 setunitpos "Up"; BWIPS_squad_mem_35 setPosATL _B_WIP_pos_35;
BWIPS_squad_mem_36 setunitpos "Up"; BWIPS_squad_mem_36 setPosATL _B_WIP_pos_36;
BWIPS_squad_mem_37 setunitpos "Up"; BWIPS_squad_mem_37 setPosATL _B_WIP_pos_37;
BWIPS_squad_mem_38 setunitpos "Up"; BWIPS_squad_mem_38 setPosATL _B_WIP_pos_38;
BWIPS_squad_mem_39 setunitpos "Up"; BWIPS_squad_mem_39 setPosATL _B_WIP_pos_39;
BWIPS_squad_mem_40 setunitpos "Up"; BWIPS_squad_mem_40 setPosATL _B_WIP_pos_40;
BWIPS_squad_mem_41 setunitpos "Up"; BWIPS_squad_mem_41 setPosATL _B_WIP_pos_41;
BWIPS_squad_mem_42 setunitpos "Up"; BWIPS_squad_mem_42 setPosATL _B_WIP_pos_42;
BWIPS_squad_mem_43 setunitpos "Up"; BWIPS_squad_mem_43 setPosATL _B_WIP_pos_43;
BWIPS_squad_mem_44 setunitpos "Up"; BWIPS_squad_mem_44 setPosATL _B_WIP_pos_44;
BWIPS_squad_mem_45 setunitpos "Up"; BWIPS_squad_mem_45 setPosATL _B_WIP_pos_45;
BWIPS_squad_mem_46 setunitpos "Up"; BWIPS_squad_mem_46 setPosATL _B_WIP_pos_46;
BWIPS_squad_mem_47 setunitpos "Up"; BWIPS_squad_mem_47 setPosATL _B_WIP_pos_47;
BWIPS_squad_mem_48 setunitpos "Down"; BWIPS_squad_mem_48 setPosATL _B_WIP_pos_48;
BWIPS_squad_mem_49 setunitpos "Middle"; BWIPS_squad_mem_49 setPosATL _B_WIP_pos_49; 
BWIPS_squad_mem_50 setunitpos "Down"; BWIPS_squad_mem_50 setPosATL _B_WIP_pos_50;
BWIPS_squad_mem_51 setunitpos "Up"; BWIPS_squad_mem_51 setPosATL _B_WIP_pos_51;
BWIPS_squad_mem_52 setunitpos "Up"; BWIPS_squad_mem_52 setPosATL _B_WIP_pos_52; 
BWIPS_squad_mem_53 setunitpos "Up"; BWIPS_squad_mem_53 setPosATL _B_WIP_pos_53;
BWIPS_squad_mem_54 setunitpos "Up"; BWIPS_squad_mem_54 setPosATL _B_WIP_pos_54;
BWIPS_squad_mem_55 setunitpos "Up"; BWIPS_squad_mem_55 setPosATL _B_WIP_pos_55;
BWIPS_squad_mem_56 setunitpos "Middle"; BWIPS_squad_mem_56 setPosATL _B_WIP_pos_56;
BWIPS_squad_mem_57 setunitpos "Up"; BWIPS_squad_mem_57 setPosATL _B_WIP_pos_57; 
BWIPS_squad_mem_58 setunitpos "Down"; BWIPS_squad_mem_58 setPosATL _B_WIP_pos_58;
BWIPS_squad_mem_59 setunitpos "Down"; BWIPS_squad_mem_59 setPosATL _B_WIP_pos_59;
BWIPS_squad_mem_60 setunitpos "Middle"; BWIPS_squad_mem_60 setPosATL _B_WIP_pos_60;
BWIPS_squad_mem_61 setunitpos "Down"; BWIPS_squad_mem_61 setPosATL _B_WIP_pos_61;
BWIPS_squad_mem_62 setunitpos "Middle"; BWIPS_squad_mem_62 setPosATL _B_WIP_pos_62;
BWIPS_squad_mem_63 setunitpos "Middle"; BWIPS_squad_mem_63 setPosATL _B_WIP_pos_63;
BWIPS_squad_mem_64 setunitpos "Middle"; BWIPS_squad_mem_64 setPosATL _B_WIP_pos_64;
BWIPS_squad_mem_65 setunitpos "Down"; BWIPS_squad_mem_65 setPosATL _B_WIP_pos_65;
BWIPS_squad_mem_66 setunitpos "Down"; BWIPS_squad_mem_66 setPosATL _B_WIP_pos_66;
BWIPS_squad_mem_67 setunitpos "Up"; BWIPS_squad_mem_67 setPosATL _B_WIP_pos_67;
BWIPS_squad_mem_68 setunitpos "Up"; BWIPS_squad_mem_68 setPosATL _B_WIP_pos_68;
BWIPS_squad_mem_69 setunitpos "Up"; BWIPS_squad_mem_69 setPosATL _B_WIP_pos_69;
BWIPS_squad_mem_70 setunitpos "Up"; BWIPS_squad_mem_70 setPosATL _B_WIP_pos_70;
BWIPS_squad_mem_71 setunitpos "Up"; BWIPS_squad_mem_71 setPosATL _B_WIP_pos_71;
BWIPS_squad_mem_72 setunitpos "Up"; BWIPS_squad_mem_72 setPosATL _B_WIP_pos_72;
BWIPS_squad_mem_73 setunitpos "Up"; BWIPS_squad_mem_73 setPosATL _B_WIP_pos_73; 
BWIPS_squad_mem_74 setunitpos "Up"; BWIPS_squad_mem_74 setPosATL _B_WIP_pos_74;
BWIPS_squad_mem_75 setunitpos "Up"; BWIPS_squad_mem_75 setPosATL _B_WIP_pos_75;
BWIPS_squad_mem_76 setunitpos "Middle"; BWIPS_squad_mem_76 setPosATL _B_WIP_pos_76; 
BWIPS_squad_mem_77 setunitpos "Middle"; BWIPS_squad_mem_77 setPosATL _B_WIP_pos_77;
BWIPS_squad_mem_78 setunitpos "Middle"; BWIPS_squad_mem_78 setPosATL _B_WIP_pos_78;
BWIPS_squad_mem_79 setunitpos "Up"; BWIPS_squad_mem_79 setPosATL _B_WIP_pos_79;
BWIPS_squad_mem_80 setunitpos "Up"; BWIPS_squad_mem_80 setPosATL _B_WIP_pos_80;
BWIPS_squad_mem_81 setunitpos "Up"; BWIPS_squad_mem_81 setPosATL _B_WIP_pos_81;
BWIPS_squad_mem_82 setunitpos "Up"; BWIPS_squad_mem_82 setPosATL _B_WIP_pos_82;
BWIPS_squad_mem_83 setunitpos "Up"; BWIPS_squad_mem_83 setPosATL _B_WIP_pos_83;
BWIPS_squad_mem_84 setunitpos "Up"; BWIPS_squad_mem_84 setPosATL _B_WIP_pos_84;
BWIPS_squad_mem_85 setunitpos "Up"; BWIPS_squad_mem_85 setPosATL _B_WIP_pos_85;
BWIPS_squad_mem_86 setunitpos "Up"; BWIPS_squad_mem_86 setPosATL _B_WIP_pos_86;
BWIPS_squad_mem_87 setunitpos "Up"; BWIPS_squad_mem_87 setPosATL _B_WIP_pos_87;
BWIPS_squad_mem_88 setunitpos "Middle"; BWIPS_squad_mem_88 setPosATL _B_WIP_pos_88;
BWIPS_squad_mem_89 setunitpos "Down"; BWIPS_squad_mem_89 setPosATL _B_WIP_pos_89;
BWIPS_squad_mem_90 setunitpos "Down"; BWIPS_squad_mem_90 setPosATL _B_WIP_pos_90;
BWIPS_squad_mem_91 setunitpos "Down"; BWIPS_squad_mem_91 setPosATL _B_WIP_pos_91;
BWIPS_squad_mem_92 setunitpos "Middle"; BWIPS_squad_mem_92 setPosATL _B_WIP_pos_92; 
BWIPS_squad_mem_93 setunitpos "Up"; BWIPS_squad_mem_93 setPosATL _B_WIP_pos_93;
BWIPS_squad_mem_94 setunitpos "Up"; BWIPS_squad_mem_94 setPosATL _B_WIP_pos_94;

		};
			_countarr = _countarr + 1;
	} foreach _HWIP_1_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for BUILDING WIP///--------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------

///-----------------------
///-----------------------
///-----------------------
///Start Squad for Office Building///------------------------------
///-----------------------
///-----------------------
///-----------------------
///41 Positions

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_H_Off_1_pos_00 = _x modelToWorld (_office_building_List select 0);
_H_Off_1_pos_01 = _x modelToWorld (_office_building_List select 1);
_H_Off_1_pos_02 = _x modelToWorld (_office_building_List select 2);
_H_Off_1_pos_03 = _x modelToWorld (_office_building_List select 3);
_H_Off_1_pos_04 = _x modelToWorld (_office_building_List select 4);
_H_Off_1_pos_05 = _x modelToWorld (_office_building_List select 5);
_H_Off_1_pos_06 = _x modelToWorld (_office_building_List select 6);
_H_Off_1_pos_07 = _x modelToWorld (_office_building_List select 7);
_H_Off_1_pos_08 = _x modelToWorld (_office_building_List select 8);
_H_Off_1_pos_09 = _x modelToWorld (_office_building_List select 9);
_H_Off_1_pos_10 = _x modelToWorld (_office_building_List select 10);
_H_Off_1_pos_11 = _x modelToWorld (_office_building_List select 11);
_H_Off_1_pos_12 = _x modelToWorld (_office_building_List select 12);
_H_Off_1_pos_13 = _x modelToWorld (_office_building_List select 13);
_H_Off_1_pos_14 = _x modelToWorld (_office_building_List select 14);
_H_Off_1_pos_15 = _x modelToWorld (_office_building_List select 15);
_H_Off_1_pos_16 = _x modelToWorld (_office_building_List select 16);
_H_Off_1_pos_17 = _x modelToWorld (_office_building_List select 17);
_H_Off_1_pos_18 = _x modelToWorld (_office_building_List select 18);
_H_Off_1_pos_19 = _x modelToWorld (_office_building_List select 19);
_H_Off_1_pos_20 = _x modelToWorld (_office_building_List select 20);
_H_Off_1_pos_21 = _x modelToWorld (_office_building_List select 21);
_H_Off_1_pos_22 = _x modelToWorld (_office_building_List select 22);
_H_Off_1_pos_23 = _x modelToWorld (_office_building_List select 23);
_H_Off_1_pos_24 = _x modelToWorld (_office_building_List select 24);
_H_Off_1_pos_25 = _x modelToWorld (_office_building_List select 25);
_H_Off_1_pos_26 = _x modelToWorld (_office_building_List select 26);
_H_Off_1_pos_27 = _x modelToWorld (_office_building_List select 27);
_H_Off_1_pos_28 = _x modelToWorld (_office_building_List select 28);
_H_Off_1_pos_29 = _x modelToWorld (_office_building_List select 29);
_H_Off_1_pos_30 = _x modelToWorld (_office_building_List select 30);
_H_Off_1_pos_31 = _x modelToWorld (_office_building_List select 31);
_H_Off_1_pos_32 = _x modelToWorld (_office_building_List select 32);
_H_Off_1_pos_33 = _x modelToWorld (_office_building_List select 33);
_H_Off_1_pos_34 = _x modelToWorld (_office_building_List select 34);
_H_Off_1_pos_35 = _x modelToWorld (_office_building_List select 35);
_H_Off_1_pos_36 = _x modelToWorld (_office_building_List select 36);
_H_Off_1_pos_37 = _x modelToWorld (_office_building_List select 37);
_H_Off_1_pos_38 = _x modelToWorld (_office_building_List select 38);
_H_Off_1_pos_39 = _x modelToWorld (_office_building_List select 39);
_H_Off_1_pos_40 = _x modelToWorld (_office_building_List select 40);

///Possible Units
_HOff_1_pos00Unit = _atPosPos select (round(random _atPosPosNum));
_HOff_1_pos01Unit = _atPosPos select (round(random _atPosPosNum)); 
_HOff_1_pos02Unit = _rifPosPos select (round(random _rifPosPosNum));
_HOff_1_pos03Unit = _rifPosPos select (round(random _rifPosPosNum));
_HOff_1_pos04Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HOff_1_pos05Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HOff_1_pos06Unit = _rifPosPos select (round(random _rifPosPosNum));
_HOff_1_pos07Unit = _rifPosPos select (round(random _rifPosPosNum));
_HOff_1_pos08Unit = _rifPosPos select (round(random _rifPosPosNum));
_HOff_1_pos09Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HOff_1_pos10Unit = _atPosPos select (round(random _atPosPosNum));
_HOff_1_pos11Unit = _rifPosPos select (round(random _rifPosPosNum));
_HOff_1_pos12Unit = _rifPosPos select (round(random _rifPosPosNum));
_HOff_1_pos13Unit = _atPosPos select (round(random _atPosPosNum));
_HOff_1_pos14Unit = _mgPosPos select (round(random _mgPosPosNum));
_HOff_1_pos15Unit = _atPosPos select (round(random _atPosPosNum));
_HOff_1_pos16Unit = _atPosPos select (round(random _atPosPosNum));
_HOff_1_pos17Unit = _rifPosPos select (round(random _rifPosPosNum));
_HOff_1_pos18Unit = _rifPosPos select (round(random _rifPosPosNum));
_HOff_1_pos19Unit = _rifPosPos select (round(random _rifPosPosNum));
_HOff_1_pos20Unit = _rifPosPos select (round(random _rifPosPosNum));
_HOff_1_pos21Unit = _rifPosPos select (round(random _rifPosPosNum));
_HOff_1_pos22Unit = _rifPosPos select (round(random _rifPosPosNum));
_HOff_1_pos23Unit = _rifPosPos select (round(random _rifPosPosNum));
_HOff_1_pos24Unit = _rifPosPos select (round(random _rifPosPosNum));
_HOff_1_pos25Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HOff_1_pos26Unit = _rifPosPos select (round(random _rifPosPosNum));
_HOff_1_pos27Unit = _rifPosPos select (round(random _rifPosPosNum));
_HOff_1_pos28Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HOff_1_pos29Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HOff_1_pos30Unit = _rifPosPos select (round(random _rifPosPosNum));
_HOff_1_pos31Unit = _mgPosPos select (round(random _mgPosPosNum));
_HOff_1_pos32Unit = _mgPosPos select (round(random _mgPosPosNum));
_HOff_1_pos33Unit = _atmgPosPos select (round(random _atmgPosPosNum)); 
_HOff_1_pos34Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HOff_1_pos35Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HOff_1_pos36Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HOff_1_pos37Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HOff_1_pos38Unit = _atmgPosPos select (round(random _atmgPosPosNum));
_HOff_1_pos39Unit = _rifPosPos select (round(random _rifPosPosNum));
_HOff_1_pos40Unit = _rifPosPos select (round(random _rifPosPosNum));

_HOff_1S_squad = createGroup _factionside; ///Create Group



_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HOff_1_pos00Unit createUnit [getmarkerpos _initialSpawn, _HOff_1S_squad,"HOff_1S_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HOff_1_pos01Unit createUnit [getmarkerpos _initialSpawn, _HOff_1S_squad,"HOff_1S_squad_mem_01 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HOff_1_pos02Unit createUnit [getmarkerpos _initialSpawn, _HOff_1S_squad,"HOff_1S_squad_mem_02 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HOff_1_pos03Unit createUnit [getmarkerpos _initialSpawn, _HOff_1S_squad,"HOff_1S_squad_mem_03 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HOff_1_pos04Unit createUnit [getmarkerpos _initialSpawn, _HOff_1S_squad,"HOff_1S_squad_mem_04 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HOff_1_pos05Unit createUnit [getmarkerpos _initialSpawn, _HOff_1S_squad,"HOff_1S_squad_mem_05 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HOff_1_pos06Unit createUnit [getmarkerpos _initialSpawn, _HOff_1S_squad,"HOff_1S_squad_mem_06 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HOff_1_pos07Unit createUnit [getmarkerpos _initialSpawn, _HOff_1S_squad,"HOff_1S_squad_mem_07 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HOff_1_pos08Unit createUnit [getmarkerpos _initialSpawn, _HOff_1S_squad,"HOff_1S_squad_mem_08 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HOff_1_pos09Unit createUnit [getmarkerpos _initialSpawn, _HOff_1S_squad,"HOff_1S_squad_mem_09 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HOff_1_pos10Unit createUnit [getmarkerpos _initialSpawn, _HOff_1S_squad,"HOff_1S_squad_mem_10 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HOff_1_pos11Unit createUnit [getmarkerpos _initialSpawn, _HOff_1S_squad,"HOff_1S_squad_mem_11 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HOff_1_pos12Unit createUnit [getmarkerpos _initialSpawn, _HOff_1S_squad,"HOff_1S_squad_mem_12 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HOff_1_pos13Unit createUnit [getmarkerpos _initialSpawn, _HOff_1S_squad,"HOff_1S_squad_mem_13 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosBalconyOnOff == 1) then {_HOff_1_pos14Unit createUnit [getmarkerpos _initialSpawn, _HOff_1S_squad,"HOff_1S_squad_mem_14 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosBalconyOnOff == 1) then {_HOff_1_pos15Unit createUnit [getmarkerpos _initialSpawn, _HOff_1S_squad,"HOff_1S_squad_mem_15 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosBalconyOnOff == 1) then {_HOff_1_pos16Unit createUnit [getmarkerpos _initialSpawn, _HOff_1S_squad,"HOff_1S_squad_mem_16 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HOff_1_pos17Unit createUnit [getmarkerpos _initialSpawn, _HOff_1S_squad,"HOff_1S_squad_mem_17 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HOff_1_pos18Unit createUnit [getmarkerpos _initialSpawn, _HOff_1S_squad,"HOff_1S_squad_mem_18 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HOff_1_pos19Unit createUnit [getmarkerpos _initialSpawn, _HOff_1S_squad,"HOff_1S_squad_mem_19 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HOff_1_pos20Unit createUnit [getmarkerpos _initialSpawn, _HOff_1S_squad,"HOff_1S_squad_mem_20 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HOff_1_pos21Unit createUnit [getmarkerpos _initialSpawn, _HOff_1S_squad,"HOff_1S_squad_mem_21 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HOff_1_pos22Unit createUnit [getmarkerpos _initialSpawn, _HOff_1S_squad,"HOff_1S_squad_mem_22 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HOff_1_pos23Unit createUnit [getmarkerpos _initialSpawn, _HOff_1S_squad,"HOff_1S_squad_mem_23 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HOff_1_pos24Unit createUnit [getmarkerpos _initialSpawn, _HOff_1S_squad,"HOff_1S_squad_mem_24 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HOff_1_pos25Unit createUnit [getmarkerpos _initialSpawn, _HOff_1S_squad,"HOff_1S_squad_mem_25 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HOff_1_pos26Unit createUnit [getmarkerpos _initialSpawn, _HOff_1S_squad,"HOff_1S_squad_mem_26 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HOff_1_pos27Unit createUnit [getmarkerpos _initialSpawn, _HOff_1S_squad,"HOff_1S_squad_mem_27 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HOff_1_pos28Unit createUnit [getmarkerpos _initialSpawn, _HOff_1S_squad,"HOff_1S_squad_mem_28 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HOff_1_pos29Unit createUnit [getmarkerpos _initialSpawn, _HOff_1S_squad,"HOff_1S_squad_mem_29 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HOff_1_pos30Unit createUnit [getmarkerpos _initialSpawn, _HOff_1S_squad,"HOff_1S_squad_mem_30 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HOff_1_pos31Unit createUnit [getmarkerpos _initialSpawn, _HOff_1S_squad,"HOff_1S_squad_mem_31 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HOff_1_pos32Unit createUnit [getmarkerpos _initialSpawn, _HOff_1S_squad,"HOff_1S_squad_mem_32 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HOff_1_pos33Unit createUnit [getmarkerpos _initialSpawn, _HOff_1S_squad,"HOff_1S_squad_mem_33 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HOff_1_pos34Unit createUnit [getmarkerpos _initialSpawn, _HOff_1S_squad,"HOff_1S_squad_mem_34 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HOff_1_pos35Unit createUnit [getmarkerpos _initialSpawn, _HOff_1S_squad,"HOff_1S_squad_mem_35 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HOff_1_pos36Unit createUnit [getmarkerpos _initialSpawn, _HOff_1S_squad,"HOff_1S_squad_mem_36 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HOff_1_pos37Unit createUnit [getmarkerpos _initialSpawn, _HOff_1S_squad,"HOff_1S_squad_mem_37 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HOff_1_pos38Unit createUnit [getmarkerpos _initialSpawn, _HOff_1S_squad,"HOff_1S_squad_mem_38 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HOff_1_pos39Unit createUnit [getmarkerpos _initialSpawn, _HOff_1S_squad,"HOff_1S_squad_mem_39 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HOff_1_pos40Unit createUnit [getmarkerpos _initialSpawn, _HOff_1S_squad,"HOff_1S_squad_mem_40 = this;", _unitskill, _unitrank]};




{_x enableattack false} forEach units _HOff_1S_squad;
{dostop _x} foreach units _HOff_1S_squad;



_HOff_1S_squad_members = units _HOff_1S_squad;
HOff_1S_squad_mem_00 setunitpos "Middle"; HOff_1S_squad_mem_00 setPosATL _H_Off_1_pos_00;
HOff_1S_squad_mem_01 setunitpos "Middle"; HOff_1S_squad_mem_01 setPosATL _H_Off_1_pos_01; 
HOff_1S_squad_mem_02 setunitpos "Middle"; HOff_1S_squad_mem_02 setPosATL _H_Off_1_pos_02;
HOff_1S_squad_mem_03 setunitpos "Up"; HOff_1S_squad_mem_03 setPosATL _H_Off_1_pos_03;
HOff_1S_squad_mem_04 setunitpos "Up"; HOff_1S_squad_mem_04 setPosATL _H_Off_1_pos_04; 
HOff_1S_squad_mem_05 setunitpos "Up"; HOff_1S_squad_mem_05 setPosATL _H_Off_1_pos_05;
HOff_1S_squad_mem_06 setunitpos "Up"; HOff_1S_squad_mem_06 setPosATL _H_Off_1_pos_06;
HOff_1S_squad_mem_07 setunitpos "Up"; HOff_1S_squad_mem_07 setPosATL _H_Off_1_pos_07;
HOff_1S_squad_mem_08 setunitpos "Up"; HOff_1S_squad_mem_08 setPosATL _H_Off_1_pos_08;
HOff_1S_squad_mem_09 setunitpos "Middle"; HOff_1S_squad_mem_09 setPosATL _H_Off_1_pos_09; 
HOff_1S_squad_mem_10 setunitpos "Middle"; HOff_1S_squad_mem_10 setPosATL _H_Off_1_pos_10;
HOff_1S_squad_mem_11 setunitpos "Up"; HOff_1S_squad_mem_11 setPosATL _H_Off_1_pos_11;
HOff_1S_squad_mem_12 setunitpos "Up"; HOff_1S_squad_mem_12 setPosATL _H_Off_1_pos_12;
HOff_1S_squad_mem_13 setunitpos "Middle"; HOff_1S_squad_mem_13 setPosATL _H_Off_1_pos_13;
HOff_1S_squad_mem_14 setunitpos "Middle"; HOff_1S_squad_mem_14 setPosATL _H_Off_1_pos_14;
HOff_1S_squad_mem_15 setunitpos "Middle"; HOff_1S_squad_mem_15 setPosATL _H_Off_1_pos_15;
HOff_1S_squad_mem_16 setunitpos "Middle"; HOff_1S_squad_mem_16 setPosATL _H_Off_1_pos_16;
HOff_1S_squad_mem_17 setunitpos "Up"; HOff_1S_squad_mem_17 setPosATL _H_Off_1_pos_17;
HOff_1S_squad_mem_18 setunitpos "Up"; HOff_1S_squad_mem_18 setPosATL _H_Off_1_pos_18;
HOff_1S_squad_mem_19 setunitpos "Up"; HOff_1S_squad_mem_19 setPosATL _H_Off_1_pos_19;
HOff_1S_squad_mem_20 setunitpos "Up"; HOff_1S_squad_mem_20 setPosATL _H_Off_1_pos_20;
HOff_1S_squad_mem_21 setunitpos "Up"; HOff_1S_squad_mem_21 setPosATL _H_Off_1_pos_21;
HOff_1S_squad_mem_22 setunitpos "Up"; HOff_1S_squad_mem_22 setPosATL _H_Off_1_pos_22;
HOff_1S_squad_mem_23 setunitpos "Up"; HOff_1S_squad_mem_23 setPosATL _H_Off_1_pos_23;
HOff_1S_squad_mem_24 setunitpos "Up"; HOff_1S_squad_mem_24 setPosATL _H_Off_1_pos_24;
HOff_1S_squad_mem_25 setunitpos "Up"; HOff_1S_squad_mem_25 setPosATL _H_Off_1_pos_25; 
HOff_1S_squad_mem_26 setunitpos "Up"; HOff_1S_squad_mem_26 setPosATL _H_Off_1_pos_26;
HOff_1S_squad_mem_27 setunitpos "Up"; HOff_1S_squad_mem_27 setPosATL _H_Off_1_pos_27;
HOff_1S_squad_mem_28 setunitpos "Up"; HOff_1S_squad_mem_28 setPosATL _H_Off_1_pos_28; 
HOff_1S_squad_mem_29 setunitpos "Up"; HOff_1S_squad_mem_29 setPosATL _H_Off_1_pos_29;
HOff_1S_squad_mem_30 setunitpos "Up"; HOff_1S_squad_mem_30 setPosATL _H_Off_1_pos_30;
HOff_1S_squad_mem_31 setunitpos "Up"; HOff_1S_squad_mem_31 setPosATL _H_Off_1_pos_31;
HOff_1S_squad_mem_32 setunitpos "Up"; HOff_1S_squad_mem_32 setPosATL _H_Off_1_pos_32;
HOff_1S_squad_mem_33 setunitpos "Middle"; HOff_1S_squad_mem_33 setPosATL _H_Off_1_pos_33; 
HOff_1S_squad_mem_34 setunitpos "Middle"; HOff_1S_squad_mem_34 setPosATL _H_Off_1_pos_34;
HOff_1S_squad_mem_35 setunitpos "Middle"; HOff_1S_squad_mem_35 setPosATL _H_Off_1_pos_35;
HOff_1S_squad_mem_36 setunitpos "Up"; HOff_1S_squad_mem_36 setPosATL _H_Off_1_pos_36;
HOff_1S_squad_mem_37 setunitpos "Middle"; HOff_1S_squad_mem_37 setPosATL _H_Off_1_pos_37;
HOff_1S_squad_mem_38 setunitpos "Middle"; HOff_1S_squad_mem_38 setPosATL _H_Off_1_pos_38;
HOff_1S_squad_mem_39 setunitpos "Middle"; HOff_1S_squad_mem_39 setPosATL _H_Off_1_pos_39;
HOff_1S_squad_mem_40 setunitpos "Middle"; HOff_1S_squad_mem_40 setPosATL _H_Off_1_pos_40;

		};
			_countarr = _countarr + 1;
	} foreach _HOff_1_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for Office Building///-----------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------

///-----------------------
///-----------------------
///-----------------------
///Start Squad for Fire Station///------------------------------
///-----------------------
///-----------------------
///-----------------------
///23 Positions

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_H_FH_1_pos_00 = _x modelToWorld (_firestation_List select 0);
_H_FH_1_pos_01 = _x modelToWorld (_firestation_List select 1);
_H_FH_1_pos_02 = _x modelToWorld (_firestation_List select 2);
_H_FH_1_pos_03 = _x modelToWorld (_firestation_List select 3);
_H_FH_1_pos_04 = _x modelToWorld (_firestation_List select 4);
_H_FH_1_pos_05 = _x modelToWorld (_firestation_List select 5);
_H_FH_1_pos_06 = _x modelToWorld (_firestation_List select 6);
_H_FH_1_pos_07 = _x modelToWorld (_firestation_List select 7);
_H_FH_1_pos_08 = _x modelToWorld (_firestation_List select 8);
_H_FH_1_pos_09 = _x modelToWorld (_firestation_List select 9);
_H_FH_1_pos_10 = _x modelToWorld (_firestation_List select 10);
_H_FH_1_pos_11 = _x modelToWorld (_firestation_List select 11);
_H_FH_1_pos_12 = _x modelToWorld (_firestation_List select 12);
_H_FH_1_pos_13 = _x modelToWorld (_firestation_List select 13);
_H_FH_1_pos_14 = _x modelToWorld (_firestation_List select 14);
_H_FH_1_pos_15 = _x modelToWorld (_firestation_List select 15);
_H_FH_1_pos_16 = _x modelToWorld (_firestation_List select 16);
_H_FH_1_pos_17 = _x modelToWorld (_firestation_List select 17);
_H_FH_1_pos_18 = _x modelToWorld (_firestation_List select 18);
_H_FH_1_pos_19 = _x modelToWorld (_firestation_List select 19);
_H_FH_1_pos_20 = _x modelToWorld (_firestation_List select 20);
_H_FH_1_pos_21 = _x modelToWorld (_firestation_List select 21);
_H_FH_1_pos_22 = _x modelToWorld (_firestation_List select 22);

///Possible Units
_HFH_1_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
_HFH_1_pos01Unit = _atPosPos select (round(random _atPosPosNum)); 
_HFH_1_pos02Unit = _rifPosPos select (round(random _rifPosPosNum));
_HFH_1_pos03Unit = _mgPosPos select (round(random _mgPosPosNum));
_HFH_1_pos04Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_HFH_1_pos05Unit = _mgPosPos select (round(random _mgPosPosNum)); 
_HFH_1_pos06Unit = _rifPosPos select (round(random _rifPosPosNum));
_HFH_1_pos07Unit = _rifPosPos select (round(random _rifPosPosNum));
_HFH_1_pos08Unit = _rifPosPos select (round(random _rifPosPosNum));
_HFH_1_pos09Unit = _mgPosPos select (round(random _mgPosPosNum)); 
_HFH_1_pos10Unit = _mgPosPos select (round(random _mgPosPosNum));
_HFH_1_pos11Unit = _rifPosPos select (round(random _rifPosPosNum));
_HFH_1_pos12Unit = _snipPosPos select (round(random _snipPosPosNum));
_HFH_1_pos13Unit = _snipPosPos select (round(random _snipPosPosNum));
_HFH_1_pos14Unit = _atPosPos select (round(random _atPosPosNum));
_HFH_1_pos15Unit = _atPosPos select (round(random _atPosPosNum));
_HFH_1_pos16Unit = _atPosPos select (round(random _atPosPosNum));
_HFH_1_pos17Unit = _rifPosPos select (round(random _rifPosPosNum));
_HFH_1_pos18Unit = _atPosPos select (round(random _atPosPosNum));
_HFH_1_pos19Unit = _rifPosPos select (round(random _rifPosPosNum));
_HFH_1_pos20Unit = _rifPosPos select (round(random _rifPosPosNum));
_HFH_1_pos21Unit = _mgPosPos select (round(random _mgPosPosNum));
_HFH_1_pos22Unit = _rifPosPos select (round(random _rifPosPosNum));

_HFH_1S_squad = createGroup _factionside; ///Create Group



_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));


if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HFH_1_pos00Unit createUnit [getmarkerpos _initialSpawn, _HFH_1S_squad,"HFH_1S_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_HFH_1_pos01Unit createUnit [getmarkerpos _initialSpawn, _HFH_1S_squad,"HFH_1S_squad_mem_01 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HFH_1_pos02Unit createUnit [getmarkerpos _initialSpawn, _HFH_1S_squad,"HFH_1S_squad_mem_02 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HFH_1_pos03Unit createUnit [getmarkerpos _initialSpawn, _HFH_1S_squad,"HFH_1S_squad_mem_03 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HFH_1_pos04Unit createUnit [getmarkerpos _initialSpawn, _HFH_1S_squad,"HFH_1S_squad_mem_04 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HFH_1_pos05Unit createUnit [getmarkerpos _initialSpawn, _HFH_1S_squad,"HFH_1S_squad_mem_05 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HFH_1_pos06Unit createUnit [getmarkerpos _initialSpawn, _HFH_1S_squad,"HFH_1S_squad_mem_06 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HFH_1_pos07Unit createUnit [getmarkerpos _initialSpawn, _HFH_1S_squad,"HFH_1S_squad_mem_07 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HFH_1_pos08Unit createUnit [getmarkerpos _initialSpawn, _HFH_1S_squad,"HFH_1S_squad_mem_08 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HFH_1_pos09Unit createUnit [getmarkerpos _initialSpawn, _HFH_1S_squad,"HFH_1S_squad_mem_09 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HFH_1_pos10Unit createUnit [getmarkerpos _initialSpawn, _HFH_1S_squad,"HFH_1S_squad_mem_10 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_HFH_1_pos11Unit createUnit [getmarkerpos _initialSpawn, _HFH_1S_squad,"HFH_1S_squad_mem_11 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HFH_1_pos12Unit createUnit [getmarkerpos _initialSpawn, _HFH_1S_squad,"HFH_1S_squad_mem_12 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HFH_1_pos13Unit createUnit [getmarkerpos _initialSpawn, _HFH_1S_squad,"HFH_1S_squad_mem_13 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HFH_1_pos14Unit createUnit [getmarkerpos _initialSpawn, _HFH_1S_squad,"HFH_1S_squad_mem_14 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HFH_1_pos15Unit createUnit [getmarkerpos _initialSpawn, _HFH_1S_squad,"HFH_1S_squad_mem_15 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HFH_1_pos16Unit createUnit [getmarkerpos _initialSpawn, _HFH_1S_squad,"HFH_1S_squad_mem_16 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HFH_1_pos17Unit createUnit [getmarkerpos _initialSpawn, _HFH_1S_squad,"HFH_1S_squad_mem_17 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HFH_1_pos18Unit createUnit [getmarkerpos _initialSpawn, _HFH_1S_squad,"HFH_1S_squad_mem_18 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HFH_1_pos19Unit createUnit [getmarkerpos _initialSpawn, _HFH_1S_squad,"HFH_1S_squad_mem_19 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HFH_1_pos20Unit createUnit [getmarkerpos _initialSpawn, _HFH_1S_squad,"HFH_1S_squad_mem_20 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HFH_1_pos21Unit createUnit [getmarkerpos _initialSpawn, _HFH_1S_squad,"HFH_1S_squad_mem_21 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_HFH_1_pos22Unit createUnit [getmarkerpos _initialSpawn, _HFH_1S_squad,"HFH_1S_squad_mem_22 = this;", _unitskill, _unitrank]};




{_x enableattack false} forEach units _HFH_1S_squad;
{dostop _x} foreach units _HFH_1S_squad;



_HFH_1S_squad_members = units _HFH_1S_squad;
HFH_1S_squad_mem_00 setunitpos "Middle"; HFH_1S_squad_mem_00 setPosATL _H_FH_1_pos_00;
HFH_1S_squad_mem_01 setunitpos "Middle"; HFH_1S_squad_mem_01 setPosATL _H_FH_1_pos_01; 
HFH_1S_squad_mem_02 setunitpos "Up"; HFH_1S_squad_mem_02 setPosATL _H_FH_1_pos_02;
HFH_1S_squad_mem_03 setunitpos "Middle"; HFH_1S_squad_mem_03 setPosATL _H_FH_1_pos_03;
HFH_1S_squad_mem_04 setunitpos "Up"; HFH_1S_squad_mem_04 setPosATL _H_FH_1_pos_04; 
HFH_1S_squad_mem_05 setunitpos "Middle"; HFH_1S_squad_mem_05 setPosATL _H_FH_1_pos_05;
HFH_1S_squad_mem_06 setunitpos "Middle"; HFH_1S_squad_mem_06 setPosATL _H_FH_1_pos_06;
HFH_1S_squad_mem_07 setunitpos "Middle"; HFH_1S_squad_mem_07 setPosATL _H_FH_1_pos_07;
HFH_1S_squad_mem_08 setunitpos "Middle"; HFH_1S_squad_mem_08 setPosATL _H_FH_1_pos_08;
HFH_1S_squad_mem_09 setunitpos "Middle"; HFH_1S_squad_mem_09 setPosATL _H_FH_1_pos_09; 
HFH_1S_squad_mem_10 setunitpos "Middle"; HFH_1S_squad_mem_10 setPosATL _H_FH_1_pos_10;
HFH_1S_squad_mem_11 setunitpos "Middle"; HFH_1S_squad_mem_11 setPosATL _H_FH_1_pos_11;
HFH_1S_squad_mem_12 setunitpos "Middle"; HFH_1S_squad_mem_12 setPosATL _H_FH_1_pos_12;
HFH_1S_squad_mem_13 setunitpos "Middle"; HFH_1S_squad_mem_13 setPosATL _H_FH_1_pos_13;
HFH_1S_squad_mem_14 setunitpos "Middle"; HFH_1S_squad_mem_14 setPosATL _H_FH_1_pos_14;
HFH_1S_squad_mem_15 setunitpos "Middle"; HFH_1S_squad_mem_15 setPosATL _H_FH_1_pos_15;
HFH_1S_squad_mem_16 setunitpos "Middle"; HFH_1S_squad_mem_16 setPosATL _H_FH_1_pos_16;
HFH_1S_squad_mem_17 setunitpos "Middle"; HFH_1S_squad_mem_17 setPosATL _H_FH_1_pos_17;
HFH_1S_squad_mem_18 setunitpos "Middle"; HFH_1S_squad_mem_18 setPosATL _H_FH_1_pos_18;
HFH_1S_squad_mem_19 setunitpos "Middle"; HFH_1S_squad_mem_19 setPosATL _H_FH_1_pos_19;
HFH_1S_squad_mem_20 setunitpos "Up"; HFH_1S_squad_mem_20 setPosATL _H_FH_1_pos_20;
HFH_1S_squad_mem_21 setunitpos "Down"; HFH_1S_squad_mem_21 setPosATL _H_FH_1_pos_21;
HFH_1S_squad_mem_22 setunitpos "Middle"; HFH_1S_squad_mem_22 setPosATL _H_FH_1_pos_22;

		};
			_countarr = _countarr + 1;
	} foreach _HSta_1_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for Fire Station///--------------------------------
///-----------------------
///-----------------------
///-----------------------

//////-----------------------------Squad Divider Line///----------------------------------------


///-----------------------
///-----------------------
///-----------------------
///Start Squad for The Villa  ///-------------------------------
///-----------------------
///-----------------------
///-----------------------
///30 Positions

_countarr = 0;
{if (random 1 <= _percentBuildGar) 
	then {
_Villa_1_pos_00 = _x modelToWorld (_villa_List select 0);
_Villa_1_pos_01 = _x modelToWorld (_villa_List select 1);
_Villa_1_pos_02 = _x modelToWorld (_villa_List select 2);
_Villa_1_pos_03 = _x modelToWorld (_villa_List select 3);
_Villa_1_pos_04 = _x modelToWorld (_villa_List select 4);
_Villa_1_pos_05 = _x modelToWorld (_villa_List select 5);
_Villa_1_pos_06 = _x modelToWorld (_villa_List select 6);
_Villa_1_pos_07 = _x modelToWorld (_villa_List select 7);
_Villa_1_pos_08 = _x modelToWorld (_villa_List select 8);
_Villa_1_pos_09 = _x modelToWorld (_villa_List select 9);
_Villa_1_pos_10 = _x modelToWorld (_villa_List select 10);
_Villa_1_pos_11 = _x modelToWorld (_villa_List select 11);
_Villa_1_pos_12 = _x modelToWorld (_villa_List select 12);
_Villa_1_pos_13 = _x modelToWorld (_villa_List select 13);
_Villa_1_pos_14 = _x modelToWorld (_villa_List select 14);
_Villa_1_pos_15 = _x modelToWorld (_villa_List select 15);
_Villa_1_pos_16 = _x modelToWorld (_villa_List select 16);
_Villa_1_pos_17 = _x modelToWorld (_villa_List select 17);
_Villa_1_pos_18 = _x modelToWorld (_villa_List select 18);
_Villa_1_pos_19 = _x modelToWorld (_villa_List select 19);
_Villa_1_pos_20 = _x modelToWorld (_villa_List select 20);
_Villa_1_pos_21 = _x modelToWorld (_villa_List select 21);
_Villa_1_pos_22 = _x modelToWorld (_villa_List select 22);
_Villa_1_pos_23 = _x modelToWorld (_villa_List select 23);
_Villa_1_pos_24 = _x modelToWorld (_villa_List select 24);
_Villa_1_pos_25 = _x modelToWorld (_villa_List select 25);
_Villa_1_pos_26 = _x modelToWorld (_villa_List select 26);
_Villa_1_pos_27 = _x modelToWorld (_villa_List select 27);
_Villa_1_pos_28 = _x modelToWorld (_villa_List select 28);
_Villa_1_pos_29 = _x modelToWorld (_villa_List select 29);

///Possible Units
_Villa1_pos00Unit = _rifPosPos select (round(random _rifPosPosNum));
_Villa1_pos01Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_Villa1_pos02Unit = _mgPosPos select (round(random _mgPosPosNum));
_Villa1_pos03Unit = _rifPosPos select (round(random _rifPosPosNum));
_Villa1_pos04Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_Villa1_pos05Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_Villa1_pos06Unit = _rifPosPos select (round(random _rifPosPosNum));
_Villa1_pos07Unit = _rifPosPos select (round(random _rifPosPosNum));
_Villa1_pos08Unit = _rifPosPos select (round(random _rifPosPosNum));
_Villa1_pos09Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_Villa1_pos10Unit = _atPosPos select (round(random _atPosPosNum));
_Villa1_pos11Unit = _rifPosPos select (round(random _rifPosPosNum));
_Villa1_pos12Unit = _rifPosPos select (round(random _rifPosPosNum));
_Villa1_pos13Unit = _rifPosPos select (round(random _rifPosPosNum));
_Villa1_pos14Unit = _rifPosPos select (round(random _rifPosPosNum));
_Villa1_pos15Unit = _rifPosPos select (round(random _rifPosPosNum));
_Villa1_pos16Unit = _rifPosPos select (round(random _rifPosPosNum));
_Villa1_pos17Unit = _mgPosPos select (round(random _mgPosPosNum));
_Villa1_pos18Unit = _atPosPos select (round(random _atPosPosNum));
_Villa1_pos19Unit = _atPosPos select (round(random _atPosPosNum));
_Villa1_pos20Unit = _rifPosPos select (round(random _rifPosPosNum));
_Villa1_pos21Unit = _rifPosPos select (round(random _rifPosPosNum));
_Villa1_pos22Unit = _rifPosPos select (round(random _rifPosPosNum));
_Villa1_pos23Unit = _snipPosPos select (round(random _snipPosPosNum));
_Villa1_pos24Unit = _mgPosPos select (round(random _mgPosPosNum));
_Villa1_pos25Unit = _atPosPos select (round(random _atPosPosNum)); 
_Villa1_pos26Unit = _rifPosPos select (round(random _rifPosPosNum));
_Villa1_pos27Unit = _atPosPos select (round(random _atPosPosNum));
_Villa1_pos28Unit = _rifPosPos select (round(random _rifPosPosNum)); 
_Villa1_pos29Unit = _rifPosPos select (round(random _rifPosPosNum)); 

_Villa1S_squad = createGroup _factionside; ///Create Group

_unitskill = _minSkillValue + (random ( _maxSkillValue - _minSkillValue));

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_Villa1_pos00Unit createUnit [getmarkerpos _initialSpawn, _Villa1S_squad,"Villa1S_squad_mem_00 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_Villa1_pos01Unit createUnit [getmarkerpos _initialSpawn, _Villa1S_squad,"Villa1S_squad_mem_01 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_Villa1_pos02Unit createUnit [getmarkerpos _initialSpawn, _Villa1S_squad,"Villa1S_squad_mem_02 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_Villa1_pos03Unit createUnit [getmarkerpos _initialSpawn, _Villa1S_squad,"Villa1S_squad_mem_03 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_Villa1_pos04Unit createUnit [getmarkerpos _initialSpawn, _Villa1S_squad,"Villa1S_squad_mem_04 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_Villa1_pos05Unit createUnit [getmarkerpos _initialSpawn, _Villa1S_squad,"Villa1S_squad_mem_05 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosDoorOnOff == 1) then {_Villa1_pos06Unit createUnit [getmarkerpos _initialSpawn, _Villa1S_squad,"Villa1S_squad_mem_06 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_Villa1_pos07Unit createUnit [getmarkerpos _initialSpawn, _Villa1S_squad,"Villa1S_squad_mem_07 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_Villa1_pos08Unit createUnit [getmarkerpos _initialSpawn, _Villa1S_squad,"Villa1S_squad_mem_08 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_Villa1_pos09Unit createUnit [getmarkerpos _initialSpawn, _Villa1S_squad,"Villa1S_squad_mem_09 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_Villa1_pos10Unit createUnit [getmarkerpos _initialSpawn, _Villa1S_squad,"Villa1S_squad_mem_10 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_Villa1_pos11Unit createUnit [getmarkerpos _initialSpawn, _Villa1S_squad,"Villa1S_squad_mem_11 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_Villa1_pos12Unit createUnit [getmarkerpos _initialSpawn, _Villa1S_squad,"Villa1S_squad_mem_12 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_Villa1_pos13Unit createUnit [getmarkerpos _initialSpawn, _Villa1S_squad,"Villa1S_squad_mem_13 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_Villa1_pos14Unit createUnit [getmarkerpos _initialSpawn, _Villa1S_squad,"Villa1S_squad_mem_14 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_Villa1_pos15Unit createUnit [getmarkerpos _initialSpawn, _Villa1S_squad,"Villa1S_squad_mem_15 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosWindowOnOff == 1) then {_Villa1_pos16Unit createUnit [getmarkerpos _initialSpawn, _Villa1S_squad,"Villa1S_squad_mem_16 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_Villa1_pos17Unit createUnit [getmarkerpos _initialSpawn, _Villa1S_squad,"Villa1S_squad_mem_17 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_Villa1_pos18Unit createUnit [getmarkerpos _initialSpawn, _Villa1S_squad,"Villa1S_squad_mem_18 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_Villa1_pos19Unit createUnit [getmarkerpos _initialSpawn, _Villa1S_squad,"Villa1S_squad_mem_19 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_Villa1_pos20Unit createUnit [getmarkerpos _initialSpawn, _Villa1S_squad,"Villa1S_squad_mem_20 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_Villa1_pos21Unit createUnit [getmarkerpos _initialSpawn, _Villa1S_squad,"Villa1S_squad_mem_21 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_Villa1_pos22Unit createUnit [getmarkerpos _initialSpawn, _Villa1S_squad,"Villa1S_squad_mem_22 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_Villa1_pos23Unit createUnit [getmarkerpos _initialSpawn, _Villa1S_squad,"Villa1S_squad_mem_23 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_Villa1_pos24Unit createUnit [getmarkerpos _initialSpawn, _Villa1S_squad,"Villa1S_squad_mem_24 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_Villa1_pos25Unit createUnit [getmarkerpos _initialSpawn, _Villa1S_squad,"Villa1S_squad_mem_25 = this;", _unitskill, _unitrank]};  

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_Villa1_pos26Unit createUnit [getmarkerpos _initialSpawn, _Villa1S_squad,"Villa1S_squad_mem_26 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_Villa1_pos27Unit createUnit [getmarkerpos _initialSpawn, _Villa1S_squad,"Villa1S_squad_mem_27 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_Villa1_pos28Unit createUnit [getmarkerpos _initialSpawn, _Villa1S_squad,"Villa1S_squad_mem_28 = this;", _unitskill, _unitrank]};

if (random 1 <= _percentPosGar && _PosRoofOnOff == 1) then {_Villa1_pos29Unit createUnit [getmarkerpos _initialSpawn, _Villa1S_squad,"Villa1S_squad_mem_29 = this;", _unitskill, _unitrank]};




{_x enableattack false} forEach units _Villa1S_squad;
{dostop _x} foreach units _Villa1S_squad;



_Villa1S_squad_members = units _Villa1S_squad;
Villa1S_squad_mem_00 setunitpos "Middle"; Villa1S_squad_mem_00 setPosATL _Villa_1_pos_00;
Villa1S_squad_mem_01 setunitpos "Middle"; Villa1S_squad_mem_01 setPosATL _Villa_1_pos_01; 
Villa1S_squad_mem_02 setunitpos "Middle"; Villa1S_squad_mem_02 setPosATL _Villa_1_pos_02;
Villa1S_squad_mem_03 setunitpos "Middle"; Villa1S_squad_mem_03 setPosATL _Villa_1_pos_03;
Villa1S_squad_mem_04 setunitpos "Middle"; Villa1S_squad_mem_04 setPosATL _Villa_1_pos_04; 
Villa1S_squad_mem_05 setunitpos "Middle"; Villa1S_squad_mem_05 setPosATL _Villa_1_pos_05;
Villa1S_squad_mem_06 setunitpos "Middle"; Villa1S_squad_mem_06 setPosATL _Villa_1_pos_06;
Villa1S_squad_mem_07 setunitpos "Middle"; Villa1S_squad_mem_07 setPosATL _Villa_1_pos_07;
Villa1S_squad_mem_08 setunitpos "Up"; Villa1S_squad_mem_08 setPosATL _Villa_1_pos_08;
Villa1S_squad_mem_09 setunitpos "Up"; Villa1S_squad_mem_09 setPosATL _Villa_1_pos_09; 
Villa1S_squad_mem_10 setunitpos "Middle"; Villa1S_squad_mem_10 setPosATL _Villa_1_pos_10;
Villa1S_squad_mem_11 setunitpos "Up"; Villa1S_squad_mem_11 setPosATL _Villa_1_pos_11;
Villa1S_squad_mem_12 setunitpos "Up"; Villa1S_squad_mem_12 setPosATL _Villa_1_pos_12;
Villa1S_squad_mem_13 setunitpos "Up"; Villa1S_squad_mem_13 setPosATL _Villa_1_pos_13;
Villa1S_squad_mem_14 setunitpos "Up"; Villa1S_squad_mem_14 setPosATL _Villa_1_pos_14;
Villa1S_squad_mem_15 setunitpos "Up"; Villa1S_squad_mem_15 setPosATL _Villa_1_pos_15;
Villa1S_squad_mem_16 setunitpos "Up"; Villa1S_squad_mem_16 setPosATL _Villa_1_pos_16;
Villa1S_squad_mem_17 setunitpos "Middle"; Villa1S_squad_mem_17 setPosATL _Villa_1_pos_17;
Villa1S_squad_mem_18 setunitpos "Middle"; Villa1S_squad_mem_18 setPosATL _Villa_1_pos_18;
Villa1S_squad_mem_19 setunitpos "Middle"; Villa1S_squad_mem_19 setPosATL _Villa_1_pos_19;
Villa1S_squad_mem_20 setunitpos "Middle"; Villa1S_squad_mem_20 setPosATL _Villa_1_pos_20;
Villa1S_squad_mem_21 setunitpos "Middle"; Villa1S_squad_mem_21 setPosATL _Villa_1_pos_21;
Villa1S_squad_mem_22 setunitpos "Middle"; Villa1S_squad_mem_22 setPosATL _Villa_1_pos_22;
Villa1S_squad_mem_23 setunitpos "Middle"; Villa1S_squad_mem_23 setPosATL _Villa_1_pos_23;
Villa1S_squad_mem_24 setunitpos "Middle"; Villa1S_squad_mem_24 setPosATL _Villa_1_pos_24;
Villa1S_squad_mem_25 setunitpos "Middle"; Villa1S_squad_mem_25 setPosATL _Villa_1_pos_25; 
Villa1S_squad_mem_26 setunitpos "Middle"; Villa1S_squad_mem_26 setPosATL _Villa_1_pos_26;
Villa1S_squad_mem_27 setunitpos "Middle"; Villa1S_squad_mem_27 setPosATL _Villa_1_pos_27;
Villa1S_squad_mem_28 setunitpos "Middle"; Villa1S_squad_mem_28 setPosATL _Villa_1_pos_28; 
Villa1S_squad_mem_29 setunitpos "Up"; Villa1S_squad_mem_29 setPosATL _Villa_1_pos_29;

		};
			_countarr = _countarr + 1;
	} foreach _HVil_1_list;
///-----------------------
///-----------------------
///-----------------------
///End of Squad for BUILDING WIP///--------------------------------
///-----------------------
///-----------------------
///-----------------------

/*
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------		
			END OF SQUAD LIBRARY
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/


