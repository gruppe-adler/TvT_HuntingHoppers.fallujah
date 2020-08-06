params ["_position"];

[_position,0.2,1,1,1,{100},7] call grad_gpsTracker_fnc_openTitle;

/*
params ["_target",
  ["_updateInterval",0.5],
  ["_size",1],
  ["_offsetX",1],
  ["_offsetY",1],
  ["_receptionCode",
    {
      params ["_unit","_target","_updateInterval"];
      private _reception = 1 - (_unit distance2D _target)/2000; _reception
    }],
  ["_duration",-1],["_showDistance",false]
];

*/
