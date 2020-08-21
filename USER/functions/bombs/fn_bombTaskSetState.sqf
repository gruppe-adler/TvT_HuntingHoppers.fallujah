params ["_bombspot", "_side", "_state"];

private _bombSpot = format ["%1_%2", _side, _bombSpot];

[_bombSpot, _state] call BIS_fnc_taskSetState;