params ["_boss"];

private _bombTrigger = [
    "triggerBomb",
    "Lay Bomb (Countdown 30s)",
    "",
    {
        hintSilent "Bomb Trigger Set (30s)";

        [_boss] remoteExec ["hoppers_fnc_bombCountDown", 2];
    }, {
          call hoppers_fnc_canLayBomb
    },{},nil,"",3,[false,false,false,false,false]
] call ace_interact_menu_fnc_createAction;

[_boss, 1, ["ACE_SelfActions"], _bombTrigger] call ace_interact_menu_fnc_addActionToObject;
