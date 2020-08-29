class specOps: ind_pmc_special {
    class AllUnits: AllUnits {
        uniform = "SMA_UNIFORMS_TAN";
        vest = "LOP_V_CarrierRig_TAN";
        headgear = "SMA_Helmet_Tan";
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
            uniform = "U_I_pilotCoveralls";
            headgear = "H_PilotHelmetHeli_B";
            vest = "SMM_Vest_BW_TT";
            backpack = "";
            goggles[] = {"rhsusf_shemagh2_gogg_grn", "rhsusf_shemagh2_gogg_od", "rhsusf_shemagh2_gogg_tan"};
        };
    };

    class Rank: Rank {
        class LIEUTENANT: LIEUTENANT {
            headgear = "H_MilCap_gry";
            backpack = "TFAR_rt1523g_big_bwmod_tropen";
        };
    };
};
