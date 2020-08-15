params ["_markerPos", "_index"];

private _color = "colorBlack";

private _centerMarker = createMarker [format ["hoppers_bombmarker_center_%1_%2",_markerPos,CBA_missionTime * 1000],_markerPos];
_centerMarker setMarkerShape "ICON";
_centerMarker setMarkerType "hd_dot";
_centerMarker setMarkerColor _color;
_centerMarker setMarkerText (format ["%1 | %2", _index, [daytime * 3600,"HH:MM"] call BIS_fnc_secondsToString]);

private _bombMarker = createMarker [format ["hoppers_bombmarker_%1_%2",_markerPos,CBA_missionTime * 1000],_markerPos];
_bombMarker setMarkerShape "ELLIPSE";
_bombMarker setMarkerColor _color;
_bombMarker setMarkerSize [HOPPERS_BOMBS_MIN_DISTANCE,HOPPERS_BOMBS_MIN_DISTANCE];
_bombMarker setMarkerBrush "Border";

private _existingBombMarkers = missionNamespace getVariable ["hoppers_bombmarker", []];
_existingBombMarkers pushBack _bombMarker;
missionNamespace setVariable ["hoppers_bombmarker", _existingBombMarkers, true];

_bombMarker
