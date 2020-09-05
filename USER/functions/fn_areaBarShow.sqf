params ["_boss"];

private _progressBar = call hoppers_fnc_areaBarCreate;
private _minDistance = 0;
private _maxDistance = ["HOPPERS_MAX_DISTANCE_BOSS", 200] call BIS_fnc_getParamValue;

_handle = [{
	params ["_args", "_handle"];
	_args params ["_minDistance", "_maxDistance", "_boss", "_progressBar"];

	private _distance = player distance _boss;
	private _color = [_distance] call hoppers_fnc_areaBarGetColor;
  private _progress = (linearConversion
		[_minDistance, _maxDistance, _distance, 0, 1, true]
	);
	_progressBar progressSetPosition _progress;
	_progressBar ctrlSetTextColor _color;
	_progressBar ctrlCommit 0;

  /*
  // not relevant if no marker on map
  if (_progress > 0.99) then {
      if (!(player getVariable ["hoppers_markerShown", false])) then {
          player setVariable ["hoppers_markerShown", true, true];
      };
  } else {
    if (player getVariable ["hoppers_markerShown", false]) then {
        player setVariable ["hoppers_markerShown", false, true];
    };
  };
  */

  // delete bar when dead
  if (!alive player) exitWith {
      ctrlDelete _progressBar;
      [_handle] call CBA_fnc_removePerFrameHandler;
  };

}, 0.05, [_minDistance, _maxDistance, _boss, _progressBar]] call CBA_fnc_addPerFrameHandler;
