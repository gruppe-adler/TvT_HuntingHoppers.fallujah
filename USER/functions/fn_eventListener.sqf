

["hoppers_phaseChange", {
  params ["_newPhase", "_bombSpot"];

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

      private _spotNumber = _newPhase - 1;
      private _lastSpot = format ["Hoppers_Bomb%1", _spotNumber];

      [_lastSpot,"SUCCEEDED"] call BIS_fnc_taskSetState;

  };

}] call CBA_fnc_addEventHandler;
