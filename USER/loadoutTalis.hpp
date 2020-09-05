class ind_me_talis: ind_eastern_nationalists {
    class AllUnits {
        primaryWeapon = "rhs_weap_akm";
        primaryWeaponMagazine = "rhs_30Rnd_762x39mm_bakelite_tracer";
        primaryWeaponMuzzle = "rhs_acc_dtkakm";
        handgunWeapon = "rhsusf_weap_glock17g4";
        handgunWeaponMagazine = "rhsusf_mag_17Rnd_9x19_FMJ";
        primaryWeaponPointer = "";
        primaryWeaponUnderbarrel = "";
        primaryWeaponUnderbarrelMagazine = "";
        secondaryWeapon = "";
        secondaryWeaponMagazine = "";
        uniform = "LOP_U_AM_Fatigue_01_3";
        nvgoggles = "";
        headgear = "LOP_H_Pakol";
        binoculars = "Binocular";
        map = "ItemMap";
        compass = "ItemCompass";
        watch = "ItemWatch";
        gps = "ItemGPS";
        radio = "TFAR_fadak";
        addItemsToUniform[] = {
            LIST_6("ACE_fieldDressing"),
            LIST_2("ACE_morphine"),
            LIST_2("ACE_Chemlight_HiWhite"),
            "ACE_epinephrine",
            "ACE_Flashlight_MX991",
            "ACE_MapTools"
        };
    };

    class Type {
        //rifleman
        class Soldier_F {
            addItemsToUniform[] = {
                LIST_6("ACE_fieldDressing"),
                LIST_2("ACE_morphine"),
                LIST_2("ACE_Chemlight_HiWhite"),
                "ACE_epinephrine",
                "ACE_Flashlight_MX991",
                "ACE_MapTools",
                LIST_10("rhs_30Rnd_762x39mm_bakelite_tracer"),
                "rhs_mag_rgo",
                "rhs_mag_rdg2_white",
                LIST_2("rhsusf_mag_17Rnd_9x19_FMJ")
            };
        };

        //autorifleman
        class Soldier_AR_F: Soldier_F {
            addItemsToUniform[] = {
                LIST_6("ACE_fieldDressing"),
                LIST_2("ACE_morphine"),
                LIST_2("ACE_Chemlight_HiWhite"),
                "ACE_epinephrine",
                "ACE_Flashlight_MX991",
                "ACE_MapTools"
            };
            primaryWeapon = "rhs_weap_pkm";
            uniform = "LOP_U_AM_Fatigue_02_5";
            headgear = "LOP_H_Pakol";
            addItemsToVest[] = {
                "rhs_100Rnd_762x54mmR_green",
                "rhs_mag_f1"
            };
            addItemsToBackpack[] = {
                "rhs_100Rnd_762x54mmR_green"
            };
            backpack = "B_AssaultPack_blk";
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
            addItemsToBackpack[] = {
                "rhs_100Rnd_762x54mmR_green"
            };
            backpack = "B_AssaultPack_blk";
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

        class survivor_F: Soldier_F {
            primaryWeapon = "";
            primaryWeaponMagazine = "";
            primaryWeaponMuzzle = "";
            vest = "";
            backpack = "";
            addItemsToUniform[] = {};
        };
    };

    class Rank {
        class LIEUTENANT {

        };
    };
};
