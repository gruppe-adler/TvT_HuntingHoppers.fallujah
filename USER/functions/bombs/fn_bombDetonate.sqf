params ["_bomb"];

private _bombspot = _bomb getVariable ["hoppers_bombBombspot", ""];
private _markers = _bomb getVariable ["hoppers_bombMarkers", []];
private _position = getPos _bomb;
private _boss = _bomb getVariable ["hoppers_countdownBoss", objNull];

_markers params ["_centerMarker", "_bombMarker", "_bombMarkerFill"];
_centerMarker setMarkerColor "ColorBlack";
deleteMarker _bombMarker;
deleteMarker _bombMarkerFill;

[_bombspot, west, "FAILED"] call hoppers_fnc_bombTaskSetState;
[_bombspot, east, "SUCCEEDED"] call hoppers_fnc_bombTaskSetState;

private _explosion = "Bo_GBU12_LGB" createVehicle _position;
_explosion setDamage 1;

// systemChat ("_bombspot : " + str _bombspot);

remoteExecCall ["grad_waverespawn_fnc_respawnManual", west];
remoteExecCall ["grad_waverespawn_fnc_respawnManual", east];

_boss setVariable ["hoppers_countdownStarted", false, true];
_bomb setVariable ["hoppers_countdownStarted", false, true];

// create ruins
private _housesNearBy = ((_position nearObjects ["House", 50]) + (_position nearObjects ["BUILDING", 50]));
{
    _x setDamage [1, false];
} forEach _housesNearBy;

missionNamespace setVariable ["hoppers_lastPhaseTime", CBA_missionTime, true];

diag_log format ["resetting lastPhaseTime %1", CBA_missionTime];

deleteVehicle _bomb;