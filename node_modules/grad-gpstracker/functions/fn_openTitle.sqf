#include "..\component.hpp"

"grad_gpsTracker_layer" cutRsc ["RscTitleDisplayEmpty","PLAIN",0,false];

[{!isNull (uiNamespace getVariable ["RscTitleDisplayEmpty",displayNull])}, {
    params ["_target",["_updateInterval",0.5],["_size",1],["_offsetX",1],["_offsetY",1],["_receptionCode",{params ["_unit","_target","_updateInterval"]; private _reception = 1 - (_unit distance2D _target)/2000; _reception}],["_duration",-1],["_showDistance",false]];

    if (!isNil "_target") then {[_target] call grad_gpsTracker_fnc_setTarget};

    _display = uiNamespace getVariable ["RscTitleDisplayEmpty",displayNull];

    _components = [_display,_size,_offsetX,_offsetY,_showDistance] call grad_gpsTracker_fnc_createGPS;
    _components params ["_ctrlGroup","_arrowCtrl","_receptionCtrl","_bgDayCtrl","_distanceCtrl"];

    [_updateInterval,_display,_arrowCtrl,_receptionCtrl,_bgDayCtrl,_distanceCtrl,_receptionCode] call grad_gpsTracker_fnc_addPFH;

    if (_duration > 0) then {
        [grad_gpsTracker_fnc_closeTitle,[],_duration] call CBA_fnc_waitAndExecute;
    };
}, _this] call CBA_fnc_waitUntilAndExecute;
