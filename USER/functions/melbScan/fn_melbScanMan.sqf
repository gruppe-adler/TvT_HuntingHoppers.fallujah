params ["_position"];

private _targets = nearestObjects [_position, ["Man", "Car"], 200];

{
    if (side _x == east) then {
        [_x, false] call hoppers_fnc_melbMarkBoss;
    };
} forEach _targets;