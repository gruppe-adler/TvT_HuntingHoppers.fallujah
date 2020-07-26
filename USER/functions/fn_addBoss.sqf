/*

  add to init of object

  [this] call hoppers_fnc_addBoss;

*/


params ["_unit"];

if (!isServer) exitWith {};

private _bosses = missionNamespace getVariable ["hoppers_bosses", []];

_bosses pushBackUnique _unit;
missionNamespace setVariable ["hoppers_bosses", _bosses, true];
