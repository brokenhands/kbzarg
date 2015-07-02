///////////////////--Basic--///////////////////        -----> https://community.bistudio.com/wiki/enableSaving
enableSaving [false, false];

/////--Intro--/////
if (hasInterface) then {
	private ["_cam","_camx","_camy","_camz","_object"];
	
	titleText ["Mission by Lars", "BLACK IN",9999];
	
	waituntil {!(isnull player)};
	sleep 2;
    
    atcTower = nearestObject [getMarkerPos "tower", "Land_Mil_ControlTower_EP1"];
	_object = atcTower;

	_camx = getposATL _object select 0;
	_camy = getposATL _object select 1;
	_camz = getposATL _object select 2;
	
	_cam = "camera" CamCreate [_camx - 1700 ,_camy +500, _camz + 100];
	
	_cam CamSetTarget _object;
	_cam CameraEffect ["Internal","Back"];
	_cam CamCommit 0;

	titleText ["O P E R A T I O N   K O S H E R   B A C O N", "BLACK IN",10];	
	
	_cam camsetpos [_camx -100 ,_camy +100 ,_camz+50];
	_cam CamCommit 8;

	sleep 3;
    ["Destroy","ATC","Tower"] spawn BIS_fnc_infoText;  
    sleep 5;
   	_object = enemyComms;
 
    _cam CamSetTarget _object;
	_cam CamCommit 2;
 
    sleep 2;
    
	_camx = getposATL _object select 0;
	_camy = getposATL _object select 1;
	_camz = getposATL _object select 2;
	
	_cam camsetpos [_camx +300 ,_camy -230 ,_camz+200];
	_cam CamCommit 5;
    	
	sleep 3;
    ["Recover","missing","uranium"] spawn BIS_fnc_infoText;  
    sleep 5;
    
	_cam CameraEffect ["Terminate","Back"];
	CamDestroy _cam;
    
    
};

if(isServer) then 
{	
    setTimeMultiplier 10;

    ["wakeId", "onPlayerConnected", {
        if (({isPlayer _x} count playableUnits) > 0 || OPCOM_TOGGLE) then { ["ALIVE_MIL_OPCOM"] call ALiVE_fnc_unPauseModule; OPCOM_TOGGLE = false; };
    }] call BIS_fnc_addStackedEventHandler;

    ["sleeperId", "onPlayerDisconnected", {
        if ( ({isPlayer _x} count playableUnits) == 0 ) then { ["ALIVE_MIL_OPCOM"] call ALiVE_fnc_pauseModule; OPCOM_TOGGLE = true; };
    }] call BIS_fnc_addStackedEventHandler;    
};

[true,60,false,true,15,3] execVM "WerthlesHeadless.sqf";
//call compile preprocessFile "ACEAIRevive\config.sqf";
//player call btc_qr_fnc_unit_init;
