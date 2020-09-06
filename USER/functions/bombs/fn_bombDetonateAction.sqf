params ["_bomb"];

private _bombTrigger = [
    "triggerBomb",
    "Trigger Bomb",
    "",
    {
        params ["_target", "_player", "_params"];
        _params params ["_bomb"];

        if (!(_bomb getVariable ["hoppers_bombReadyToDetonate", false])) then {
            hintSilent "Not ready to detonate yet!";
        } else {
            if (_player distance _bomb < HOPPERS_BOMBS_CLACKERRANGE) then {
               [_bomb] remoteExec ["hoppers_fnc_bombDetonate", 2];
            } else {
                hintSilent "Out of range!";
            };
        };
    }, {
        params ["_target", "_player", "_params"];
        _params params ["_bomb"];
        !isNull _bomb
    },{},[_bomb],"",3,[false,false,false,false,false]
] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions"], _bombTrigger] call ace_interact_menu_fnc_addActionToObject;