params ["_unit"];

player setVariable ["hoppers_lastPing", CBA_missionTime];
_unit setVariable ["hoppers_bossMarked", true]; // cant mark twice

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
        _unit setVariable ["hoppers_bossMarked", false];
    };

}, [_unit, _timeStamp], HOPPERS_BOSS_MARKING_FADEOUT] call CBA_fnc_waitAndExecute;


[_unit, west, HOPPERS_BOSS_MARKING_FADEOUT, _timeStamp] remoteExec ["hoppers_fnc_melbMarkLocal", west];
