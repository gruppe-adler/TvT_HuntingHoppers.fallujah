{
    // [getMarkerPos _x, getMarkerSize _x] call hoppers_fnc_mapreplaceBuildings;
    [getMarkerPos _x, getMarkerSize _x] call hoppers_fnc_mapreplacePlants;
    _x setMarkerAlpha 0;
} forEach 
[
    "mrk_replacement_1",
    "mrk_replacement_2",
    "mrk_replacement_3",
    "mrk_replacement_4",
    "mrk_replacement_5",
    "mrk_replacement_6",
    "mrk_replacement_7",
    "mrk_replacement_8"
];
