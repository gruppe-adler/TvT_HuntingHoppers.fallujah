HOPPERS_CIVILIANS_PENALTY_CHANCE_WEST = 0;
HOPPERS_CIVILIANS_PENALTY_CHANCE_EAST = 0;

// add civilian penalty system
["grad_civs_civKilled", {
    params ["_position", "_killer"];

    if (side _killer == east) then {
        HOPPERS_CIVILIANS_PENALTY_CHANCE_EAST = HOPPERS_CIVILIANS_PENALTY_CHANCE_EAST + 0.1;
    };

    if (side _killer == west) then {
        HOPPERS_CIVILIANS_PENALTY_CHANCE_WEST = HOPPERS_CIVILIANS_PENALTY_CHANCE_WEST + 0.1;
    };

    /*
    if ((random 1 > HOPPERS_CIVILIANS_PENALTY_CHANCE_EAST) || 
        (random 1 > HOPPERS_CIVILIANS_PENALTY_CHANCE_WEST)) then {

        [_civ] call hoppers_fnc_civilianAddWeapon;
    };
    */
}] call CBA_fnc_addEventHandler;


["grad_civs_vehicleTheft", {
    params ["_vehicle", "_player"];

    if (side _player == east) then {
        HOPPERS_CIVILIANS_PENALTY_CHANCE_EAST = HOPPERS_CIVILIANS_PENALTY_CHANCE_EAST + 0.05;
    };

    if (side _player == west) then {
        HOPPERS_CIVILIANS_PENALTY_CHANCE_WEST = HOPPERS_CIVILIANS_PENALTY_CHANCE_WEST + 0.05;
    };

}] call CBA_fnc_addEventHandler;



[{
    params ["_args", "_handle"];

    if (HOPPERS_CIVILIANS_PENALTY_CHANCE_EAST > 0.5 && east getFriend civilian > 0) then {
        civilian setFriend [east, 0];
        east setFriend [civilian, 0];

        ["hoppers_civEnemy", [east]] call CBA_fnc_globalEvent;
    };

    if (HOPPERS_CIVILIANS_PENALTY_CHANCE_WEST > 0.5 && west getFriend civilian > 0) then {
        civilian setFriend [west, 0];
        west setFriend [civilian, 0];

        ["hoppers_civEnemy", [west]] call CBA_fnc_globalEvent;
    };

    if (east getFriend civilian == 0 && east getFriend civilian == 0) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

}, 5, []] call CBA_fnc_addPerFrameHandler;


["hoppers_civEnemy", {
    params ["_side"];

    {
        if (side _x == civilian) then {
            grad_civs_legacy_exiton = { true };
            // [_x] call grad_civs_fnc_dismissCiv;

            [group _x, getPos _x, 500] call BIS_fnc_taskPatrol;
        };
    } forEach allUnits;
}] call CBA_fnc_addEventHandler;
