if (!isServer) exitWith {};


private _bombSpots = missionNamespace getVariable ["hoppers_bombSpots", []];

{
    private _bombSpot = _x;

    [_bombSpot] remoteExecCall ["hoppers_fnc_addBombTrigger", east, true];

    private _taskID = format ["Hoppers_Bomb%1", _forEachIndex];
    [
      east,
      [_taskID],
      ["Trigger bomb and get out of its explosion radius. This will alert the enemy and improve his intel.",
      "Detonate Bomb",
      ""],
      getPos _object,
      true,
      -1,
      false
    ] call BIS_fnc_taskCreate;

    _bombSpot setVariable ["hoppers_spotNumber", _forEachIndex];
} forEach _bombSpots;


private _taskID = "Eliminate";
[
  west,
  [_taskID],
  ["Eliminate Insurgent Leader who triggers the bombs. You will get intel about his position on the map.",
  "Eliminate Insurgent Leader",
  ""],
  objNull,
  true,
  -1,
  false
] call BIS_fnc_taskCreate;
