# Simple Vehicle Respawn System

# Installation

You should know what the `description.ext` (aka *missionconfig*) is. If you don't, you can read about it [here](https://community.bistudio.com/wiki/Description.ext).

## Dependencies

* [CBA_A3](https://github.com/CBATeam/CBA_A3/releases)

## Installing Manually

1. Create a folder in your mission root folder and name it `modules`. Then create one inside there and call it `grad-vehicleRespawn`. If you want change the containing directory name you will have to adjust the MODULES_DIRECTORY definition
2. Download the contents of this repository (there's a download link in the sidebar) and put it into the directory you just created.
3. Append the following lines of code to the `description.ext`:

```sqf
class CfgFunctions {
  #include "modules\grad-vehicleRespawn\CfgFunctions.hpp"
};
```

## Adding Vehicle to respawn
Put at least the following in the Vehicle init:
```
[this] call GRAD_vehicleRespawn_fnc_add;
```

Further configuration
```
[
  this,   // vehicle
  false,  // false - respawns only when dead/cantmove | true – respawns as soon as space is available
  5       // interval in seconds in which respawn checks for condition
] call GRAD_vehicleRespawn_fnc_add;
```

## Vehicle Properties
Vehicle will spawn with same classname but *not* with same cargo but empty. To do this, you need to execute custom code.

## Custom Code

If you want to execute custom code on the vehicle, e.g. to fill up custom cargo, change skins or whatever put the following in the description.ext and replace myVehicleClassname with the classname of the vehicle for which the code should apply

```
class GRAD_vehicleRespawn {

    class myVehicleClassname {
        customCode = "(_this select 0) addMagazineCargoGlobal ['myMagazineClassname', 2]"; // _this select 0 is the vehicle
    };
};
```
