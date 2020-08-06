disableSerialization;
private _progressBar = findDisplay 46 ctrlCreate ["RscProgress",-1];
_progressBar ctrlSetPosition [
	safeZoneX+safeZoneW/40,
	safezoneY + safeZoneH-safeZoneH/20,
	safeZoneW/40*37,
	safeZoneH/100
];
_progressBar ctrlSetTextColor [0.44,0.66,0.44,1];
_progressBar progressSetPosition 0;
_progressBar ctrlCommit 0;

_progressBar
