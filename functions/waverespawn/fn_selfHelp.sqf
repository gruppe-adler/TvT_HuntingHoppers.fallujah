["ff",{
    params ["_commandType"];

    private _availableCommands = [
        "respawn"
    ];

    private _fnc_default = {
        systemChat format ["%1 is not a ff chatcommand.",_commandType];
        systemChat format ["Available commands are %1",_availableCommands];
    };

    private _fnc_respawn = {
            if (!(player getVariable ["ace_spectator_isSet", false])) exitWith { systemChat "You are not dead."; };
            player setVariable ["wr_interrupted", false];
            [] call GRAD_waverespawn_fnc_prepareRespawn;
    };

    switch (toLower _commandType) do {
        case ("respawn"): _fnc_respawn;
        default _fnc_default;
    };

},"all"] call CBA_fnc_registerChatCommand;