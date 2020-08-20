params ["_position", "_side", "_fadeOut", "_timestamp"];

if (side player != _side) exitWith {};

private _markerName = format ["mrk_boss_local_%1_%2", _position, _timestamp];
private _marker = createMarkerLocal [_markerName, _position];
_marker setMarkerShapeLocal "ICON";
_marker setMarkerTypeLocal "hd_dot";
_marker setMarkerColorLocal "ColorRed";
_marker setMarkerTextLocal (format ["%1",[daytime * 3600,"HH:MM"] call BIS_fnc_secondsToString]);

[[_marker], 60, .4, _timestamp] call hoppers_fnc_melbFadeMarker;