params ["_unit","_target","_distanceCtrl"];

if (isNull _distanceCtrl) exitWith {};

private _dist = "0000" + (str ((round (_unit distance _target)) min 9999));
private _length = count _dist;

_distanceCtrl ctrlSetStructuredText parseText format ["<t size='0.65'>%1m</t>",_dist select [_length -4,_length -1]];
