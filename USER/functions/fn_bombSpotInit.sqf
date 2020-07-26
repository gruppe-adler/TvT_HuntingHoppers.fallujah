private _bombSpots = missionNamespace getVariable ["hoppers_bombSpots", []];

{
    private _bombSpot = _x;

    [_bombSpot] remoteExecCall ["hoppers_fnc_addBombTrigger", east, true];

    private _taskID = format ["Hoppers_Bomb%1", _forEachIndex];


    [getPos _bombSpot, HOPPERS_REPLACE_BUILDINGS_RADIUS] call hoppers_fnc_mapreplaceBuildings;
    [getPos _bombSpot, HOPPERS_REPLACE_PLANTS_RADIUS] call hoppers_fnc_mapreplacePlants;

    [_forEachIndex, _bombSpot] call hoppers_fnc_tasksInitOpfor;

    _bombSpot setVariable ["hoppers_spotNumber", _forEachIndex];
} forEach _bombSpots;
