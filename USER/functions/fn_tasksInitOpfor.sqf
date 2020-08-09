params ["_index"];

private _taskID = format ["Hoppers_Bomb%1", _index];
[
  east,
  [_taskID],
  ["Trigger bomb in bomb area and get out of its explosion radius. This will reset the marker size.",
  "Detonate Bomb",
  ""],
  getMarkerPos "mrk_bombArea",
  true,
  -1,
  false
] call BIS_fnc_taskCreate;
