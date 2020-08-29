#include "..\component.hpp"

params ["_unit","_target","_arrowCtrl","_reception"];

if (_reception < 0.01) then {
    _arrowCtrl ctrlSetText (grad_gpsTracker_moduleRoot + "\data\tracker_noSignal.paa");
    _arrowCtrl ctrlSetAngle [0,0.5,0.5];
} else {
    _arrowCtrl ctrlSetText (grad_gpsTracker_moduleRoot + "\data\tracker_arrow.paa");

    (getCameraViewDirection player) params ["_x","_y"];
    private _angle = (_unit getDir _target) - (_x atan2 _y);

    _arrowCtrl ctrlSetAngle [_angle,0.5,0.5];
};
