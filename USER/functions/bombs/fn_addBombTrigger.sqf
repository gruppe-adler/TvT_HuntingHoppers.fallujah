params ["_boss"];

private _bombTrigger = [
    "triggerBomb",
    "Lay Bomb (Countdown 30s)",
    "",
    {
        hintSilent "Bomb Trigger Set (30s)";

        if (position player inArea "mrk_bombArea") then {
            player playMoveNow "Acts_carFixingWheel";
            [30, [], {
                [player] remoteExec ["hoppers_fnc_bombCountDown", 2];
            }, {
                hint "Aborted Bomb Laying!"
            }, "Wiring Bomb..."] call ace_common_fnc_progressBar
            
        } else {
            hintSilent "must be in bomb area marker";
        };
    }, {
          call hoppers_fnc_canLayBomb
    },{},nil,"",3,[false,false,false,false,false]
] call ace_interact_menu_fnc_createAction;

[_boss, 1, ["ACE_SelfActions"], _bombTrigger] call ace_interact_menu_fnc_addActionToObject;

private _extractionStart = [
    "extractionStart",
    "Start Extraction (cancel bomb tasks)",
    "",
    {
        hintSilent "Possible extraction points marked on map. Boss is marked for Blufor now.";

        
        [player] remoteExec ["hoppers_fnc_extractionStart", 2];
        
    }, {
          !(player getVariable ["hoppers_countdownStarted", false]) && 
          missionNamespace getVariable ["hoppers_missionPhase", 0] > HOPPERS_BOMBS_MIN_PLACED && 
          missionNamespace getVariable ["hoppers_missionPhase", 0] < 9999
    },{},nil,"",3,[false,false,false,false,false]
] call ace_interact_menu_fnc_createAction;

[_boss, 1, ["ACE_SelfActions"], _extractionStart] call ace_interact_menu_fnc_addActionToObject;
