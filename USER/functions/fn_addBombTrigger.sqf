params ["_object"];

private _bombTrigger = [
    "triggerBomb",
    "Start Bomb Countdown (30s)",
    "",
    {
        hintSilent "Bomb Trigger Set (30s)";
        [_target] remoteExec ["hoppers_fnc_bombCountDown", 2];
    }, {
        side _player == east
    },{},nil,"",3,[false,false,false,false,false]
] call ace_interact_menu_fnc_createAction;

[_object, 0, ["ACE_MainActions"], _bombTrigger] call ace_interact_menu_fnc_addActionToObject;
