params ["_position"];

private _locked = false;
private _targets = nearestObjects [_position, ["Man", "Car"], 200];
{
    if (side _x == east) then {
        [_x] call hoppers_fnc_melbMarkBoss;
        _locked = true;
        
    };
} forEach _targets;

if (_locked) then {
    playSound "ace_javelin_locked";
} else {
    playSound "ace_javelin_locking";
};