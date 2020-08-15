class ger_ksk: ger_heer_d {
    class AllUnits: AllUnits {
        uniform = "SMM_Uniform_BW_TT";
        vest = "SMM_Vest_BW_TT";
        headgear = "SMM_Helmet_A_BW_TT";
        nvgoggles = "";
        goggles[] = {"G_Bandanna_tan", "rhsusf_shemagh2_grn", "rhsusf_shemagh2_od", "rhsusf_shemagh2_tan"};
        gps = "itemGPS";
        addItemsToUniform[] = {
            LIST_6("ACE_fieldDressing"),
            LIST_2("ACE_morphine"),
            LIST_2("ACE_Chemlight_HiWhite"),
            "ACE_epinephrine",
            "ACE_Flashlight_MX991",
            "ACE_MapTools"
        };
    };

    class Type: Type {
        //rifleman
        class Soldier_F: Soldier_F {
            addItemsToUniform[] = {
                LIST_6("ACE_fieldDressing"),
                LIST_2("ACE_morphine"),
                LIST_2("ACE_Chemlight_HiWhite"),
                "ACE_epinephrine",
                "ACE_Flashlight_MX991",
                "ACE_MapTools"
            };
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
            primaryWeapon = "rhs_weap_g36kv";
            addItemsToBackpack[] = {
                LIST_10("ACE_fieldDressing")
            };
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
            goggles[] = {"rhsusf_shemagh2_gogg_grn", "rhsusf_shemagh2_gogg_od", "rhsusf_shemagh2_gogg_tan"};
        };
    };

    class Rank: Rank {
        class LIEUTENANT: LIEUTENANT {
            headgear = "SMM_MilCap_BW_TT";
            backpack = "TFAR_rt1523g_big_bwmod_tropen";
        };
    };
};
