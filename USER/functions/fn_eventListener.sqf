

["hoppers_phaseChange", {
  params ["_newPhase"];

  if (hasInterface) then {
    private _string = "Bomb attack " + (str _newPhase) + " detected!";

    if (_newPhase == 9999) then {
      _string = "Constant tracking on Boss established. Opfor is fleeing.";
    };

    [
      _string,
      2,
      5, // duration
      [side player, false] call BIS_fnc_sideColor, // color
      true // outline
    ] spawn BIS_fnc_WLSmoothText; // no sounds, letters appear in a smooth transition

  };

  if (isServer && _newPhase < 9999) then {

      private _spotNumber = _newPhase - 1;
      private _lastSpot = format ["Hoppers_Bombspot_%1", _spotNumber];

      [_lastSpot,"SUCCEEDED"] call BIS_fnc_taskSetState;

  };

}] call CBA_fnc_addEventHandler;
