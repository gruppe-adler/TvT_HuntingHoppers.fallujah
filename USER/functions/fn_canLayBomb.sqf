private _existingBombMarkers = missionNamespace getVariable ["hoppers_bombmarker", []];
private _canLay = true;

{
    if (player inArea _x) then {
        _canLay = false;
    };
} forEach _existingBombMarkers;

if (player getVariable ["hoppers_countdownStarted", false]) then {
    _canLay = false;
};

_canLay
