///////////////////--Basic--///////////////////        -----> https://community.bistudio.com/wiki/enableSaving
enableSaving [false, false];

/////--Intro--/////
if (hasInterface) then {
	private ["_cam","_camx","_camy","_camz","_object"];
	
	titleText ["Mission by Lars", "BLACK IN",9999];
	
	waituntil {!(isnull player)};
	sleep 2;
    
    atcTower = nearestObject [getMarkerPos "tower", "Land_Mil_ControlTower_EP1"];

	_object = YellowCake;
	_camx = getposATL _object select 0;
	_camy = getposATL _object select 1;
	_camz = getposATL _object select 2;
	
	_cam = "camera" CamCreate [_camx + 500 ,_camy -100, _camz + 50];
	
	_cam CamSetTarget _object;
	_cam CameraEffect ["Internal","Back"];
	_cam CamCommit 0;
	
	_cam camsetpos [_camx +100 ,_camy +100 ,_camz+30];
	_cam CamCommit 2;
    
	_object = atcTower;
    
    _cam CamSetTarget _object;
	_cam CameraEffect ["Internal","Back"];
	_cam CamCommit 0;
    
	_camx = getposATL _object select 0;
	_camy = getposATL _object select 1;
	_camz = getposATL _object select 2;
	
	_cam camsetpos [_camx +100 ,_camy +100 ,_camz+10];
	_cam CamCommit 10;
    
	sleep 2;
	
	titleText ["O P E R A T I O N   K O S H E R   B A C O N", "BLACK IN",10];
		
	sleep 8;
			
	_cam CameraEffect ["Terminate","Back"];
	CamDestroy _cam;
    
    
};

if(isServer) then 
{	
    setTimeMultiplier 10;
};

[true,60,false,true,15,3] execVM "WerthlesHeadless.sqf";
//call compile preprocessFile "ACEAIRevive\config.sqf";
//player call btc_qr_fnc_unit_init;