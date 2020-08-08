params ["_index", "_object"];

private _taskID = format ["Hoppers_Bomb%1", _index];
[
  east,
  [_taskID],
  ["Trigger bomb and get out of its explosion radius. This will reset the marker size.",
  "Detonate Bomb",
  ""],
  getPos _object,
  true,
  -1,
  false
] call BIS_fnc_taskCreate;
