params ["_unit"];

player setVariable ["hoppers_lastPing", CBA_missionTime];
_unit setVariable ["hoppers_bossMarked", true]; // cant mark twice

// add to 3d handler list
private _nearEntities = player getVariable ["hoppers_drawEntities", []];
_nearEntities pushBackUnique _unit;
player setVariable ["hoppers_drawEntities", _nearEntities];


[{
    params ["_unit"];

    private _nearEntities = player getVariable ["hoppers_drawEntities", []];
    _nearEntities deleteAt (_nearEntities find _unit);
    player setVariable ["hoppers_drawEntities", _nearEntities];
    _unit setVariable ["hoppers_bossMarked", false];

}, [_unit], HOPPERS_BOSS_MARKING_FADEOUT] call CBA_fnc_waitAndExecute;


[_unit, east, HOPPERS_BOSS_MARKING_FADEOUT] remoteExec ["hoppers_fnc_melbMarkLocal", east];
