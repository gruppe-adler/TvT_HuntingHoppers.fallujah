params ["_unit"];

_unit setVariable ["hoppers_lastPing", CBA_missionTime];
private _timeStamp = CBA_missionTime;

private _boss = missionNamespace getVariable ["hoppers_boss", objNull];

// dont draw if unit is close to boss (nestschutz)
if (_unit != _boss && _unit distance _boss < HOPPERS_MAX_DISTANCE_BOSS) exitWith {};

// add to 3d handler list
private _nearEntities = player getVariable ["hoppers_drawEntities", []];
_nearEntities pushBackUnique _unit;
player setVariable ["hoppers_drawEntities", _nearEntities];

// delete 3d icon if not another scan followed up after fade out time
[{
    params ["_unit", "_timeStamp"];

    if (_unit getVariable ["hoppers_lastPing", -1] > _timeStamp) then {
        // do not delete
    } else {
        private _nearEntities = player getVariable ["hoppers_drawEntities", []];
        _nearEntities deleteAt (_nearEntities find _unit);
        player setVariable ["hoppers_drawEntities", _nearEntities];
    };

}, [_unit, _timeStamp], HOPPERS_BOSS_MARKING_FADEOUT] call CBA_fnc_waitAndExecute;


if (_unit == missionNamespace getVariable ["hoppers_boss", objNull]) then {
    [_unit,0.5,1,0,0,{
        params ["_unit","_target","_updateInterval"];
        private _reception = 1 - (_unit distance2D _target)/2000;
        _reception
    },5,false] remoteExec ["grad_gpsTracker_fnc_openTitle", west];
};