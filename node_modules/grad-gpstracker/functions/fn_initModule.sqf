#include "..\component.hpp"

grad_gpsTracker_lastBgUpdateTime = 0;

grad_gpsTracker_moduleRoot = [] call grad_gpsTracker_fnc_getModuleRoot;
[] call grad_gpsTracker_fnc_setTarget;
