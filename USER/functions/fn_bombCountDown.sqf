params ["_object"];

private _max = 30; // duration of countdown

for "_i" from _max to 1 step -1 do {
    [{
      params ["_i"];

      private _string = "Bomb exploding in " + str _i + " s";
      [_string] remoteExec ["hintSilent", east];

    }, [_max - _i], _i] call CBA_fnc_waitAndExecute;
};

[{
    params ["_object"];

    /*
    private _explosion = "RHS_9M79_1_K" createVehicle (position _object);
    _explosion setDamage 1;
    */
    private _phase = missionNamespace getVariable ["hoppers_missionPhase", 0];
    _phase = _phase + 1;
    missionNamespace setVariable ["hoppers_missionPhase", _phase, true];

    [getPos _object, 10] call RHS_fnc_ss21_nuke; // param 1 is payload

    ["hoppers_phaseChange", [_phase, _object]] call CBA_fnc_globalEvent;

}, [_object], _max] call CBA_fnc_waitAndExecute;
