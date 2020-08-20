if (!isServer) exitWith {};

params ["_position", "_size"];
_size params ["_sizeA", "_sizeB"];

private _buildings = [
	"dum_olez_istan2_maly2.p3d",
	"dum_istan3.p3d",
	"dum_istan3_pumpa.p3d",
	"dum_istan4.p3d",
	"dum_istan4_inverse.p3d",
	"dum_istan4_big.p3d",
	"dum_istan4_big_inverse.p3d",
	"dum_istan3_pumpa.p3d",
	"dum_mesto3_istan.p3d",
	"a_buildingwip.p3d",
	"dum_istan2_02.p3d",
	"dum_istan3_hromada2.p3d",
	"dum_istan3_hromada.p3d"
];

private _buildingReplacements = [
	"land_ffaa_casa_urbana_2",
	"land_ffaa_casa_urbana_7",
	"land_ffaa_casa_urbana_2",
	"land_ffaa_casa_sha_3",
	"land_ffaa_casa_sha_3",
	"land_ffaa_casa_sha_3",
	"land_ffaa_casa_sha_3",
	"land_ffaa_casa_urbana_3",
	"land_ffaa_casa_urbana_1",
	"land_ffaa_casa_urbana_8",
	"land_ffaa_casa_urbana_7A",
	"land_ffaa_casa_sha_1",
	"land_ffaa_casa_sha_2"
];

private _count = 0;
private _time = time;


private _arrayOfBuildings = nearestTerrainObjects [_position, ["HOUSE", "BUILDING"], _sizeA];

{
	private _oldBuilding = _x;
	private _model = (getModelInfo _oldBuilding) select 0;
	private _index = _buildings find _model;

	if (_index < 0) then { diag_log ("skipping building" + str _model); } else {
	private _replacementType = _buildingReplacements select _index;
	private _pos = getPosATL _oldBuilding;
	private _dir = getDir _oldBuilding;

	if (_replacementType == "land_ffaa_casa_urbana_1") then {
		_dir = _dir + 90;
	};


	hideObjectGlobal _oldBuilding;
  	_oldBuilding enableSimulationGlobal false;

	private _newBuilding = createVehicle [_replacementType, _pos, [], 0, "NONE"];
	_newBuilding setDir _dir;
	_newBuilding enableSimulationGlobal false;
	_count = _count + 1;
	};
} forEach _arrayOfBuildings;



diag_log format ["replacement script completed %2 buildings in %1 seconds", time - _time, _count];
