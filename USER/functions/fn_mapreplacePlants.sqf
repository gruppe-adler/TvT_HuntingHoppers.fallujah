if (!isServer) exitWith {};

params ["_position", "_size"];
_size params ["_sizeA", "_sizeB"];

private _typeArray =
["palm_01.p3d",
"palm_02.p3d",
"palm_03.p3d",
"palm_04.p3d",
"palm_05.p3d",
"palm_10.p3d"];

private _replacementArray =
["a3\vegetation_f_exp\tree\t_CocosNucifera3s_tall_F.p3d",
"a3\vegetation_f_exp\tree\t_Cyathea_F.p3d",
"a3\vegetation_f_exp\tree\t_Cocos_tall_F.p3d",
"a3\vegetation_f_exp\tree\t_CocosNucifera2s_small_F.p3d",
"a3\vegetation_f_exp\tree\t_Cocos_small_F.p3d",
"a3\vegetation_f_exp\tree\t_CocosNucifera3s_tall_F.p3d"];

private _simpleObject = true;


/*
 DO NOT EDIT BELOW
*/

private _trees = nearestTerrainObjects [_position, ["TREE", "SMALL TREE"], _sizeA];



private _count = 0;
private _time = time;


{
	private _tree = _x;
	private _pos = getPosATL _tree;
	private _dir = getDir _tree;

	{
	   if ((getModelInfo _tree) select 0 == _x) then {
  			_tree hideObjectGlobal true;
        _tree enableSimulationGlobal false;

  			if (_simpleObject) then {
  				_replacementTree = createSimpleObject [_replacementArray select _forEachIndex, _pos];
  				_onGround = [getPosATL _replacementTree select 0, getPosATL _replacementTree select 1 , 0];
  				_replacementTree setPosATL _onGround;
  				_replacementTree setDir (random 360);
  			} else {
  				_replacementTree = createVehicle [_replacementArray select _forEachIndex, _pos, [], 0, "CAN_COLLIDE"];
  				_replacementTree setDir _dir;
  				_replacementTree enableSimulationGlobal false;
  			};
		};

		_count = _count + 1;
	} forEach _typeArray;

} count _trees;

diag_log format ["replacement script completed %2 trees in %1 seconds", time - _time, _count];
