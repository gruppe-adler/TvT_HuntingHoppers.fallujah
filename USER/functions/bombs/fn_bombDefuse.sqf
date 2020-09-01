params ["_bomb"];

systemChat str _bomb;
private _boss = _bomb getVariable ["hoppers_countdownBoss", objNull];
_boss setVariable ["hoppers_countdownStarted", false, true];
_bomb setVariable ["hoppers_countdownStarted", false, true];

private _bombspot = _bomb getVariable ["hoppers_bombBombspot", ""];
[_bombspot, west, "SUCCEEDED"] call hoppers_fnc_bombTaskSetState;
[_bombspot, east, "FAILED"] call hoppers_fnc_bombTaskSetState;

HOPPERS_BOMBS_BOMBSPOTS deleteAt (HOPPERS_BOMBS_BOMBSPOTS find _bombspot);

remoteExecCall ["grad_waverespawn_fnc_respawnManual", west];

deleteVehicle _bomb;