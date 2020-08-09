// E: Server

params ["_boss"];

_boss setVariable ["hoppers_countdownStarted", true, true];

private _max = 30; // duration of countdown

for "_i" from _max to 1 step -1 do {
    [{
      params ["_i"];

      private _string = "Bomb exploding in " + str _i + " s";
      [_string] remoteExec ["hintSilent", east];

    }, [_max - _i], _i] call CBA_fnc_waitAndExecute;
};

[{
    params ["_boss"];

    private _position = getPos _boss;
    private _explosion = "RHS_9M79_1_K" createVehicle _position;
    _explosion setDamage 1;

    private _phase = missionNamespace getVariable ["hoppers_missionPhase", 0];
    _phase = _phase + 1;
    missionNamespace setVariable ["hoppers_missionPhase", _phase, true];

    [_phase] call hoppers_fnc_tasksInitOpfor;

    remoteExecCall ["grad_waverespawn_fnc_respawnManual", west];
    remoteExecCall ["grad_waverespawn_fnc_respawnManual", east];

    _boss setVariable ["hoppers_countdownStarted", false, true];

    // create ruins
    private _housesNearBy = ((_position nearObjects ["House", 50]) + (_position nearObjects ["BUILDING", 50]));
    {
        _x setDamage [1, false];
    } forEach _housesNearBy;

    [_position, _phase] call hoppers_fnc_createBombMarker;

    missionNamespace setVariable ["hoppers_lastPhaseTime", CBA_missionTime, true];

    diag_log format ["resetting lastPhaseTime %1", CBA_missionTime];

    ["hoppers_phaseChange", [_phase, _boss]] call CBA_fnc_globalEvent;

}, [_boss], _max] call CBA_fnc_waitAndExecute;
