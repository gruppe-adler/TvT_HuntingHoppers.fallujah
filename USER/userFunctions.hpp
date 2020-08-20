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


           class addBoss;
           class addCivilianPenalty;
           class addMarkersEast;

           class areaBarCreate;
           class areaBarGetColor;
           class areaBarShow;

           class civilianAddWeapon;

           class createMarker;
           class eventListener { postInit = 1; };
           class extractionStart;
           class fadeMarker;
           class findRandomPos;

           class init { postInit = 1; };

           class showTracker;

           class tasksInitBlufor;
           class tasksInitOpfor;
           class winConditions;
       };

       class bombs {
            file = "USER\functions\bombs";

            class addBombTrigger;
            class bombCountDown;
            class canLayBomb;
            class createBombMarker;
            class selectBombSpots { preInit = 1; };
       };

       class melbScan {
            file = "USER\functions\melbScan";

            class melbFadeMarker;
            class melbScan;
            class melbScanMan;
            class melbMarkBoss;
            class melbMarkLocal;
       };

       class mapReplacements {
            file = "USER\functions\mapReplacements";

            class mapreplaceBuildings;
            class mapreplacePlants;
            class replacementInit { postInit = 1; };
       };
   };
