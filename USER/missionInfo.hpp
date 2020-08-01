/*  Allgemeine Info über die Mission.
*   Ist in description.ext eingebunden, kann also auch für andere Configs benutzt werden.
*/

author = "nomisum für Gruppe Adler";                                               //Missionsersteller (Du)
onLoadName = "H U N T I N G   H O P P E R S";                                                    //Name der Mission
onLoadMission = "";                                                             //Beschreibung der Mission (wird im Ladebildschirm unterhalb des Ladebildes angezeigt)
loadScreen = "USER\data\loading.paa";                                                //Ladebild

class cfgMission {
    markerVariance_1 = 1000;
    markerVariance_2 = 500;
    markerVariance_3 = 250;
    markerVariance_4 = 150;
    markerVariance_5 = 0;

    markerInterval[] = {5,10};
    markerFadeout = 100;
};