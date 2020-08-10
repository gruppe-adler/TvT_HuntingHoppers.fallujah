/*  Hier können eigene Funktionen eingebunden werden.
*   Ist in CfgFunctions included.
*/

#include "..\node_modules\grad-dyngroupdecals\cfgFunctions.hpp"
#include "..\node_modules\grad-gpsTracker\cfgFunctions.hpp"
#include "..\node_modules\grad-vehicleRespawn\cfgFunctions.hpp"


class hoppers
   {
       class all
       {
           file = "USER\functions";

           class addBombTrigger;
           class addBoss;
           class addCivilianPenalty;
           class addMarkersEast;

           class areaBarCreate;
           class areaBarGetColor;
           class areaBarShow;

           class bombCountDown;
           class canLayBomb;
           class civilianAddWeapon;

           class createBombMarker;
           class createMarker;
           class eventListener { postInit = 1; };
           class extractionStart;
           class fadeMarker;
           class findRandomPos;

           class init { postInit = 1; };

           class mapreplaceBuildings;
           class mapreplacePlants;
           class replacementInit { postInit = 1; };

           class showTracker;

           class tasksInitBlufor;
           class tasksInitOpfor;
           class winConditions;
       };
   };
