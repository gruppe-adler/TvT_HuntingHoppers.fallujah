#include "..\component.hpp"

params ["_target",["_updateInterval",0.5],["_size",1],["_offsetX",1],["_offsetY",1],["_receptionCode",{params ["_unit","_target","_updateInterval"]; private _reception = 1 - (_unit distance2D _target)/2000; _reception}],"",["_showDistance",false]];

if (!isNil "_target") then {[_target] call grad_gpsTracker_fnc_setTarget};

_display = (findDisplay 46) createDisplay "RscDisplayEmpty";

_components = [_display,_size,_offsetX,_offsetY,_showDistance] call grad_gpsTracker_fnc_createGPS;
_components params ["_ctrlGroup","_arrowCtrl","_receptionCtrl","_bgDayCtrl","_distanceCtrl"];

[_updateInterval,_display,_arrowCtrl,_receptionCtrl,_bgDayCtrl,_distanceCtrl,_receptionCode] call grad_gpsTracker_fnc_addPFH;

_display
