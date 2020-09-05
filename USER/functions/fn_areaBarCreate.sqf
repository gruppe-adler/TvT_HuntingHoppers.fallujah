disableSerialization;

private _backGroundBar = findDisplay 46 ctrlCreate ["RscProgress",-1];
_backGroundBar ctrlSetPosition [
    safeZoneX+safeZoneW/40,
    safezoneY + safeZoneH-safeZoneH/20,
    safeZoneW/40*10,
    safeZoneH/200
];
_backGroundBar ctrlSetTextColor [0.44,0.44,0.44,1];
_backGroundBar progressSetPosition 1;
_backGroundBar ctrlCommit 0;

private _progressBar = findDisplay 46 ctrlCreate ["RscProgress",-1];
_progressBar ctrlSetPosition [
	safeZoneX+safeZoneW/40,
	safezoneY + safeZoneH-safeZoneH/20,
	safeZoneW/40*10,
	safeZoneH/200
];
_progressBar ctrlSetTextColor [0.44,0.66,0.44,1];
_progressBar progressSetPosition 0;
_progressBar ctrlCommit 0;




_progressBar
