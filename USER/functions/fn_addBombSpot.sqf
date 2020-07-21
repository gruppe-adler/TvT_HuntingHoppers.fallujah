/*

  add to init of object

  [this] call hoppers_fnc_addBombSpot;

*/

params ["_object"];

if (!isServer) exitWith {};

private _bombSpots = missionNamespace getVariable ["hoppers_bombSpots", []];

_bombSpots pushBackUnique _object;
missionNamespace setVariable ["hoppers_bombSpots", _bombSpots, true];
