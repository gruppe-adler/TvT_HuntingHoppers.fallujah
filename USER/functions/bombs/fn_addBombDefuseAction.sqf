params ["_bomb"];

private _defuseBomb = [
    "defuseBomb",
    "Defuse Bomb (" + str HOPPERS_BOMBS_DEFUSE_TIME + " s)",
    "",
    {
        params ["_target", "_player", "_params"];
        _params params ["_bomb"];

        // systemChat str _bomb;
            [HOPPERS_BOMBS_DEFUSE_TIME, [_bomb], {
                params ["_bomb"];
                _bomb remoteExec ["hoppers_fnc_bombDefuse", 2];
            }, {
                hint "Aborted Bomb Defusing!"
            }, "Defusing Bomb..."] call ace_common_fnc_progressBar
    }, {
         true
    },nil,[_bomb]
] call ace_interact_menu_fnc_createAction;

[_bomb, 0, ["ACE_MainActions"], _defuseBomb] call ace_interact_menu_fnc_addActionToObject;