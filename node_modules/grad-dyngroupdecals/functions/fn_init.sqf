if (!isServer) exitWith {};

GRAD_DYNGROUPDECALS_INSIGNIA_COLOR = "wht";

// blu, yel

["GRAD_dynGroups_registerGroup", {
    params ["_group", "_name"];

    private _vehicles = [];

    {
        if (objectParent _x != _x) then {
          if (!isNull driver (objectParent _x)) then {
            _vehicles pushBackUnique (driver _x);
          };
        };
    } forEach units _group;

    {
        [_x] call GRAD_dynGroupDecals_fnc_refreshDecals;
    } forEach _vehicles;

}] call CBA_fnc_addEventhandler;

{
    _x addEventHandler ["GetInMan", {
        params ["_unit", "_role", "_vehicle", "_turret"];

        if (_role == "driver") then {
          {
            [_unit] call GRAD_dynGroupDecals_fnc_refreshDecals;
          };
        };
    }];

} forEach playableUnits + switchableUnits;

{
    _x addEventHandler ["SeatSwitched", {
        params ["_unit"];

        if (!isNull driver (objectParent _x)) then {
            [driver _x] call GRAD_dynGroupDecals_fnc_refreshDecals;
        };
    }];

} forEach playableUnits + switchableUnits;
