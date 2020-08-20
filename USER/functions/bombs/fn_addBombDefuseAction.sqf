params ["_bomb"];

private _defuseBomb = [
    "defuseBomb",
    "Defuse Bomb (10s)",
    "",
    {
        [10, [], {
                params ["_target", "_player", "_params"];
                [_target] remoteExec ["hoppers_fnc_bombDefuse", 2];
            }, {
                hint "Aborted Bomb Defusing!"
            }, "Defusing Bomb..."] call ace_common_fnc_progressBar
    }, {
         true
    },{},nil,"",3,[false,false,false,false,false]
] call ace_interact_menu_fnc_createAction;

[_bomb, 1, ["ACE_SelfActions"], _defuseBomb] call ace_interact_menu_fnc_addActionToObject;