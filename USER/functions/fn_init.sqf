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

  if (side player == east) then {
    private _boss = (missionNamespace getVariable ["hoppers_bosses", []]) select 0; // todo make failproof
    [_boss] call hoppers_fnc_areaBarShow;
  };
};

if (!isServer) exitWith {};

[0] call hoppers_fnc_tasksInitOpfor;

HOPPERS_BOMB_MIN_DISTANCE = 750;

call hoppers_fnc_tasksInitBlufor;
call hoppers_fnc_addCivilianPenalty;
call hoppers_fnc_winConditions;
call hoppers_fnc_addMarkersEast;
