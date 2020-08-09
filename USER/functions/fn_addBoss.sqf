/*

  add to init of object

  [this] call hoppers_fnc_addBoss;

*/


params ["_unit"];

if (!isServer) exitWith {};

private _bosses = missionNamespace getVariable ["hoppers_bosses", []];

_bosses pushBackUnique _unit;
missionNamespace setVariable ["hoppers_bosses", _bosses, true];

_unit setVariable ["hoppers_isBoss", true, true];
_unit setVariable ["hoppers_markerShown",true, true];

[_unit] call hoppers_fnc_createMarker;
[_unit] remoteExecCall ["hoppers_fnc_addBombTrigger", _unit, true];