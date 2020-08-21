params ["_side", "_bombspot", "_state"];

private _bombSpot = format ["%1_%2", _side, _bombSpot];

[_bombSpot, _state] call BIS_fnc_taskSetState;