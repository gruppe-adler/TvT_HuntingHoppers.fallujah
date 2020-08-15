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

    markerInterval[] = {10,10};
    markerFadeout = 11;
};

class GRAD_vehicleRespawn {
    class gm_ge_army_bo105p1m_vbh_swooper {
        customCode = "(_this select 0) addMagazineCargoGlobal ['rhssaf_30rnd_556x45_EPR_G36', 20]; (_this select 0) addMagazineCargoGlobal ['rhs_200rnd_556x45_T_SAW', 20];"; // _this select 0 is the vehicle
    };

    class C_Van_02_transport_F {
        customCode = "(_this select 0) addMagazineCargoGlobal ['rhs_30Rnd_545x39_AK', 20]; (_this select 0) addMagazineCargoGlobal ['rhs_100Rnd_762x54mmR_green', 20];"; // _this select 0 is the vehicle
    };

    class C_Offroad_01_F {
        customCode = "(_this select 0) addMagazineCargoGlobal ['rhs_30Rnd_545x39_AK', 20]; (_this select 0) addMagazineCargoGlobal ['rhs_100Rnd_762x54mmR_green', 20];"; // _this select 0 is the vehicle
    };

    class C_Van_01_transport_F {
        customCode = "(_this select 0) addMagazineCargoGlobal ['rhs_30Rnd_545x39_AK', 20]; (_this select 0) addMagazineCargoGlobal ['rhs_100Rnd_762x54mmR_green', 20];"; // _this select 0 is the vehicle
    };

    class C_Offroad_02_unarmed_F {
        customCode = "(_this select 0) addMagazineCargoGlobal ['rhs_30Rnd_545x39_AK', 20]; (_this select 0) addMagazineCargoGlobal ['rhs_100Rnd_762x54mmR_green', 20];"; // _this select 0 is the vehicle
    };
};