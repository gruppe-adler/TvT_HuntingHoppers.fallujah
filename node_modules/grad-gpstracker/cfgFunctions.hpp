#ifndef MODULES_DIRECTORY
    #define MODULES_DIRECTORY modules
#endif

class grad_gpsTracker {
    class common {
        file = MODULES_DIRECTORY\grad-gpsTracker\functions;

        class addPFH {};
        class closeTitle {};
        class createGPS {};
        class getModuleRoot {};
        class initModule {preInit = 1;};
        class openDialog {};
        class openTitle {};
        class setTarget {};
        class updateArrow {};
        class updateBackground {};
        class updateDistance {};
        class updateReception {};
    };
};
