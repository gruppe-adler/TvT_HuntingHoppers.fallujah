params ["_object"];


private _bombTrigger = [
    "triggerBomb",
    "Start Bomb Countdown (30s)",
    "",
    {
        hintSilent "Bomb Trigger Set (30s)";

        [_object] remoteExec ["hoppers_fnc_bombCountDown", 2];
        };
    }, {
        true
    },{},nil,"",3,[false,false,false,false,false]
] call ace_interact_menu_fnc_createAction;

{
    [_bus, 0, ["ACE_MainActions", "ace_refuel_Refuel"], _x] call ace_interact_menu_fnc_addActionToObject;
} forEach [_fillCargoTankAction, _returnNozzleAction, _refuelReplacementAction];

[_object, 0, ["ACE_MainActions"], _bombTrigger] call ace_interact_menu_fnc_addActionToObject;
