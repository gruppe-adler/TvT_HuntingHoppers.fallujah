

["hoppers_phaseChange", {
  params ["_newPhase", "_bombSpot"];

  private _lastPhase = _newPhase >= count (missionNamespace getVariable ["hoppers_bombSpots", []]);

  if (hasInterface) then {
    private _string = "Bomb attack " + (str _newPhase) + " detected! Intel for Blufor improved.";

    if (_lastPhase) then {
      _string = "Bomb attack " + (str _newPhase) + " detected! Tracking on Boss established. Opfor needs to flee.";
    };

    [
      _string,
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

     
      // if last bomb exploded
      if (_lastPhase) then {
         private _exfilPosition = getMarkerPos selectRandom [
          "mrk_exfiltrate_1",
          "mrk_exfiltrate_2",
          "mrk_exfiltrate_3",
          "mrk_exfiltrate_4"
        ];

        missionNamespace setVariable ["hoppers_exfilPosition", _exfilPosition, true];


        private _taskID = "Exfiltrate";
        [
          east,
          [_taskID],
          ["Boss has to leave map area alive to win. Only Boss needs to be within 100m of exfil point.",
          "Flee",
          ""],
          _exfilPosition,
          true,
          -1,
          false
        ] call BIS_fnc_taskCreate;
      };

  };

}] call CBA_fnc_addEventHandler;
