params ["_unit"];

if (_unit getVariable ["hoppers_marker_running",false]) exitWith {};
diag_log format ["marker loop starting for %1.",_unit getVariable ["ACE_Name", "unknown"]];

private _markerInterval = [(missionConfigFile >> "cfgMission"), "markerInterval",[60,70]] call BIS_fnc_returnConfigEntry;
private _markerFadeout = [(missionConfigFile >> "cfgMission"), "markerFadeout",60] call BIS_fnc_returnConfigEntry;

private _markerSize = 1000;

private _markerIntervalMin = _markerInterval select 0;
private _markerIntervalRandom = (_markerInterval select 1) - _markerIntervalMin;
_unit setVariable ["hoppers_currentAgentMarkerInterval",_markerIntervalMin + (random _markerIntervalRandom)];

[{
    params ["_args","_handle"];
    _args params ["_unit","_markerSize","_markerIntervalMin","_markerIntervalRandom","_markerFadeout"];

    // if (!alive _unit || isNull _unit) exitWith {[_handle] call CBA_fnc_removePerFrameHandler};

    private _currentInterval = _unit getVariable ["hoppers_currentAgentMarkerInterval",_markerIntervalMin];
    private _currentFadeout = _markerFadeout;
    private _lastPhase = missionNamespace getVariable ["hoppers_missionPhase", 0] >= 9998;
    private _lastRun = _unit getVariable ["hoppers_lastAgentMarkerTime",0];
    private _lastPhaseTime = missionNamespace getVariable ["hoppers_lastPhaseTime", CBA_missionTime];

    if (_lastPhase && !(_unit getVariable ["hoppers_isBoss", false])) exitWith {};

    private _size = if (_lastPhase) then {
        1
    } else {
        (_markerSize - (_markerSize * (linearConversion [0, (60 * 15), (CBA_missionTime - _lastPhaseTime), 0, 1, true])) + 1)
    };

    // diag_log format ["creating Marker in Size %1 for lastPhaseTime %2", _size, _lastPhaseTime];

    if (!(_unit getVariable ["hoppers_isBoss", false])) then {
        _size = _size/4
    };


    if (!_lastPhase && CBA_missionTime - _lastRun < _currentInterval) exitWith {};
    if (!(_unit getVariable ["hoppers_markerShown", false])) exitWith {};
    _unit setVariable ["hoppers_lastAgentMarkerTime", CBA_missionTime];
    _unit setVariable ["hoppers_currentAgentMarkerInterval",_markerIntervalMin + (random _markerIntervalRandom)];


    private _markerPos = [getPos _unit,[0,_size],[0,360],""] call hoppers_fnc_findRandomPos;

    if (!_lastPhase && _unit getVariable ["hoppers_isBoss", false]) then {
        [_markerPos] remoteExec ["hoppers_fnc_showTracker",WEST,false];
    };

    private _color = if (_unit getVariable ["hoppers_isBoss", false]) then { "ColorOpfor" } else { "ColorIndependent" };

    private _centerMarkerName = format ["hoppers_marker_%1_center_%2",_unit getVariable ["ACE_Name", "unknown"],CBA_missionTime * 1000];
    private _centerMarker = createMarker [_centerMarkerName, _markerPos];
    _centerMarker setMarkerShape "ICON";
    _centerMarker setMarkerType "hd_dot";
    _centerMarker setMarkerColor _color;
    if (!_lastPhase) then {
        _centerMarker setMarkerText (format ["%1",[daytime * 3600,"HH:MM"] call BIS_fnc_secondsToString]);
    } else {
        _centerMarker setMarkerText "";
    };

    // diag_log format ["_centerMarkerName: %1", _centerMarkerName];

    private _areaMarkerName = format ["hoppers_marker_%1_area_%2",_unit getVariable ["ACE_Name", "unknown"],CBA_missionTime * 1000];
    private _areaMarker = createMarker [_areaMarkerName, _markerPos];
    _areaMarker setMarkerShape "ELLIPSE";
    _areaMarker setMarkerColor _color;
    _areaMarker setMarkerSize [_size,_size];
    _areaMarker setMarkerBrush "Border";

    [[_centerMarker,_areaMarker],_currentFadeout] call hoppers_fnc_fadeMarker;

} , 1, [_unit, _markerSize,_markerIntervalMin,_markerIntervalRandom,_markerFadeout]] call CBA_fnc_addPerFrameHandler;

_unit setVariable ["hoppers_marker_running",true];
