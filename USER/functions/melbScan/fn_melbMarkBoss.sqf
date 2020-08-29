params ["_unit"];

_unit setVariable ["hoppers_lastPing", CBA_missionTime];

// add to 3d handler list
private _nearEntities = player getVariable ["hoppers_drawEntities", []];
_nearEntities pushBackUnique _unit;
player setVariable ["hoppers_drawEntities", _nearEntities];

playSound "Hint3";

private _timeStamp = CBA_missionTime;
player setVariable ["hoppers_fadeMarkerStart", _timeStamp];

[{
    params ["_unit", "_timeStamp"];

    if (player getVariable ["hoppers_fadeMarkerStart", 0] > _timeStamp) then {
        diag_log format ["removing already running 3d icon for new one"];
    } else {
        private _nearEntities = player getVariable ["hoppers_drawEntities", []];
        _nearEntities deleteAt (_nearEntities find _unit);
        player setVariable ["hoppers_drawEntities", _nearEntities];
    };

}, [_unit, _timeStamp], HOPPERS_BOSS_MARKING_FADEOUT] call CBA_fnc_waitAndExecute;

if (_unit == missionNamespace getVariable ["hoppers_boss", objNull]) then {
    [_unit,0.5,1,0,0,{
        params ["_unit","_target","_updateInterval"];
        private _reception = 1 - (_unit distance2D _target)/2000;
        _reception
    },5,false] remoteExec ["grad_gpsTracker_fnc_openTitle", west];
};