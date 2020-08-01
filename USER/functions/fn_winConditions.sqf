[{
  params ["_args", "_handle"];

  private _opforBosses = missionNamespace getVariable ["hoppers_bosses", []];
  private _exfilPosition = missionNamespace getVariable ["hoppers_exfilPosition", [-9999,-9999,0]];

  // east eliminated
  OPFOR_ELIMINATED = ({side _x isEqualTo east && alive _x} count _opforBosses == 0);
  BLUFOR_ELIMINATED = ({side _x isEqualTo west && alive _x} count (playableUnits + switchableUnits) == 0);

  OPFOR_EXTRACTED = {side _x isEqualTo east && alive _x && _x distance [0,0,0] < 100} count hoppers_bosses == count hoppers_bosses;

  if (OPFOR_ELIMINATED) exitWith {
      [_handle] call CBA_fnc_removePerFrameHandler;
      call GRAD_replay_fnc_stopRecord;

      ["Eliminate", "SUCCEEDED"] call BIS_fnc_taskSetState;
      ["Exfiltrate", "FAILED"] call BIS_fnc_taskSetState;

      west addScoreSide 1337;
  };

  if (BLUFOR_ELIMINATED) exitWith {
      [_handle] call CBA_fnc_removePerFrameHandler;
      call GRAD_replay_fnc_stopRecord;

      ["Eliminate", "FAILED"] call BIS_fnc_taskSetState;
      ["Exfiltrate", "SUCCEEDED"] call BIS_fnc_taskSetState;

      east addScoreSide 1337;
  };

  if (OPFOR_EXTRACTED) exitWith {
    [_handle] call CBA_fnc_removePerFrameHandler;
    call GRAD_replay_fnc_stopRecord;

    ["Eliminate", "FAILED"] call BIS_fnc_taskSetState;
    ["Exfiltrate", "SUCCEEDED"] call BIS_fnc_taskSetState;

    east addScoreSide 1337;
  };


}, 1, []] call CBA_fnc_addPerFrameHandler;

// end mission when replay is done
["GRAD_replay_finished",
{
  "SideScore" call BIS_fnc_endMissionServer;
}] call CBA_fnc_addEventHandler;
