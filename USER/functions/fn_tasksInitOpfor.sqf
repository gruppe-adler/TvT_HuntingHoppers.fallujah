params ["_position", "_bombspot"];

[
  east,
  _bombspot,
  ["Trigger bomb in bomb area and get out of its explosion radius.",
  "Detonate Bomb",
  ""],
  _position,
  true,
  -1,
  false
] call BIS_fnc_taskCreate;