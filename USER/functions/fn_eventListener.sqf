if (hasInterface) then {

  ["hoppers_phaseChange", {
    params ["_newPhase"];

    [
      "Bomb attack " + (str _newPhase) + " detected! Intel for Blufor improved.",
      2,
      5, // duration
      [side player, false] call BIS_fnc_sideColor, // color
      true // outline
    ] spawn BIS_fnc_WLSmoothText; // no sounds, letters appear in a smooth transition

  }] call CBA_fnc_addEventHandler;

};
