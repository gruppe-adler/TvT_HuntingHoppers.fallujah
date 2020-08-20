params ["_bomb"];

private _boss = _bomb getVariable ["hoppers_countdownBoss", objNull];
_boss setVariable ["hoppers_countdownStarted", false, true];
_bomb setVariable ["hoppers_countdownStarted", false, true];

deleteVehicle _bomb;