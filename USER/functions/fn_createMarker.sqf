params ["_unit"];

if (_unit getVariable ["hoppers_marker_running",false]) exitWith {};
diag_log format ["marker loop starting for %1.",name _unit];

private _markerInterval = [(missionConfigFile >> "cfgMission"), "markerInterval",[60,70]] call BIS_fnc_returnConfigEntry;
private _markerFadeout = [(missionConfigFile >> "cfgMission"), "markerFadeout",60] call BIS_fnc_returnConfigEntry;

private _markerVariances =
  [
    [(missionConfigFile >> "cfgMission"), "markerVariance_1",2000] call BIS_fnc_returnConfigEntry,
    [(missionConfigFile >> "cfgMission"), "markerVariance_2",1000] call BIS_fnc_returnConfigEntry,
    [(missionConfigFile >> "cfgMission"), "markerVariance_3",500] call BIS_fnc_returnConfigEntry,
    [(missionConfigFile >> "cfgMission"), "markerVariance_4",250] call BIS_fnc_returnConfigEntry,
    [(missionConfigFile >> "cfgMission"), "markerVariance_5",0] call BIS_fnc_returnConfigEntry
  ];

private _markerIntervalMin = _markerInterval select 0;
private _markerIntervalRandom = (_markerInterval select 1) - _markerIntervalMin;
_unit setVariable ["hoppers_currentAgentMarkerInterval",_markerIntervalMin + (random _markerIntervalRandom)];

[{
    params ["_args","_handle"];
    _args params ["_unit","_markerVariances","_markerIntervalMin","_markerIntervalRandom","_markerFadeout"];

    // if (!alive _unit || isNull _unit) exitWith {[_handle] call CBA_fnc_removePerFrameHandler};

    private _currentInterval = _unit getVariable ["hoppers_currentAgentMarkerInterval",_markerIntervalMin];
    private _currentFadeout = _markerFadeout;
    private _currentVariance = _markerVariances select (missionNamespace getVariable ["hoppers_missionPhase", 0]);
    private _lastPhase = missionNamespace getVariable ["hoppers_missionPhase", 0] >= count (missionNamespace getVariable ["hoppers_bombSpots", []]);

    private _size = if (_unit getVariable ["hoppers_isBoss", false]) then { _currentVariance } else { _currentVariance/4 };

    private _lastRun = _unit getVariable ["hoppers_lastAgentMarkerTime",0];
    if (!_lastPhase && CBA_missionTime - _lastRun < _currentInterval) exitWith {};
    if (!(_unit getVariable ["hoppers_markerShown", false])) exitWith {};
    _unit setVariable ["hoppers_lastAgentMarkerTime", CBA_missionTime];


    _unit setVariable ["hoppers_currentAgentMarkerInterval",_markerIntervalMin + (random _markerIntervalRandom)];

    private _markerPos = [getPos _unit,[0,_size],[0,360],""] call hoppers_fnc_findRandomPos;

    if (!_lastPhase && _unit getVariable ["hoppers_isBoss", false]) then {
        [_markerPos] remoteExec ["hoppers_fnc_showTracker",WEST,false];
    };

    private _color = if (_unit getVariable ["hoppers_isBoss", false]) then { "ColorOpfor" } else { "ColorIndependent" };
    private _centerMarker = createMarker [format ["hoppers_marker_%1_center_%2",[name _unit] call BIS_fnc_filterString,CBA_missionTime * 1000],_markerPos];
    _centerMarker setMarkerShape "ICON";
    _centerMarker setMarkerType "hd_dot";
    _centerMarker setMarkerColor _color;
    _centerMarker setMarkerText (format ["%1",[daytime * 3600,"HH:MM"] call BIS_fnc_secondsToString]);

    private _areaMarker = createMarker [format ["hoppers_marker_%1_area_%2",[name _unit] call BIS_fnc_filterString,CBA_missionTime * 1000],_markerPos];
    _areaMarker setMarkerShape "ELLIPSE";
    _areaMarker setMarkerColor _color;
    _areaMarker setMarkerSize [_size,_size];
    _areaMarker setMarkerBrush "Border";

    [[_centerMarker,_areaMarker],_currentFadeout] call hoppers_fnc_fadeMarker;

} , 1, [_unit, _markerVariances,_markerIntervalMin,_markerIntervalRandom,_markerFadeout]] call CBA_fnc_addPerFrameHandler;

_unit setVariable ["hoppers_marker_running",true];
