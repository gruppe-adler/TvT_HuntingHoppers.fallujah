if (hasInterface) then {
  ["hoppers_civEnemy", {
      params ["_side"];

      if (side player == _side) then {
        [
          "The Population is angry now and will attack you.",
          2,
          5, // duration
          [side player, false] call BIS_fnc_sideColor, // color
          true // outline
        ] spawn BIS_fnc_WLSmoothText; // no sounds, letters appear in a smooth transition
      };
  }] call CBA_fnc_addEventHandler;
};

if (!isServer) exitWith {};

HOPPERS_REPLACE_BUILDINGS_RADIUS = 750;
HOPPERS_REPLACE_PLANTS_RADIUS = 750;

call hoppers_fnc_bombSpotInit;
call hoppers_fnc_tasksInitBlufor;
call hoppers_fnc_addCivilianPenalty;
