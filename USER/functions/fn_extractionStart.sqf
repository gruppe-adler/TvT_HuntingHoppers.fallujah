
private _exfilPositions = [
  getMarkerPos "mrk_exfiltrate_1",
  getMarkerPos "mrk_exfiltrate_2",
  getMarkerPos "mrk_exfiltrate_3",
  getMarkerPos "mrk_exfiltrate_4"
];

missionNamespace setVariable ["hoppers_exfilPositions", _exfilPositions, true];


{
  private _exfilPosition = _x;
  private _taskID = format ["Exfiltrate_%1", _exfilPosition];
  [
    east,
    [_taskID],
    ["Boss has to be within 100m of exfil point to win for Opfor.",
    "Flee",
    ""],
    _exfilPosition,
    true,
    -1,
    false
  ] call BIS_fnc_taskCreate;
} forEach _exfilPositions;

private _phase = missionNamespace getVariable ["hoppers_missionPhase", 0];
private _taskID = format ["Hoppers_Bomb%1", _phase];
[_taskID, "CANCELED"] call BIS_fnc_taskSetState;

["hoppers_phaseChange", [9999]] call CBA_fnc_globalEvent;

missionNamespace setVariable ["hoppers_missionPhase", 9999, true];