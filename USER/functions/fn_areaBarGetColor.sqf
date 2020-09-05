params ["_distance"];

private _green = [0.2, 0.66, 0.2, 1];
private _yellow = [0.81, 0.35, 0.12, 1];
private _red = [0.56, 0.06, 0.06, 1];
private _return = [0.44, 0.44, 0.44, 1];

if (_distance >= HOPPERS_MAX_DISTANCE_BOSS) then {
	_return = _red;
};

if (_distance < HOPPERS_MAX_DISTANCE_BOSS) then {
	_return = _yellow;
};

if (_distance < HOPPERS_MAX_DISTANCE_BOSS/1.5) then {
	_return = _green;
};

_return
