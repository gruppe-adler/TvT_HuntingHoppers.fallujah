params ["_boss"];

private _progressBars = call hoppers_fnc_areaBarCreate;
_progressBars params ["_backGroundBar", "_progressBar", "_text"];
private _minDistance = 0;
private _maxDistance = HOPPERS_MAX_DISTANCE_BOSS;

_handle = [{
	params ["_args", "_handle"];
	_args params ["_minDistance", "_maxDistance", "_boss", "_backGroundBar", "_progressBar", "_text"];

	private _distance = round (player distance _boss);
	private _color = [_distance] call hoppers_fnc_areaBarGetColor;
  private _progress = (linearConversion
		[_minDistance, _maxDistance, _distance, 0, 1, true]
	);
	_progressBar progressSetPosition _progress;
	_progressBar ctrlSetTextColor _color;

  _text ctrlSetText (str _distance + " | " + (str _maxDistance) + " m");
	
  _backGroundBar ctrlCommit 0;
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
      ctrlDelete _backGroundBar;
      ctrlDelete _text;
      [_handle] call CBA_fnc_removePerFrameHandler;
  };

}, 0.05, [_minDistance, _maxDistance, _boss, _backGroundBar, _progressBar, _text]] call CBA_fnc_addPerFrameHandler;
