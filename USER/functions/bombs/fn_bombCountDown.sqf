// E: Server

params ["_boss"];

private _bomb = "IEDLandBig_F" createVehicle (getPos _boss);
_boss setVariable ["hoppers_countdownStarted", true, true];
_bomb setVariable ["hoppers_countdownStarted", true, true];
_bomb setVariable ["hoppers_countdownBoss", _boss, true];

for "_i" from HOPPERS_BOMBS_TIME_TO_EXPLOSION to 1 step -1 do {
    [{
      params ["_i", "_bomb"];

      // likely defused or exploded
      if (isNull _bomb) exitWith {
            [""] remoteExec ["hintSilent", east];
      };
      private _bombActive = _bomb getVariable ["hoppers_countdownStarted", false];

      if (_bombActive) then {
        private _string = "Bomb exploding in " + str _i + " s";
        [_string] remoteExec ["hintSilent", east];
      };

    }, [(HOPPERS_BOMBS_TIME_TO_EXPLOSION + 1) - _i, _bomb], _i] call CBA_fnc_waitAndExecute;
};

[{
    params ["_bomb", "_boss", "_position"];

    if (!(_boss getVariable ["hoppers_countdownStarted", false])) exitWith {
        diag_log "bomb has been defused";
    };

    private _explosion = "Bo_GBU12_LGB" createVehicle _position;
    _explosion setDamage 1;
    

    private _phase = missionNamespace getVariable ["hoppers_missionPhase", 0];
    _phase = _phase + 1;
    missionNamespace setVariable ["hoppers_missionPhase", _phase, true];

    [_phase] call hoppers_fnc_tasksInitOpfor;

    remoteExecCall ["grad_waverespawn_fnc_respawnManual", west];
    remoteExecCall ["grad_waverespawn_fnc_respawnManual", east];

    _boss setVariable ["hoppers_countdownStarted", false, true];
    _bomb setVariable ["hoppers_countdownStarted", false, true];

    // create ruins
    private _housesNearBy = ((_position nearObjects ["House", 50]) + (_position nearObjects ["BUILDING", 50]));
    {
        _x setDamage [1, false];
    } forEach _housesNearBy;

    [_position, _phase] call hoppers_fnc_createBombMarker;

    missionNamespace setVariable ["hoppers_lastPhaseTime", CBA_missionTime, true];

    diag_log format ["resetting lastPhaseTime %1", CBA_missionTime];

    ["hoppers_phaseChange", [_phase]] call CBA_fnc_globalEvent;

    deleteVehicle _bomb;

}, [_bomb, _boss, getPos _boss], HOPPERS_BOMBS_TIME_TO_EXPLOSION] call CBA_fnc_waitAndExecute;
