params ["_unit"];

player setVariable ["hoppers_lastPing", CBA_missionTime];

_unit setVariable ["hoppers_bossMarked", true];

private _nearEntities = player getVariable ["hoppers_drawEntities", []];

_nearEntities pushBackUnique _unit;

player setVariable ["hoppers_drawEntities", _nearEntities];


[{
    params ["_unit"];

    private _nearEntities = player getVariable ["hoppers_drawEntities", []];
    _nearEntities deleteAt (_nearEntities find _unit);
    player setVariable ["hoppers_drawEntities", _nearEntities];
    _unit setVariable ["hoppers_bossMarked", false];

}, [_unit], 20] call CBA_fnc_waitAndExecute;