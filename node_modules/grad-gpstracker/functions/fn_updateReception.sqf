#include "..\component.hpp"

params ["_unit","_target","_updateInterval","_receptionCtrl","_receptionCode"];

private _reception = if (_target isEqualType objNull && {isNull _target}) then {0} else {
    [_unit,_target,_updateInterval] call _receptionCode;
};

private _pic = switch (true) do {
    case (_reception < 0.01): {"\data\tracker_0.paa"};
    case (_reception < 0.25): {"\data\tracker_1.paa"};
    case (_reception < 0.50): {"\data\tracker_2.paa"};
    case (_reception < 0.75): {"\data\tracker_3.paa"};
    default {"\data\tracker_4.paa"};
};

_receptionCtrl ctrlSetText (grad_gpsTracker_moduleRoot + _pic);

_reception
