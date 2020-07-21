#include "component.hpp"

params ["_boss"];

if (_boss getVariable ["hoppers_marker_running",false]) exitWith {};
INFO_1("marker loop starting for %1.",name _boss);

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
_boss setVariable ["hoppers_currentAgentMarkerInterval",_markerIntervalMin + (random _markerIntervalRandom)];

[{
    params ["_args","_handle"];
    _args params ["_boss","_markerVariances","_markerIntervalMin","_markerIntervalRandom","_markerFadeout"];

    if (!alive _boss || isNull _boss) exitWith {[_handle] call CBA_fnc_removePerFrameHandler};

    private _currentInterval = _boss getVariable ["hoppers_currentAgentMarkerInterval",_markerIntervalMin];
    private _currentFadeout = _markerFadeout;
    private _currentVariance = _markerVariances select (missionNamespace getVariable ["hoppers_missionPhase", 0]);
    private _lastPhase = (count _markerVariances) == (missionNamespace getVariable ["hoppers_missionPhase", 0] - 1);

    if (!_lastPhase) then {
      private _lastRun = _boss getVariable ["hoppers_lastAgentMarkerTime",0];
      if (CBA_missionTime - _lastRun < _currentInterval) exitWith {};
      _boss setVariable ["hoppers_lastAgentMarkerTime", CBA_missionTime];
    };

    _boss setVariable ["hoppers_currentAgentMarkerInterval",_markerIntervalMin + (random _markerIntervalRandom)];

    _markerPos = [getPos _boss,[0,_currentVariance],[0,360],""] call hoppers_fnc_findRandomPos;
    [_markerPos] remoteExec ["hoppers_fnc_showTracker",WEST,false];

    _centerMarker = createMarker [format ["hoppers_marker_%1_center_%2",[name _boss] call BIS_fnc_filterString,CBA_missionTime * 1000],_markerPos];
    _centerMarker setMarkerShape "ICON";
    _centerMarker setMarkerType "hd_dot";
    _centerMarker setMarkerColor "ColorOpfor";
    _centerMarker setMarkerText (format ["%1",[daytime * 3600,"HH:MM"] call BIS_fnc_secondsToString]);

    _areaMarker = createMarker [format ["hoppers_marker_%1_area_%2",[name _boss] call BIS_fnc_filterString,CBA_missionTime * 1000],_markerPos];
    _areaMarker setMarkerShape "ELLIPSE";
    _areaMarker setMarkerColor "ColorOpfor";
    _areaMarker setMarkerSize [_currentVariance,_currentVariance];
    _areaMarker setMarkerBrush "Border";

    [[_centerMarker,_areaMarker],_currentFadeout] call hoppers_fnc_fadeMarker;

} , 1, [_boss, _markerVariances,_markerIntervalMin,_markerIntervalRandom,_markerFadeoutDefault,_markerVarianceBase,_markerIntervalBase,_markerFadeoutBase]] call CBA_fnc_addPerFrameHandler;

_boss setVariable ["hoppers_marker_running",true];
