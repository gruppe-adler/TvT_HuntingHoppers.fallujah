if (side player == west) then {
    player addEventHandler ["GetInMan", {
        params ["_unit", "_role", "_vehicle", "_turret"];

        if (_vehicle isKindOf "Air" && _role == "gunner") then {
            [_vehicle] call hoppers_fnc_melbScan;
        };
    }];

    player addEventHandler ["GetOutMan", {
        params ["_unit", "_role", "_vehicle", "_turret"];

        private _3dhandle = player getVariable ["hoppers_3ddrawHandler", -1];
        private _uihandle = player getVariable ["hoppers_uidrawHandler", -1];

        if (_3dhandle > -1) then {
            removeMissionEventHandler ["Draw3D", _3dhandle];
        };
        if (_uihandle > -1) then {
            [_uihandle] call CBA_fnc_removePerFrameHandler;
        };
    }];
};