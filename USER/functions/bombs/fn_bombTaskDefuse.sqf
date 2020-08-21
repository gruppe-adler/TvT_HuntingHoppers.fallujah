params ["_position", "_side", "_bombspot"];

private _bombSpot = format ["%1_%2", _side, _bombSpot];

[
  _side,
  _bombspot,
  [("Defuse the bomb before it detonates in " + (str HOPPERS_BOMBS_TIME_TO_EXPLOSION) + " s"),
  "Defuse Bomb",
  ""],
  _position,
  "ASSIGNED",
  1,
  true,
  "",
  true
] call BIS_fnc_taskCreate;