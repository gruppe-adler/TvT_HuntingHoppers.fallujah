// E: Server

params ["_boss"];
private _position = getPos _boss;
private _bomb = createVehicle ["IEDLandBig_F", _position, [], 0, "CAN_COLLIDE"];
_boss setVariable ["hoppers_countdownStarted", true, true];
_bomb setVariable ["hoppers_countdownStarted", true, true];
_bomb setVariable ["hoppers_countdownBoss", _boss, true];

[_bomb] remoteExecCall ["hoppers_fnc_bombDetonateAction", _boss];

private _bombSpot = "";
{
    if (_boss distance (getMarkerPos _x) < HOPPERS_BOMBS_LAYDISTANCE) then {
        _bombSpot = _x;
    };
} forEach HOPPERS_BOMBS_BOMBSPOTS;

_bomb setVariable ["hoppers_bombBombspot", _bombSpot, true];
// systemChat ("setting bomb for spot " + _bombspot);

[_bombspot, east, "ASSIGNED"] call hoppers_fnc_bombTaskSetState;
[getPos _bomb, west, _bombspot] remoteExec ["hoppers_fnc_bombTaskDefuse", 2];
[_bomb] remoteExec ["hoppers_fnc_addBombDefuseAction", west];


private _phase = missionNamespace getVariable ["hoppers_missionPhase", 0];
_phase = _phase + 1;
missionNamespace setVariable ["hoppers_missionPhase", _phase, true];
private _markers = [_position, _phase] call hoppers_fnc_createBombMarker;
["hoppers_phaseChange", [_phase]] call CBA_fnc_globalEvent;

_bomb setVariable ["hoppers_bombMarkers", _markers, true];

for "_i" from (HOPPERS_BOMBS_TIME_TO_EXPLOSION) to 1 step -1 do {
    [{
      params ["_i", "_bomb"];

      // likely defused or exploded
      if (_i < 1) exitWith {
            ["Bomb can be detonated now"] remoteExec ["hintSilent", east];
      };
      private _bombActive = _bomb getVariable ["hoppers_countdownStarted", false];

      if (_bombActive) then {
        private _string = "Bomb can be detonated in " + str _i + " s";
        [_string] remoteExec ["hintSilent", east];
      };

    }, [HOPPERS_BOMBS_TIME_TO_EXPLOSION - _i, _bomb], _i] call CBA_fnc_waitAndExecute;
};

[{
    params ["_bomb"];

    if (isNull _bomb) exitWith { diag_log "bomb defused, cant be activated"; };

    private _markers = _bomb getVariable ["hoppers_bombMarkers", []];
    {
        _x setMarkerColor "ColorGreen";
    } forEach _markers;

    _bomb setVariable ["hoppers_bombReadyToDetonate", true, true];

}, [_bomb], HOPPERS_BOMBS_TIME_TO_EXPLOSION] call CBA_fnc_waitAndExecute;
