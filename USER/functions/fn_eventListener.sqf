

["hoppers_phaseChange", {
  params ["_newPhase", "_bombSpot"];

  if (hasInterface) then {
    [
      "Bomb attack " + (str _newPhase) + " detected! Intel for Blufor improved.",
      2,
      5, // duration
      [side player, false] call BIS_fnc_sideColor, // color
      true // outline
    ] spawn BIS_fnc_WLSmoothText; // no sounds, letters appear in a smooth transition
  };

  if (isServer) then {

      private _spotNumber = _bombSpot getVariable ["hoppers_spotNumber", -1];
      private _taskID = format ["Hoppers_Bomb%1", _spotNumber];

      [_taskID,"SUCCEEDED"] call BIS_fnc_taskSetState;

      private _exfilPosition = getMarkerPos selectRandom [
        "mrk_exfiltrate_1",
        "mrk_exfiltrate_2",
        "mrk_exfiltrate_3",
        "mrk_exfiltrate_4"
      ];

      missionNamespace setVariable ["hoppers_exfilPosition", _exfilPosition, true];

      // if last bomb exploded
      if (_spotNumber == count (missionNamespace getVariable ["hoppers_bombSpots", []])) then {
        private _taskID = "Exfiltrate";
        [
          east,
          [_taskID],
          ["Boss has to leave map area alive to win. Only Boss needs to be within 100m of exfil point.",
          "Flee",
          ""],
          _exfilPosition,
          false,
          -1,
          true
        ] call BIS_fnc_taskCreate;
      };

  };

}] call CBA_fnc_addEventHandler;
