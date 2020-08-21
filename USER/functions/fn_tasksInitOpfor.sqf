params ["_position", "_bombspot"];

[
  east,
  [_bombspot],
  ["Trigger bomb in bomb area and get out of its explosion radius. This will reset the marker size.",
  "Detonate Bomb",
  ""],
  _position,
  true,
  -1,
  false
] call BIS_fnc_taskCreate;