class specOps: ind_pmc_special {
    class AllUnits: AllUnits {
        uniform = "rhs_uniform_cu_ocp";
        vest = "rhsusf_spcs_ocp_rifleman";
        backpack = "";
        headgear[] = {"rhsusf_opscore_mc_cover_pelt", "rhsusf_opscore_mc_cover_pelt_cam", "rhsusf_opscore_mc_pelt", "rhsusf_opscore_mc_pelt_nsw", "rhsusf_mich_bare_norotos_alt_tan"};
        primaryWeapon = "rhs_weap_hk416d10_LMT";
        primaryWeaponMagazine = "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_red"
        primaryWeaponOptics[] = {"optic_holosight_blk_f", "optic_erco_blk_f", "rhsusf_acc_g33_xps3", "rhsusf_acc_g33_t1", "rhsusf_acc_acog_rmr", "rhsusf_acc_compm4", "rhsusf_acc_eotech_552", ""};
        primaryWeaponPointer = "";
        primaryWeaponMuzzle = "";
        primaryWeaponUnderbarrel = "";
        primaryWeaponUnderbarrelMagazine = "";
        secondaryWeapon = "";
        secondaryWeaponMagazine = "";
        handgunWeapon = "rhsusf_weap_glock17g4";
        handgunWeaponMagazine = "rhsusf_mag_17Rnd_9x19_FMJ";
        binoculars = "Binocular";
        map = "ItemMap";
        compass = "ItemCompass";
        watch = "ItemWatch";
        gps = "ItemGPS";
        radio = "TFAR_anprc152";
    };

    class Type: Type {
        //rifleman
        class Soldier_F {
            addItemsToUniform[] = {
              "ACE_MapTools",
              "ACE_EntrenchingTool",
              "ACE_epinephrine",
              "ACE_Flashlight_MX991",
              LIST_6("ACE_fieldDressing"),
              LIST_2("ACE_tourniquet"),
              LIST_2("ACE_splint"),
              LIST_2("ace_morphine")

            };
            addItemsToVest[] = {
              LIST_8("rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_red"),
              LIST_2("rhsusf_mag_17Rnd_9x19_FMJ"),
              LIST_2("rhs_mag_an_m8hc"),
              LIST_2("rhs_mag_m67"),
              "rhs_mag_m18_green"

            };
        };

        //autorifleman
        class soldier_AR_F: Soldier_F {
          vest = "rhsusf_spcs_ocp_saw";
          backpack = "rhsusf_assault_eagleaiii_ocp";
          primaryWeapon = "rhs_weap_m249_pip_S";
          primaryWeaponMagazine = "rhsusf_200Rnd_556x45_mixed_soft_pouch"
          primaryWeaponOptics[] = {"optic_holosight_blk_f", "optic_erco_blk_f", "rhsusf_acc_g33_xps3", "rhsusf_acc_g33_t1", "rhsusf_acc_acog_rmr", "rhsusf_acc_compm4", "rhsusf_acc_eotech_552", ""};
            
            addItemsToUniform[] = {
              "ACE_MapTools",
              "ACE_EntrenchingTool",
              "ACE_epinephrine",
              "ACE_Flashlight_MX991",
              LIST_6("ACE_fieldDressing"),
              LIST_2("ACE_tourniquet"),
              LIST_2("ACE_splint"),
              LIST_2("ace_morphine")

            };
            addItemsToVest[] = {
              LIST_2("rhsusf_200Rnd_556x45_mixed_soft_pouch"),
              LIST_2("rhsusf_mag_17Rnd_9x19_FMJ"),
              "rhs_mag_an_m8hc"

            };
            addItemsToBackpack[] = {
              LIST_5("rhsusf_200Rnd_556x45_mixed_soft_pouch")
            
            };

        };

        //light AT
        class soldier_LAT_F: Soldier_F {
          secondaryWeapon = "rhs_weap_M136";

        };

        //ammo bearer
        class Soldier_A_F: Soldier_A_F {
        };

        //assistant autorifleman
        class soldier_AAR_F: Soldier_F {
          backpack = "rhsusf_assault_eagleaiii_ocp";
            
            addItemsToBackpack[] = {
              LIST_5("rhsusf_200Rnd_556x45_mixed_soft_pouch")
            
            };

        };

        //medic
        class medic_F: Soldier_F {
          vest = "rhsusf_spcs_ocp_medic";
          backpack = "grad_kitbag_tan_medic";
            addItemsToVest[] = {
              LIST_8("rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_red"),
              LIST_2("rhsusf_mag_17Rnd_9x19_FMJ"),
              LIST_2("rhs_mag_an_m8hc"),
              LIST_2("rhs_mag_m67"),
              "rhs_mag_m18_green"

            };
            
            addItemsToBackpack[] = {
              LIST_20("ACE_fieldDressing"),
              LIST_10("ACE_epinephrine"),
              LIST_10("ace_morphine"),
              LIST_8("ACE_tourniquet"),
              LIST_8("ACE_splint"),
              "ACE_surgicalKit"
            
            };
        };

        //squad leader
        class Soldier_SL_F: Soldier_F {
          backpack = "TFAR_rt1523g_big_rhs";
          addItemsToBackpack[] = {
            LIST_8("ACE_fieldDressing")
            };


        };

        //team leader
        class Soldier_TL_F: Soldier_TL_F {
        };

        // pilot
        class pilot_F: Soldier_TL_F {
            headgear[] = {"rhsusf_hgu56p_visor_mask_black", "rhsusf_hgu56p_visor_black", "rhsusf_hgu56p_visor_mask_Empire_black", "rhsusf_hgu56p_visor_mask_mo"};
            vest = "rhsusf_spcs_ocp_crewman";
            backpack = "";
            addItemsToVest[] = {
              LIST_4("rhs_mag_30Rnd_556x45_M855A1_PMAG_Tracer_red"),
              LIST_2("rhsusf_mag_17Rnd_9x19_FMJ"),
              LIST_2("rhs_mag_an_m8hc"),
              LIST_2("rhs_mag_m18_green")

            };
        };
    };

    class Rank: Rank {
        class LIEUTENANT: LIEUTENANT {
            headgear = "H_MilCap_gry";
            backpack = "TFAR_rt1523g_big_rhs";
        };
    };
};
