/*  Hier können eigene Funktionen eingebunden werden.
*   Ist in CfgFunctions included.
*/

class hoppers
   {
       class all
       {
           file = "USER\functions";

           class addBombSpot;
           class addBombTrigger;
           class addBoss;
           class addCivilianPenalty;
           class bombCountDown;
           class bombSpotInit;

           class createMarker;
           class eventListener { postInit = 1; };
           class fadeMarker;
           class findRandomPos;

           class init { postInit = 1; };

           class mapreplaceBuildings;
           class mapreplacePlants;
           class tasksInitBlufor;
           class tasksInitOpfor;
       };
   };
