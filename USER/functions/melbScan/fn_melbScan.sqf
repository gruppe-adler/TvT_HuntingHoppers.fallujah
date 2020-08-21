/*

    [vehicle player] call hoppers_fnc_melbScan;

*/

params ["_vehicle"];

HOPPERS_LASERBATTERY_FILL_RATE = 0.01;
HOPPERS_LASERBATTERY_DRAIN_RATE = 0.02;
HOPPERS_BOSS_MARKING_FADEOUT = 20; // time 3d marker and map markers are shown

hoppers_fnc_createCoolDownBar = {

    private _text = (uiNamespace getVariable "MELB_FLIRCtrl") ctrlCreate ["RscText", -1];
    _text ctrlSetPosition [
        (SafezoneX + ((SafezoneW - SafezoneH) / 2)) + 3*   (0.01875 * SafezoneH),
        safeZoneY + (14.3 *   (0.025 * SafezoneH)),
        13 *   (0.01875 * SafezoneH),
        2 *   (0.025 * SafezoneH)
    ];
    _text ctrlSetFontHeight (0.0255*SafezoneH);
    _text ctrlSetText "....................";
    _text ctrlCommit 0;
    _text
};

/*

safeZoneX + SafeZoneW + (3*   (0.01875 * SafezoneH)), 
        safeZoneY + (14.1 *   (0.025 * SafezoneH)), 
        13 *   (0.01875 * SafezoneH), 
        2 *   (0.025 * SafezoneH) 
    ]; _text ctrlCommit 0;

*/

private _coolDownBar = call hoppers_fnc_createCoolDownBar;


[{
    params ["_args", "_handle"];
    _args params ["_vehicle", "_coolDownBar"];

    private _laserBatteryStatus = _vehicle getVariable ["hoppers_laserBattery", 1];
    private _overheated = _vehicle getVariable ["hoppers_laserOverheated", false];
    private _color = if (_laserBatteryStatus > 0.5) then {
        "colorGreen"
    } else {
        if (_laserBatteryStatus > 0.25) then {
            "colorYellow"
        } else {
            if (_laserBatteryStatus > 0) then {
                "colorOrange"
            } else {
                "colorRed"
            };
        };
    };

    private _characterAmount = linearConversion [1, 0, _laserBatteryStatus, 0, 20, true];
    private _string = ["||||||||||||||||||||", 0, _characterAmount] call BIS_fnc_trimString;
    private _stringCoolDown = ["||||||||||||||||||||", 0, _characterAmount] call BIS_fnc_trimString;

    _color = (configfile >> "CfgMarkerColors" >> _color >> "color") call BIS_fnc_colorConfigToRGBA;

    if (isLaserOn _vehicle && !(_vehicle getVariable ["hoppers_laserOverheated", false])) then {
        if (_laserBatteryStatus > 0) then {
            _laserBatteryStatus = _laserBatteryStatus - HOPPERS_LASERBATTERY_DRAIN_RATE;
            playSound "ZoomIn";
        } else {
            playSound "Beep_Target";
        };
        if (ctrlShown _coolDownBar) then {
            // _coolDownBar ctrlShow false;
        };

        if (_laserBatteryStatus > 0) then {
            [cursorTarget] call hoppers_fnc_melbScanMan;
        } else {
            _vehicle setVariable ["hoppers_laserOverheated", true];
        };
    } else {
        if (_laserBatteryStatus < 1) then {
            _laserBatteryStatus = _laserBatteryStatus + HOPPERS_LASERBATTERY_FILL_RATE;
            playSound "ZoomOut";
        } else { 
            _vehicle setVariable ["hoppers_laserOverheated", false];
        };
        if (!(ctrlShown _coolDownBar)) then {
            // _coolDownBar ctrlShow true;
        };
    };

    // (uiNamespace getVariable "MELB_FLIRCtrl" displayCtrl 158) ctrlsetText _string;
    // (uiNamespace getVariable "MELB_FLIRCtrl" displayCtrl 158) ctrlSetTextColor _color;

    _coolDownBar ctrlsetText _stringCoolDown;
    _coolDownBar ctrlSetTextColor _color;
    _coolDownBar ctrlCommit 0;

    _vehicle setVariable ["hoppers_laserBattery", _laserBatteryStatus];

}, 0.1, [_vehicle, _coolDownBar]] call CBA_fnc_addPerFrameHandler;


private _drawEH = addMissionEventHandler ["Draw3D", {

    private _nearEntities = player getVariable ["hoppers_drawEntities", []];
    private _lastPing = player getVariable ["hoppers_lastPing", 0];

    {
        private _position = ASLToAGL getPosASL _x;
        _position params ["_xPos", "_yPos", "_zPos"];

        private _colorR = 1;
        private _colorG = .2;
        private _colorB = .2;
        private _alpha = 0;

        drawIcon3D [getMissionPath "USER\data\flare.paa", [_colorR, _colorG, _colorB, linearConversion [0, HOPPERS_BOSS_MARKING_FADEOUT, CBA_missionTime - _lastPing, 1, 0, true]], [_xPos, _yPos, _zPos + 1] , 2, 2, 0, "", 0, 0.05, "TahomaB", "center", true];
    } forEach _nearEntities;

}];
