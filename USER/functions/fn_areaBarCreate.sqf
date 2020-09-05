disableSerialization;

HOPPERS_MAX_DISTANCE_BOSS = ["HOPPERS_MAX_DISTANCE_BOSS", 200] call BIS_fnc_getParamValue;

private _backGroundBar = findDisplay 46 ctrlCreate ["RscText",-1];
_backGroundBar ctrlSetPosition [
    safeZoneX+safeZoneW/40,
    safezoneY + safeZoneH-safeZoneH/20,
    safeZoneW/40*2,
    safeZoneH/200
];
_backGroundBar ctrlSetBackgroundColor [0.44,0.44,0.44,1];
_backGroundBar ctrlCommit 0;

private _progressBar = findDisplay 46 ctrlCreate ["RscProgress",-1];
_progressBar ctrlSetPosition [
	safeZoneX+safeZoneW/40,
	safezoneY + safeZoneH-safeZoneH/20,
	safeZoneW/40*2,
	safeZoneH/200
];
_progressBar ctrlSetTextColor [0.44,0.66,0.44,1];
_progressBar progressSetPosition 0;
_progressBar ctrlCommit 0;

private _text = findDisplay 46 ctrlCreate ["RscText",-1];
_text ctrlSetPosition [
    safeZoneX+safeZoneW/40+safeZoneW/40*2,
    safezoneY + safeZoneH-safeZoneH/20+safeZoneH/50,
    safeZoneW/40*2,
    safeZoneH/100
];
_text ctrlSetFontHeight 0.035;
_text ctrlCommit 0;


[_backGroundBar, _progressBar, _text]
