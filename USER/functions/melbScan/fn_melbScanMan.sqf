params ["_position"];

private _targets = nearestObjects [_position, ["Man", "Car"], 200];

private _boss = objNull;

{
  if (_x getVariable ["hoppers_isBoss", false]) then {
        _boss = _x;
  };
} forEach _targets;


if (!isNull _boss && !(_boss getVariable ["hoppers_bossMarked", false])) then {
    [_boss] call hoppers_fnc_melbMarkBoss;
};