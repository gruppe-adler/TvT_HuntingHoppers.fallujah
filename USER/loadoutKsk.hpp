class ger_ksk: ger_heer_d {
    class AllUnits: AllUnits {
        uniform = "SMM_Uniform_BW_TT";
        vest = "SMM_Vest_BW_TT";
        headgear = "SMM_Helmet_A_BW_TT";
    };

    class Type: Type {
        //rifleman
        class Soldier_F: Soldier_F {

        };

        //autorifleman
        class Soldier_AR_F: Soldier_AR_F {

        };

        //light AT
        class Soldier_LAT_F: Soldier_LAT_F {

        };

        //ammo bearer
        class Soldier_A_F: Soldier_A_F {
        };

        //assistant autorifleman
        class Soldier_AAR_F: Soldier_A_F {
        };

        //medic
        class Medic_F: Medic_F {
        };

        //squad leader
        class Soldier_SL_F: Soldier_SL_F {

        };

        //team leader
        class Soldier_TL_F: Soldier_TL_F {
        };

        // pilot
        class pilot_F: Soldier_TL_F {
            uniform = "gm_ge_army_uniform_pilot_oli";
            headgear = "gm_ge_headgear_sph4_oli";
            vest = "gm_pl_army_vest_80_crew_gry";
            backpack = "";
        };
    };

    class Rank: Rank {
        class LIEUTENANT: LIEUTENANT {
            headgear = "SMM_MilCap_BW_TT";
            backpack = "TFAR_rt1523g_big_bwmod_tropen";
        };
    };
};
