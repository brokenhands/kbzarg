//titleText ["Called ACEAIRevive ", "BLACK IN",10];
if (!local _this) exitWith {[_this, "btc_qr_fnc_unit_init", _this] call BIS_fnc_MP;};

if (isNil "btc_qr_ready") then {call compile preprocessFile "ACEAIRevive\config.sqf";};

if (_this getVariable ["btc_qr_initialized",false]) exitWith {};



_n = getNumber (configFile >> "cfgVehicles" >> typeOf _this >> "side");

_side = "";

switch (_n) do
{
	case 0 : {_side = east};
	case 1 : {_side = west};
	case 2 : {_side = resistance};
	case 3 : {_side = civilian};
};

_this setVariable ["btc_qr_side",_side];

//_this addEventHandler ["HandleDamage", btc_qr_fnc_hd];

_this setVariable ["btc_qr_initialized",true];

//titleText ["Finished ACEAIRevive ", "BLACK IN",10];

while {true} do {
    sleep 20;
    if (player getvariable ["ACE_isUnconscious", false]) then {
        [player] call btc_qr_fnc_call_for_help;
    }
};
