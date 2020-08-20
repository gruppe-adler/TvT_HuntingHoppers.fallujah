params ["_markers","_time",["_threshold",0.4], "_timeStamp"];

if !(_markers isEqualType []) then {_markers = [_markers]};
private _interval = _time / 10;
private _step = (1-_threshold) / 10;

[{
    params ["_args","_handle"];
    _args params ["_markers","_step", "_timeStamp"];

    if (player getVariable ["hoppers_fadeMarkerStart", 0] > _timeStamp) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
        diag_log format ["removing already running fademarker for new one"];
    };

    {
        _x setMarkerAlphaLocal ((markerAlpha _x) - _step);
        false
    } count _markers;

    if (markerAlpha (_markers select 0) <= _threshold) exitWith {
        {
            deleteMarker _x;
            false
        } count _markers;
        [_handle] call CBA_fnc_removePerFrameHandler;
    };
} , _interval, [_markers,_step, _timeStamp]] call CBA_fnc_addPerFrameHandler;
