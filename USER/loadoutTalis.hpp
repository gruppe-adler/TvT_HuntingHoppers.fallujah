class ind_me_talis: ind_eastern_nationalists {
    class AllUnits {
        uniform = "LOP_U_AM_Fatigue_01_3";
    };

    class Type {
        //rifleman
        class Soldier_F {
            addItemsToUniform[] = {
                LIST_10("rhsgref_5Rnd_762x54_m38"),
                "rhs_mag_rgo",
                "rhs_mag_rdg2_white"
            };
        };

        //autorifleman
        class Soldier_AR_F: Soldier_F {
            uniform = "LOP_U_AM_Fatigue_02_5";
            headgear = "LOP_H_Shemag_TAN";
        };

        //light AT
        class Soldier_LAT_F: Soldier_F {
            uniform = "LOP_U_AM_Fatigue_01_5";
            headgear = "H_ShemagOpen_khk";
        };

        //ammo bearer
        class Soldier_A_F: Soldier_F {
            uniform = "LOP_U_AM_Fatigue_02_6";
            vest = "LOP_6sh46";
            headgear = "LOP_H_Shemag_BLK";
        };

        //assistant autorifleman
        class Soldier_AAR_F: Soldier_F {
            uniform = "LOP_U_AM_Fatigue_02_6";
            vest = "LOP_6sh46";
            headgear = "LOP_H_Shemag_BLK";
        };

        //medic
        class Medic_F: Soldier_F {
            uniform = "LOP_U_AM_Fatigue_02_2";
            vest = "LOP_6sh46";
            headgear = "LOP_H_Pakol";
        };

        //squad leader
        class Soldier_SL_F: Soldier_F {
            binoculars = "Binocular";
            uniform = "LOP_U_AM_Fatigue_02";
            headgear = "LOP_H_Turban_mask";
        };

        //team leader
        class Soldier_TL_F: Soldier_F {
            binoculars = "Binocular";
            uniform = "LOP_U_AM_Fatigue_01";
            headgear = "LOP_H_Pakol";
            goggles = "rhs_scarf";
        };
    };

    class Rank {
        class LIEUTENANT {

        };
    };
};
