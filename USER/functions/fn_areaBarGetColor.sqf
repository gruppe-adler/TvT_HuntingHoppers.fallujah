params ["_distance"];

private _green = [0.44, 0.66, 0.44, 1];
private _yellow = [0.81, 0.55, 0.12, 1];
private _red = [0.56, 0.06, 0.40, 1];
private _return = [0.44, 0.66, 0.44, 1];

if (_distance >= 180) then {
	_return = _red;
};

if (_distance < 180) then {
	_return = _yellow;
};

if (_distance < 160) then {
	_return = _green;
};

_return
