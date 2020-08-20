private _canLay = true;

{
    if (player distance (getMarkerPos _x) > HOPPERS_BOMBS_CLACKERRANGE) then {
        _canLay = false;
    };
} forEach HOPPERS_BOMBS_BOMBSPOTS;

if (player getVariable ["hoppers_countdownStarted", false]) then {
    _canLay = false;
};

if (missionNamespace getVariable ["hoppers_missionPhase", 0] > 9998) then {
    _canLay = false;
};

_canLay
