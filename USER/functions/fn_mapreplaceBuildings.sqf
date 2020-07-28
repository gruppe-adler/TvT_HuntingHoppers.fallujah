if (!isServer) exitWith {};

params ["_position", "_size"];

private _buildingReplacements = [
["Land_Dum_mesto3_istan", "Land_House_C_10_EP1"],
["Land_Dum_istan1","Land_Dum_olez_istan1_open2"],
["Land_Dum_istan2", "Land_House_C_12_EP1"],
["Land_Dum_istan3_pumpa", "Land_Unfinished_Building_01_F"],
["Land_Dum_olez_istan2_maly2", "Land_House_C_5_V2_EP1"],
["Land_Dum_olez_istan2_maly", "Land_Unfinished_Building_01_F"],
["Land_Dum_olez_istan2", "Land_House_C_4_EP1"],

["Land_Dum_istan4", "jbad_dum_istan4"]
];

private _count = 0;
private _time = time;

for "_i" from 0 to (count _buildingReplacements - 1) do {

	private _currentBuilding = _buildingReplacements select _i select 0;
	private _arrayOfBuildings = nearestObjects  [_position, [_currentBuilding], _size];

	{
    private _oldBuilding = _x;
		private _replacementType = _buildingReplacements select _i select 1;
		private _pos = getPosATL _oldBuilding;
		private _dir = getDir _oldBuilding;


    hideObjectGlobal _oldBuilding;
	  _oldBuilding enableSimulationGlobal false;

		private _newBuilding = createVehicle [_replacementType, _pos, [], 0, "NONE"];
		// _model = getText ( configFile >> "CfgVehicles" >> _replacementType >> "Model" );
		// _newBuilding = createSimpleObject [_model, _pos];
		_newBuilding setDir _dir;
		_newBuilding enableSimulationGlobal false;
		_count = _count + 1;
	} forEach _arrayOfBuildings;
};


diag_log format ["replacement script completed %2 buildings in %1 seconds", time - _time, _count];
