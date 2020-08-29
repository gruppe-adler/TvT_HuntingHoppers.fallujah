if (hasInterface) then {

  call linearSD_fnc_transferRadiosAcrossRespawn;

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

  if (side player == east && !(player getVariable ["hoppers_isBoss", false])) then {
    [{
      private _boss = (missionNamespace getVariable ["hoppers_bosses", []]) select 0; // todo make failproof
      [_boss] call hoppers_fnc_areaBarShow;
    }, [], 10] call CBA_fnc_waitAndExecute;
  };
};

if (!isServer) exitWith {};

call hoppers_fnc_tasksInitBlufor;
call hoppers_fnc_addCivilianPenalty;
call hoppers_fnc_winConditions;
call hoppers_fnc_selectBombSpots;


HOPPERS_BOMBS_CLACKERRANGE = ["HOPPERS_BOMBS_CLACKERRANGE", 150] call BIS_fnc_getParamValue;
publicVariable "HOPPERS_BOMBS_CLACKERRANGE";

HOPPERS_BOMBS_LAYDISTANCE = ["HOPPERS_BOMBS_LAYDISTANCE", 10] call BIS_fnc_getParamValue;
publicVariable "HOPPERS_BOMBS_LAYDISTANCE";

HOPPERS_BOMBS_TIME_TO_EXPLOSION = ["HOPPERS_BOMBS_TIME_TO_EXPLOSION", 30] call BIS_fnc_getParamValue;
publicVariable "HOPPERS_BOMBS_TIME_TO_EXPLOSION";

HOPPERS_BOMBS_MIN_PLACED = ["HOPPERS_BOMBS_MIN_PLACED", 0] call BIS_fnc_getParamValue;
publicVariable "HOPPERS_BOMBS_MIN_PLACED";

TIME_OF_DAY = ["TIME_OF_DAY", 10] call BIS_fnc_getParamValue;
publicVariable "TIME_OF_DAY";

WEATHER_OVERCAST = ["WEATHER_OVERCAST", -1] call BIS_fnc_getParamValue;
publicVariable "WEATHER_OVERCAST";

WEATHER_FOG = ["WEATHER_FOG", -1] call BIS_fnc_getParamValue;
publicVariable "WEATHER_FOG";

WEATHER_WIND = ["WEATHER_WIND", -1] call BIS_fnc_getParamValue;
publicVariable "WEATHER_WIND";

setCustomWeather = {

  // get random shit
  if (str WEATHER_OVERCAST isEqualTo "-1") then {
    WEATHER_OVERCAST = [[
    0.0,
    0.1,
    0.2,
    0.3,
    0.4,
    0.5,
    0.6,
    0.7,
    0.8,
    0.9,
    1.0
    ], [
    0.3,
    0.3,
    0.1,
    0.1,
    0.05,
    0.025,
    0.025,
    0.025,
    0.025,
    0.025,
    0.025]] call BIS_fnc_selectRandomWeighted;
  };

  if (str WEATHER_FOG isEqualTo "-1") then {
    WEATHER_FOG = [[
    0.0,
    0.05,
    0.1,
    0.2,
    0.3,
    0.4,
    0.5,
    0.6,
    0.7,
    0.8,
    1.0
    ], [
    0.5,
    0.3,
    0.1,
    0.075,
    0.01,
    0.005,
    0.005,
    0.004,
    0.003,
    0.002,
    0.001]] call BIS_fnc_selectRandomWeighted;
  };

  if (str WEATHER_WIND isEqualTo "-1") then {
    WEATHER_WIND = (random 2) - (random 4);
  };

  diag_log format ["BC setup: setting wind to %1", WEATHER_WIND];

  // basics
  10 setOvercast WEATHER_OVERCAST;
  10 setFog WEATHER_FOG;
  setWind [WEATHER_WIND, WEATHER_WIND, true];
  10 setWindForce 0.1;

  // add specials dependent on values
  if (WEATHER_OVERCAST > 0.5 && WEATHER_OVERCAST < 0.8) then {
    10 setRain 0.5;
    10 setRainbow 0.8;
  };

  if (WEATHER_OVERCAST >= 0.8) then {
    10 setRain 1;
    10 setLightnings 0.8;
  };

  // enforce changes
  forceWeatherChange;
};


// allow view distance to be up to 10k

// set to full moon date
setDate [2015, 2, 1, TIME_OF_DAY, 1]; // set to 5:00 for perfect full moon

call setCustomWeather;
