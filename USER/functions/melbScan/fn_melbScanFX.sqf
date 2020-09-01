params ["_centerPos"];

_centerPos set [2, 2];

for "_i" from 1 to 360 do {
    private _vector = _centerPos vectorFromTo (_centerPos getPos [1, _i]);
    _vector = _vector vectorMultiply 150;
    _vector set [2,10];
    // systemChat str _vector;
    private _source01 = "#particlesource" createVehicleLocal _centerPos;
    /*
    _source01 setParticleParams [
        ["\A3\data_f\ParticleEffects\Universal\Meat_ca.p3d", 1, 0, 1], "", "SpaceObject", 1, 6, 
        _centerPos, [2, 2, 5], 0, 1, 0.2, 0.075, [10,10], [[1,1,1,1], [1,1,1,1]], 
        [0.08], 0, 0, "", "", _this,0,true,0.1,
        [[1,1,1,0]],
        _vector
    ];  
    */
    // model = "\A3\Structures_F_Bootcamp\VR\Helpers\VR_Sector_01_60deg_50_F.p3d";
    
   

    _source01 setParticleParams [
        ["\A3\data_f\ParticleEffects\Universal\Refract",1,0,1], "", "Billboard", 0.5, 3, 
        [0,0,1], _vector, 0, 1, 0.2, 0, [1,20], [[1,1,1,1],[0,0,0,0]], 
        [0.08], 1, 0, "", "", _this,0,false,0, [[1,1,1,0]],
        _vector
    ];   
    /* // sector wifi symbol
    _source01 setParticleParams [
        ["\A3\Structures_F_Bootcamp\VR\Helpers\VR_Sector_01_60deg_50_F.p3d", 1, 0, 1], "", "SpaceObject", 0.5, 3, 
        [0,0,1], _vector, 0, 1, 0.2, 0, [0,5], [[1,1,1,1],[0,0,0,0]], 
        [0.08], 1, 0, "", "", _this,0,false,0, [[1,1,1,0]],
        _vector
    ];   
    */

    // systemChat str _source01;

    /*
    _source01 setParticleParams [
        ["\A3\data_f\ParticleEffects\Universal\Refract",1,0,1],
        "", 
        "Billboard",
        1,
        3,
        _centerPos, 
        [0,0,0], 
        0,
        1,
        1,
        0.1,
        [5,5], 
        [[0,0,0,1], [0,0,0,1]], 
        [0], 
        0,
        0,
        "", 
        "", 
        _source01, 
        0, 
        true,
        0,
        [[1,1,1,0]],
        _vector
    ];
    */
    _source01 setDropInterval 1;

    [{ params ["_source"]; deleteVehicle _source; }, [_source01], 0.2] call CBA_fnc_waitAndExecute;
};