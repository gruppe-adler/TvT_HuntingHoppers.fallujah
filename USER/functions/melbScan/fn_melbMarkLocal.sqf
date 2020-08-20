params ["_position", "_side", "_fadeOut"];

if (side player != _side) exitWith {};

private _markerName = format ["mrk_boss_local_%1_%2", _position, CBA_missionTime];
private _marker = createMarkerLocal [_markerName, _position];
_marker setMarkerShapeLocal "ICON";
_marker setMarkerTypeLocal "hd_dot";
_marker setMarkerColorLocal [1,0,0,1];
_marker setMarkerTextLocal (format ["%1",[daytime * 3600,"HH:MM"] call BIS_fnc_secondsToString]);

[[_marker],60] call hoppers_fnc_melbFadeMarker;
