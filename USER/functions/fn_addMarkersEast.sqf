{
    if (side _x == east && !(_x getVariable ["hoppers_isBoss", false])) then {
        [_x] call hoppers_fnc_createMarker;
    };
} forEach (playableUnits + switchableUnits);
