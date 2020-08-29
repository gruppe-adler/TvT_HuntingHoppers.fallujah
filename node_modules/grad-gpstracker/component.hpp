#ifndef MODULES_DIRECTORY
    #define MODULES_DIRECTORY modules
#endif

#define PREFIX      grad
#define COMPONENT   gpsTracker
#define SZW(var1)   (pixelW * pixelGrid * var1)
#define SZH(var1)   (pixelH * pixelGrid * var1)
#define PIC(var1)   #(MODULES_DIRECTORY\grad-gpsTracker\data\var1)

#include "\x\cba\addons\main\script_macros_mission.hpp"
