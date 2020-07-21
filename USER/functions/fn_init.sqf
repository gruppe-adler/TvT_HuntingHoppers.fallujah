if (!isServer) exitWith {};


private _bombSpots = missionNamespace getVariable ["hoppers_bombSpots", []];

{
    private _spot = _x;

    [_spot] remoteExecCall ["hoppers_fnc_addBombTrigger", east, true];
} forEach _bombSpots;
