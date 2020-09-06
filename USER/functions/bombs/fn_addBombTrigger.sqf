params ["_boss"];

private _layBomb = [
    "layBomb",
    "Lay Bomb",
    "",
    {
        // hintSilent "Bomb Trigger Set";        
        player playMoveNow "Acts_carFixingWheel";
        [10, [], {
            [player] remoteExec ["hoppers_fnc_bombCountDown", 2];
        }, {
            hint "Aborted Bomb Laying!"
        }, "Wiring Bomb..."] call ace_common_fnc_progressBar
    }, {
          call hoppers_fnc_canLayBomb
    },{},nil,"",3,[false,false,false,false,false]
] call ace_interact_menu_fnc_createAction;

[_boss, 1, ["ACE_SelfActions"], _layBomb] call ace_interact_menu_fnc_addActionToObject;


private _extractionStart = [
    "extractionStart",
    "Start Extraction (cancel bomb tasks)",
    "",
    {
        hintSilent "Possible extraction points marked on map. Boss is marked for Blufor now.";

        
        [player] remoteExec ["hoppers_fnc_extractionStart", 2];
        
    }, {
          !(player getVariable ["hoppers_countdownStarted", false]) && 
          missionNamespace getVariable ["hoppers_missionPhase", 0] >= HOPPERS_BOMBS_MIN_PLACED && 
          missionNamespace getVariable ["hoppers_missionPhase", 0] < 9999
    },{},nil,"",3,[false,false,false,false,false]
] call ace_interact_menu_fnc_createAction;

[_boss, 1, ["ACE_SelfActions"], _extractionStart] call ace_interact_menu_fnc_addActionToObject;
