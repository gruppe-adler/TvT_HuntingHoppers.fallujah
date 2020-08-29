#include "..\component.hpp"

params ["_display","_size","_offsetX","_offsetY","_showDistance"];

private _totalW = _size * SZW(40);
private _totalH = _size * SZH(40);

private _ctrlGroup = _display ctrlCreate ["RscControlsGroupNoScrollbars",-1];
_ctrlGroup ctrlSetPosition [_offsetX * SZW(120) - _totalW,_offsetY * SZH(80) - _totalH,_totalW,_totalH];
_ctrlGroup ctrlSetFade 1;
_ctrlGroup ctrlCommit 0;

private _backgroundNight = _display ctrlCreate ["RscPicture",-1,_ctrlGroup];
_backgroundNight ctrlSetText (grad_gpsTracker_moduleRoot + "\data\tracker_bg_night.paa");
_backgroundNight ctrlSetPosition [0,0,_totalW,_totalH];
_backgroundNight ctrlCommit 0;

private _backgroundDay = _display ctrlCreate ["RscPicture",-1,_ctrlGroup];
[_backgroundDay] call grad_gpsTracker_fnc_updateBackground;
_backgroundDay ctrlSetText (grad_gpsTracker_moduleRoot + "\data\tracker_bg_day.paa");
_backgroundDay ctrlSetPosition [0,0,_totalW,_totalH];
_backgroundDay ctrlCommit 0;

private _receptionCtrl = _display ctrlCreate ["RscPicture",-1,_ctrlGroup];
_receptionCtrl ctrlSetText (grad_gpsTracker_moduleRoot + "\data\tracker_0.paa");
_receptionCtrl ctrlSetPosition [_size * SZW(12.6),_size * SZH(10.4),_size * SZW(4),_size * SZH(4)];
_receptionCtrl ctrlCommit 0;

private _arrowCtrl = _display ctrlCreate ["RscPicture",-1,_ctrlGroup];
_arrowCtrl ctrlSetText (grad_gpsTracker_moduleRoot + "\data\tracker_arrow.paa");
_arrowCtrl ctrlSetPosition [_size * SZW(14.5),_size * SZH(15),_size * SZW(11),_size * SZH(11)];
_arrowCtrl ctrlCommit 0;

private _distanceCtrl = if (_showDistance) then {
    _ctrl = _display ctrlCreate ["RscStructuredText",-1,_ctrlGroup];
    _ctrl ctrlSetFontHeight 0.01;
    _ctrl ctrlSetFont "LucidaConsoleB";
    _ctrl ctrlSetTextColor [0,0,0,0.7];
    _ctrl ctrlSetPosition [_size * SZW(17.00),_size * SZH(11.95),_size * SZW(9),_size * SZH(2)];
    _ctrl ctrlCommit 0;

    _ctrl
} else {
    controlNull
};

[{ctrlCommitted (_this select 0)}, {
    params ["_arrowCtrl","_ctrlGroup"];
    _ctrlGroup ctrlSetFade 0;
    _ctrlGroup ctrlCommit 0.5;
}, [_arrowCtrl,_ctrlGroup]] call CBA_fnc_waitUntilAndExecute;

[_ctrlGroup,_arrowCtrl,_receptionCtrl,_backgroundDay,_distanceCtrl]
