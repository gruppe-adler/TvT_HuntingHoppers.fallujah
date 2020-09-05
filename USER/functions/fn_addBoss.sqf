/*

  add to init of object

  [this] call hoppers_fnc_addBoss;

*/


params ["_unit"];

if (!isServer) exitWith {};

missionNamespace setVariable ["hoppers_boss", _unit, true];

_unit setVariable ["hoppers_isBoss", true, true];

// [_unit] call hoppers_fnc_createMarker;
[_unit] remoteExecCall ["hoppers_fnc_addBombTrigger", _unit, true];