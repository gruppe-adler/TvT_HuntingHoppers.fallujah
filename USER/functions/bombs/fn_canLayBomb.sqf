private _canLay = false;

{
    if (player distance (getMarkerPos _x) < HOPPERS_BOMBS_LAYDISTANCE) then {
        _canLay = true;
    };
} forEach HOPPERS_BOMBS_BOMBSPOTS;

if (!(player getVariable ["hoppers_countdownStarted", false])) then {
    _canLay = true;
};

if (missionNamespace getVariable ["hoppers_missionPhase", 0] < 9999) then {
    _canLay = true;
};

_canLay
